using System;
using Ink.Runtime;
using TMPro;
using Unity.Multiplayer.Center.Common;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;


public class inkStory : MonoBehaviour
{
    public static event Action<Story> OnCreateStory;

    [SerializeField] private Canvas canvas = null;
    [SerializeField] private GameObject ButtonHolder;
    [SerializeField] private bool choicecheck;

    // this the JSON
    public TextAsset JSONAsset;
    //this the story itself
    Story testStory;
    
    // dialogue text
    public TextMeshProUGUI DialogueText;
    // choice button ui
    public Button button;
   

   
    //int index = 0;

    public void Awake()
    {
        testStory = new Story(JSONAsset.text);
        if(OnCreateStory != null) OnCreateStory(testStory);
        ContinueStory();
    }

     public void Update()
     {
         if(Input.GetKeyDown(KeyCode.E) && choicecheck != true)
         {
           ContinueStory();
         }
     }


    public void ContinueStory()
    {
          //running through a loop to check if the story can continue
        if (testStory.canContinue)
        {
           DialogueText.text = testStory.Continue();
           Debug.Log("Story is continuing");
           choicecheck = false;
        }
        else
        {
            Choices();
            Debug.Log("CHOICE IS HERE");
        }
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
        //player presents their input, then...
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
		HorizontalLayoutGroup layoutGroup = choice.GetComponent<HorizontalLayoutGroup>();
		layoutGroup.childForceExpandHeight = true;

		return choice;
    }



}