
using UnityEngine;
using UnityEngine.UI;

public class volumeslider : MonoBehaviour
{
    [SerializeField] Slider volumeSlider;
    public AudioSource Audiosource;
    public AudioClip audioClip;
    public bool sliderchange;
    // Start is called before the first frame update
    void Start()
    {
        if (!PlayerPrefs.HasKey("musicVolume"))
        {
            PlayerPrefs.SetFloat("musicVolume", 1);
            Load();
        }
        else
        {
            Load();
        }
    }

    void Update()
    {
        if (Input.GetKeyUp(KeyCode.Mouse0) && sliderchange)
        {
            Audiosource.PlayOneShot(audioClip);
            sliderchange = false;
        }
    }

    public void ChangeVolume()
    {
        AudioListener.volume = volumeSlider.value;
        sliderchange = true;
        Save();
    }

    private void Load()
    {
        volumeSlider.value = PlayerPrefs.GetFloat("musicVolume");
    }

    private void Save()
    {
        PlayerPrefs.SetFloat("musicVolume", volumeSlider.value);
    }
}
