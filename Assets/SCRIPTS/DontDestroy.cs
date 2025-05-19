using Ink.Parsed;
using UnityEngine;
using UnityEngine.SceneManagement;

public class DontDestroy : MonoBehaviour
{
    public AudioSource audioSource;
    public AudioClip audioClip;

    public void Awake()
    {
        Scene scene = SceneManager.GetActiveScene();

        GameObject[] objs = GameObject.FindGameObjectsWithTag("music");
        if (objs.Length > 1)
        {
            Destroy(this.gameObject);
            return;
        }
        DontDestroyOnLoad(this.gameObject);

        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        if (scene.name == "settings" || scene.name == "main menu" || scene.name == "help" || scene.name == "end")
        {
        if (!audioSource.isPlaying) audioSource.Play();
        }
        else if(scene.name == "maingame")
        {
        audioSource.Pause();
        }
    }

void OnDestroy()
{
    SceneManager.sceneLoaded -= OnSceneLoaded;
}
}
  

 
