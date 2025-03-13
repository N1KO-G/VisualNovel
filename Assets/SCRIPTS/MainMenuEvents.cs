using System.Collections.Generic;
using System.Xml.Serialization;
using UnityEngine;
using UnityEngine.UIElements;

public class MainMenuEvents : MonoBehaviour
{
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    private Button button;

    private UIDocument _document;

    private List<Button> menuButtons = new List<Button>();

    private AudioSource audiosource;

    private void Awake()
    {
        audiosource = GetComponent<AudioSource>();
        _document = GetComponent<UIDocument>();

        button = _document.rootVisualElement.Q("Start") as Button;
        button.RegisterCallback<ClickEvent>(OnPlayGameClick);

        menuButtons = _document.rootVisualElement.Query<Button>().ToList();

        for (int i = 0; i < menuButtons.Count; i++)
        {
            menuButtons[i].RegisterCallback<ClickEvent>(OnAllButtonsClick);
        }
    }

    private void OnAllButtonsClick(ClickEvent evt)
    {
        audiosource.Play();
    }

    private void OnDisable()
    {
        button.UnregisterCallback<ClickEvent>(OnPlayGameClick);

          for (int i = 0; i < menuButtons.Count; i++)
        {
            menuButtons[i].UnregisterCallback<ClickEvent>(OnAllButtonsClick);
        }
    }

    private void OnPlayGameClick(ClickEvent evt)
    {
        Debug.Log("You pressed the start button!");
    }
} 
