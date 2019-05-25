package util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DateFormatter {

    static public String myDateFormat(LocalDate date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        return date.format(formatter);
    }
}
