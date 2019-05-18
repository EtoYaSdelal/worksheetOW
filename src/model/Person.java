package model;

import java.time.LocalDateTime;
import java.util.EnumMap;
import java.util.Map;
import java.util.Objects;

public class Person {

    private String id;
    private String name;
    private String surname;
    private String email;
    private LocalDateTime birthday;
    private String phone;

    private Map<About, String> about = new EnumMap<>(About.class);
    private Map<Education, String> education = new EnumMap<>(Education.class);
    private Map<Other, String> other = new EnumMap<>(Other.class);


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDateTime getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDateTime birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Map<About, String> getAbout() {
        return about;
    }

    public void setAbout(Map<About, String> about) {
        this.about = about;
    }

    public Map<Education, String> getEducation() {
        return education;
    }

    public void setEducation(Map<Education, String> education) {
        this.education = education;
    }

    public Map<Other, String> getOther() {
        return other;
    }

    public void setOther(Map<Other, String> other) {
        this.other = other;
    }

    public String getAbout(About type) {
        return about.get(type);
    }

    public String getEducation(Education type) {
        return education.get(type);
    }

    public String getOther(Other type) {
        return other.get(type);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Person person = (Person) o;
        return id.equals(person.id) &&
                name.equals(person.name) &&
                Objects.equals(surname, person.surname) &&
                email.equals(person.email) &&
                birthday.equals(person.birthday) &&
                Objects.equals(phone, person.phone) &&
                about.equals(person.about) &&
                education.equals(person.education) &&
                other.equals(person.other);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, surname, email, birthday, phone, about, education, other);
    }


    @Override
    public String toString() {
        return "Person{" +
                "id='" + id + '\n' +
                ", name='" + name + '\n' +
                ", surname='" + surname + '\n' +
                ", email='" + email + '\n' +
                ", birthday=" + birthday +
                ", phone='" + phone + '\n' +
                ", about=" + about + "\n" +
                ", education=" + education + "\n" +
                ", other=" + other +
                '}' + "\n";
    }
}

