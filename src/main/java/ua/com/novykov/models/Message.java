package ua.com.novykov.models;

import lombok.*;

import javax.persistence.*;

@Entity
@Setter
@Getter
@NoArgsConstructor

public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String text;
    private String tag;
    private User author;

    public Message(String text, String tag) {
        this.text = text;
        this.tag = tag;
    }
}
