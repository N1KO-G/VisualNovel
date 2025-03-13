using UnityEngine;
using TMPro;
using System.Collections;

public class DialogueManager : MonoBehaviour
{
    public TextMeshProUGUI DialogueText;
    public string[] Sentences;
    private int index;
    public float typingSpeed;
    [SerializeField] bool isTyping = false;

    void Awake()
    {
      StartCoroutine(Type());   
    }

    void Update()
    {
        if(DialogueText.text == Sentences[index])
        {
            isTyping = true;
        }
        else
        {
            isTyping = false;
        }

        if (Input.GetKeyDown(KeyCode.KeypadEnter) || Input.GetKeyDown(KeyCode.Mouse0) && isTyping)
        {
            NextDialogue();
        }
    }

    IEnumerator Type()
    {
        foreach(char letter in Sentences[index].ToCharArray())
        {
            DialogueText.text += letter;
            yield return new WaitForSeconds(typingSpeed);
        }
    }

    public void NextDialogue()
    {
        if(index < Sentences.Length - 1)
        {
            index++;
            DialogueText.text = "";
            StartCoroutine(Type());
        }
        else 
        {
            DialogueText.text = "";
        }
    }


}
