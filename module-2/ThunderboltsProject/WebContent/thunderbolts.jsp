<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<!-- Adrian Marquez
	 Module 2 Assignment
	 June 2, 2025
	 CSD 430
	 The purpose of this assignment is to build a dynamic, styled web page using JSP scriptlets to display meaningful 
	 data in a structured format. 
-->
<head>
    <meta charset="UTF-8">
    <title>The Thunderbolts & Mental Health</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="container"></div>
    <h1>The Thunderbolts: A Look Through Mental Health</h1>
    <p>
        The Thunderbolts* features a group of morally complex characters in the Marvel universe.
        Each one has a troubled past, making the film a great backdrop to explore mental health themes such as trauma, redemption, and resilience.
        As someone who has struggled most of his life with mental health issues, I felt that this film brought mental health to the big screen, and 
        exposed it to a wider audience.
    </p>

    <%
        // Define a class to hold character info
        class CharacterProfile {
            String name;
            String struggle;
            String mentalHealthMessage;

            CharacterProfile(String name, String struggle, String mentalHealthMessage) {
                this.name = name;
                this.struggle = struggle;
                this.mentalHealthMessage = mentalHealthMessage;
            }
        }

        // Create a list of character profiles
        ArrayList<CharacterProfile> characters = new ArrayList<CharacterProfile>();
        characters.add(new CharacterProfile("Bucky Barnes", "PTSD from being used as an assassin", "Recovery takes time; healing is possible with support."));
        characters.add(new CharacterProfile("Yelena Belova", "Loss and grief over Natasha", "Grief is not weakness, but a part of love."));
        characters.add(new CharacterProfile("Red Guardian", "Living in past glories and regret", "Letting go of the past is part of growing."));
        characters.add(new CharacterProfile("Ghost (Ava Starr)", "Physical pain and isolation", "Chronic pain can lead to emotional strain. Compassion matters."));
        characters.add(new CharacterProfile("John Walker", "Disgrace and identity crisis", "Mistakes don’t define you. How you grow does."));
        characters.add(new CharacterProfile("Bob", "Fear, insecurity, and comic relief masking pain", "Laughter can be healing, but everyone deserves to be taken seriously."));
    %>

    <h2>Thunderbolts Character Analysis</h2>
    <table>
        <tr>
            <th>Character</th>
            <th>Struggle</th>
            <th>Mental Health Message</th>
        </tr>
        <%
            for (CharacterProfile cp : characters) {
        %>
        <tr>
            <td><%= cp.name %></td>
            <td><%= cp.struggle %></td>
            <td><%= cp.mentalHealthMessage %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>