package model;

public enum Other {
    OPENDAY("Я планирую прийти на день открытых дверей и послушать презентацию Школы"),
    HEARFROM("Откуда Вы узнали о Летней школе?"),
    AGREEMENT("Отправляя эту форму, я соглашаюсь на обработку своих персональных данных, согласно с политике Конфиденциальности OpenWay");

    private final String title;

    Other(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }
}
