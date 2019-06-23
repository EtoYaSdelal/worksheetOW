package org.fry.app.model;

import java.time.LocalDate;
import java.util.EnumMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

public class Person {

    private String id;
    private String name;
    private String surname;
    private String email;
    private LocalDate birthday;
    private String phone;
    private LocalDate registrationDate;

    private Map<About, String> about = new EnumMap<>(About.class);
    private Map<Education, String> education = new EnumMap<>(Education.class);
    private Map<Other, String> other = new EnumMap<>(Other.class);


    public Person() {
        id = UUID.randomUUID().toString();
        registrationDate = LocalDate.now();
    }

    public Person(String name, String surname, String email, LocalDate birthday) {
        this(UUID.randomUUID().toString(), name, surname, email, birthday);

    }

    public Person(String id, String name, String surname, String email, LocalDate birthday) {
        Objects.requireNonNull(id, "Id must not be null");
        Objects.requireNonNull(name, "Name must not be null");
        Objects.requireNonNull(name, "Surname must not be null");
        Objects.requireNonNull(email, "Email must not be null");
        Objects.requireNonNull(birthday, "Birthday must not be null");
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.birthday = birthday;
        registrationDate = LocalDate.now();
    }

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

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
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

    public void setAbout(About type, String s) {
        about.put(type, s);
    }

    public Map<Education, String> getEducation() {
        return education;
    }

    public void setEducation(Education type, String s) {
        education.put(type, s);
    }

    public Map<Other, String> getOther() {
        return other;
    }

    public void setOther(Other type, String s) {
        other.put(type, s);
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

    public LocalDate getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(LocalDate registrationDate) {
        this.registrationDate = registrationDate;
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
                "id=" + id + "\n" +
                "name=" + name + "\n" +
                "surname=" + surname + "\n" +
                "email=" + email + "\n" +
                "birthday=" + birthday + "\n" +
                "phone=" + phone + "\n" +
                "registration Date=" + registrationDate + "\n" +
                "about=" + about + "\n" +
                "education=" + education + "\n" +
                "other=" + other +
                '}' + "\n";
    }
}

