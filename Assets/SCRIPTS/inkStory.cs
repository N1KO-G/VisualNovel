using System;
using Ink.Runtime;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;
using System.Collections;
using Random = UnityEngine.Random;
using UnityEditor.Overlays;
using Unity.VisualScripting;





public class inkStory : MonoBehaviour
{
    public static event Action<Story> OnCreateStory;

   
    [SerializeField] private GameObject ButtonHolder;
    [SerializeField] private bool choicecheck;
    [SerializeField] private bool hasSpeakerTag;
    [SerializeField] private bool hasTextstyleTag;
     [SerializeField] private bool hasEmotionTag;
    [SerializeField] private bool isTyping = false;
    [SerializeField] public bool fading = false;

    // this the JSON
    public TextAsset JSONAsset;
    //this the story itself
    Story testStory;

    //canvas
    public CanvasGroup canvasGroup2;
    
    //audio 
    public AudioSource audioSource;
    public AudioClip textSound;

    //text
    public TextMeshProUGUI DialogueText;
    public TextMeshProUGUI SpeakerText;
    private string fullline;
    // choice button ui
    public Button button;

    //animator/animation stuff
    public Animator emotionanimator;
    public Animator layoutanimator;
    public CanvasGroup canvasGroup;
    private string layout;

    //images
    public SpriteRenderer spriteHolder;
    public SpriteRenderer spriteHolder2;
    public Sprite[] spritelist;
    private string imagename;
    public Animator fadeinAnimator;

    RectTransform buttonholderRT;
  

    //tags
    private const string SPEAKER_TAG = "speaker";
    private const string TEXTSTYLE_TAG = "textstyle";
    private const string EMOTION_TAG = "emotion";
    private const string LAYOUT_TAG = "layout";
    private const string IMAGE_TAG = "image";
 

    //speaker holder
    private string currentspeaker;
    private string fadetiming;
    private string emotion;


    //coroutine
    private Coroutine typingcoroutine;



    public void Awake()
    {
        buttonholderRT = ButtonHolder.GetComponent<RectTransform>();
        testStory = new Story(JSONAsset.text);
        if(OnCreateStory != null) OnCreateStory(testStory);
        ContinueStory();
    }

     public void Update()
     {
         if(Input.GetKeyDown(KeyCode.E) && !fading)
         {
           if (isTyping)
           {
            SkipTyping();
           }
           else if(!choicecheck)
           {
             ContinueStory();
           }
         }

          if(fading)
           {
             canvasGroup2.alpha = 0;
             canvasGroup2.interactable = false;
             canvasGroup2.blocksRaycasts = false;
           }
         else
         {
             canvasGroup2.alpha = 1;
             canvasGroup2.interactable = true;
             canvasGroup2.blocksRaycasts = true;
         }
     }




    public void ContinueStory()
    {

    
          //running through a loop to check if the story can continue
        if (testStory.canContinue)
        {
           string line = testStory.Continue();
           fullline = line;
           Debug.Log("Story is continuing");

           if(typingcoroutine != null)
           {
            StopCoroutine(typingcoroutine);
           }

           
           typingcoroutine = StartCoroutine(Typing(line));

           Handletags(testStory.currentTags);

           choicecheck = true;
        }
        else
        {
            Choices();
            Debug.Log("CHOICE IS HERE");
        }
    }

    private void Handletags(List<string> currentTags)
    {
         hasSpeakerTag = false;
         hasTextstyleTag = false;
         hasEmotionTag = false;

        foreach(string tag in currentTags)
        {
            string[] splitTag = tag.Split(':');

            if(splitTag.Length != 2)
            {
                Debug.Log("tag cant be parsed:" + tag);
            }

            string tagKey = splitTag[0].Trim();
            string tagValue = splitTag[1].Trim();
    

        switch(tagKey)
         {
            case SPEAKER_TAG:
            SpeakerText.text = tagValue;
            currentspeaker = tagValue.ToLower();
            hasSpeakerTag = true;
                break;
            case TEXTSTYLE_TAG:
                DialogueText.fontStyle = FontStyles.Italic;
                hasTextstyleTag = true;
                break;
            case EMOTION_TAG:
            emotion = tagValue.ToLower();
            emotionanimator.Play(emotion);
            hasEmotionTag = true;
            break;
            case LAYOUT_TAG:
            layout = tagValue.ToLower();
            break;
            case IMAGE_TAG:
            imagename = tagValue.ToLower();
            break;
            default:
            Debug.LogWarning("tag is not possible " + tag);
            break;
         }
        }

        if(!hasTextstyleTag)
        {
            DialogueText.fontStyle = FontStyles.Normal;
        }

        if(!hasSpeakerTag)
        {
            SpeakerText.text = "";
        }

        emotionLayout();
        backgroundimage();
       
    }

    public void ChoiceButtonClick(Choice choice)
    {
        if(choice != null && choice.index < testStory.currentChoices.Count)
        {
        testStory.ChooseChoiceIndex(choice.index);
        ContinueStory();
        Choices();
        }
        else{
            Debug.Log("Choice invalid or out of range");
        }
    }

    public void Choices()
    {
        foreach(Transform child in ButtonHolder.transform)
        {
            Destroy(child.gameObject);
        }
        
        //when it finds no more content, it can check for choices and show them to the player like this
        if(testStory.currentChoices.Count > 0)
        {
             for (int i = 0; i < testStory.currentChoices.Count; i++)
             {
                Choice choice = testStory.currentChoices[i];

                Button button = ChoiceButtons(choice.text.Trim());
                button.onClick.AddListener(delegate{ChoiceButtonClick(choice);});
                int ChoiceIndex = choice.index;
                choicecheck = true;
             }
        }
      
    }

    public void ClickButton(Choice choice)
    {
        testStory.ChooseChoiceIndex(choice.index);
    }

    Button ChoiceButtons(string text)
    {
        // Creates the button from a prefab
		Button choice = Instantiate (button) as Button;
		choice.transform.SetParent (ButtonHolder.transform, false);
        
        
		
		// Gets the text from the button prefab
		TextMeshProUGUI choiceText = choice.GetComponentInChildren<TextMeshProUGUI> ();
		choiceText.text = text;


		// Make the button expand to fit the text
		VerticalLayoutGroup layoutGroup = choice.GetComponent<VerticalLayoutGroup>();
        LayoutRebuilder.ForceRebuildLayoutImmediate(buttonholderRT);
		layoutGroup.childForceExpandHeight = true;
        layoutGroup.childScaleHeight = false;


        

		return choice;
    }

    private IEnumerator Typing(string text)
    {
       
       DialogueText.text = "";
       isTyping = true;

       foreach(char c in text)
       {
         if (currentspeaker == "you" && hasSpeakerTag)
         {
            audioSource.pitch = Random.Range(1, 1.3f);
            audioSource.PlayOneShot(textSound);
         }
         else if (currentspeaker == "her" && hasSpeakerTag)
         {
            audioSource.pitch = Random.Range(0.5f, 0.8f);
            audioSource.PlayOneShot(textSound);
         }
         else if (!hasSpeakerTag)
         {
            audioSource.Stop();
         }
       
        DialogueText.text += c;
        yield return new WaitForSeconds(0.015f);
       }

        

       choicecheck = false;
       isTyping = false;
       
    }

    public void SkipTyping()
     {
        StopCoroutine(typingcoroutine);
        DialogueText.text = testStory.currentText;

        DialogueText.text = fullline;
        choicecheck = false;
        isTyping = false;
     }


    public void emotionLayout()
    {

        if (layout == "left" && hasEmotionTag)
        {
            canvasGroup.alpha = 1;
            canvasGroup.interactable = true;
            layoutanimator.Play("left");
                Debug.Log("left");
        }
        else if(layout == "right" && hasEmotionTag)
        {
            canvasGroup.alpha = 1;
            canvasGroup.interactable = true;
            layoutanimator.Play("right");
            Debug.Log("right");
        }
        else
        {
            canvasGroup.alpha = 0;
            canvasGroup.interactable = false;
        }
    }

    public void backgroundimage()
    {
    
        switch(imagename)
        {
            case "black" : spriteHolder.sprite = spritelist[0];  break;
            case "day1" : spriteHolder2.sprite = spritelist[1]; fadeinAnimator.Play("fadein"); StartCoroutine(timer(5f));break;
            case "background1" : spriteHolder.sprite = spritelist[2];  break;
            case "radio1" : spriteHolder.sprite = spritelist[3];  break;
            case "drawer1" : spriteHolder.sprite = spritelist[4];  break;
            case "closet1" : spriteHolder.sprite = spritelist[5];  break;
            case "vent1" : spriteHolder.sprite = spritelist[6];  break;
            case "bedimage" : spriteHolder.sprite = spritelist[7];  break;
             case "lightnote" : spriteHolder.sprite = spritelist[8];  break;
             case "day2" : spriteHolder2.sprite = spritelist[9]; fadeinAnimator.Play("fadein"); StartCoroutine(timer(3f));break;
            case "day3" : spriteHolder2.sprite = spritelist[10]; fadeinAnimator.Play("fadein"); StartCoroutine(timer(3f));break;
            case "bednote" : spriteHolder.sprite = spritelist[11];  break;
            case "door1" : spriteHolder.sprite = spritelist[12];  break;
             case "lightshot1" : spriteHolder.sprite = spritelist[13];  break;
             case "gunshot1" : spriteHolder.sprite = spritelist[14];  break;

            
        }
        
    }
    
    public IEnumerator timer(float fadetime)
    {
        fading = true;
        yield return new WaitForSeconds(fadetime);
        fading = false;
        ContinueStory();
    }

}