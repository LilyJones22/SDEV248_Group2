# Lab Rat Escape — Team Project

_A 2D Action Platformer Built in Godot 4_

---

## Project Overview

**Lab Rat Escape** is a 2D action-platformer where the player controls a lab rat who gains intelligence during a failed experiment.  
With the lab in chaos, Scraps must escape while avoiding infected creatures and interacting with a friendly scientist named **Dr. Godot**.

### This project includes:

- 1 fully playable level
- Intro + success + failure cutscenes
- 1 NPC (Scientist / Dr. Godot)
- 2 unique MOBs (Frog + Cat) with simple AI
- Player movement, animations, physics, and collisions
- Event triggers & interactable zones
- Cartoon-style custom sprites and tileset

---

## Team Roles & Responsibilities

### **Krystal — Pre-Development & Core Setup**

- Created storyline, characters, and game concept
- Designed all sprite sheets (rat, scientist, frog, cat)
- Created tileset + seamless background
- Set up Godot project structure
- Built initial Level1 scene with TileMap & collisions
- Implemented player movement, animations, and camera limits
- Added NPC interaction trigger
- Added frog & cat enemy scenes with basic patrol/attack behavior
- Wrote project documentation

### **Jacob — Gameplay Programming**

- Will implement health system (heart HUD)
- Add damage, knockback, and player death
- Build dialogue UI for Dr. Godot
- Implement intro + ending cutscenes
- Polish enemy behaviors
- Add scene transitions and menus

### **Lily — Level Design & Environment**

- Will build full level layout using TileMap
- Add platforms, vents, props, and decorations
- Integrate enemies and NPCs logically
- Polish visual flow and environment storytelling
- Prepare areas for cutscene triggers

---

## Project Folder Structure

```text
res://
│
├── assets/
│   ├── backgrounds/
│   └── sprites/
│       ├── player/
│       ├── enemies/
│       └── npc/
│
├── scenes/
│   ├── player/
│   ├── enemies/
│   ├── npc/
│   └── levels/
│
└── scripts/
```
