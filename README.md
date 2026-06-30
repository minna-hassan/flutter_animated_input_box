# 🎨 Animated AI Input Box

A Flutter UI experiment that recreates a modern AI-style input box. It features an animated rotating gradient border, an adjustable neon glow effect, and a smooth expansion when the input field gains focus.

---

## 🎬 Preview

https://github.com/user-attachments/assets/a1c178b2-baa5-4662-a348-1da927d7121e

---

## ⚡ Designed for Responsive Interactions

Modern interfaces feel best when visual feedback is immediate. This project focuses on creating a responsive input experience by combining smooth layout animations with a custom-painted animated border.

The result is an input box that expands naturally when focused while maintaining a clean layout and fluid visual transitions.

---

## ✨ Features

* **Rotating Gradient Border** – A neon-inspired gradient border that continuously rotates while the input field is active.
* **Smooth Expansion** – The input box expands when focused using Flutter's built-in animation system.
* **Adjustable Glow Effect** – Optional glow rendering with configurable blur intensity.
* **Reusable Action Buttons** – Modular attachment and microphone buttons that can be reused throughout the application.
* **Responsive Layout** – Scales using screen dimensions and maintains consistent spacing across different device sizes.
* **CustomPainter Rendering** – Uses Flutter's Canvas API to render the animated border and glow effect.

---

## 🧩 Project Structure

```text
lib/
├── main.dart                    # Application UI, focus handling, and animation logic
├── gradient_border_painter.dart # Custom painter for the animated border and glow
└── action_buttons.dart          # Reusable action button widgets
```

---

## 🛠 Technologies Used

* Flutter
* Dart
* CustomPainter
* AnimationController
* FocusNode
* AnimatedContainer
* Canvas API

---

## 🚀 Getting Started

Clone the repository:

```bash
git clone <your-repository-url>
```

Navigate to the project directory:

```bash
cd flutter-neon-input
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## 📚 What I Learned

This project provided hands-on experience with:

* Building custom UI effects using `CustomPainter`
* Managing animation lifecycles with `AnimationController`
* Handling focus-driven state changes with `FocusNode`
* Combining custom rendering with Flutter's layout system
* Creating reusable and responsive UI components

---

## 🔮 Future Improvements

* Dynamic multi-line input growth
* Send button animations
* Additional action shortcuts
* Theme customization options
* Accessibility enhancements

---

## 📄 License

Free to use for learning and personal projects. Attribution is appreciated .
