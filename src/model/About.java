package model;

public enum About {

    INTEREST("Чем Вам было бы интересно заниматься? *"),
    COMMENT("Ваши комментарии"),
    SKILL("Расскажите о своих знаниях компьютерных технологий, прикладного ПО, языков программирования: *"),
    EXPERIENCE("Опыт работы (если имеется)"),
    ENGLISH("Уровень английского языка *");


    private final String title;

    About(String title) {
        this.title = title;
    }
}
