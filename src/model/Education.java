package model;

public enum Education {

    INSTITUTION("Университет"),
    FACULTY("Факультет"),
    DEPARTMENT("Кафедра"),
    ENTRYYEAR("Год поступления");

    private final String title;

    Education(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

}
