using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class buttonscript : MonoBehaviour
{

    public void LoadScene(string scenename)
    {
        SceneManager.LoadScene(scenename);
        Debug.Log("yummers");
    }

    public void Quit()
    {
        Application.Quit();
    }
}
