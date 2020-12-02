package com.github.kuzoncby.websocketdemo.model;

import lombok.Data;

/**
 * Updated by kuzoncby on 2020-12-02.
 */
@Data
public class ChatMessage {
    private MessageType type;
    private String content;
    private String sender;

    public enum MessageType {
        CHAT, JOIN, LEAVE
    }
}
