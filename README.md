# Flutter APP for DSP/TSE Raspberry Device

A Flutter-based app interface for monitoring and controlling a Raspberry Pi device, built with support for **Windows** and **Android** platforms. The app features a modular layout, real-time visualizations, customizable settings, and mock data designed to simulate future integration with hardware APIs and Python-based backend pipelines.

## Features

- **Cross-Platform Support**  
  Fully compatible with both **Windows** and **Android** devices.

- **Dashboard Overview**  
  Monitor host and Raspberry Pi system info, including gauges and performance metrics.

- **DSP / Noise Suppression**  
  Toggle noise suppression functionality and simulate signal data.

- **Analytics**  
  Visualize waveform activity and data trends using interactive Syncfusion charts and sliders.

- **Settings Panel**  
  Configure application appearance and preferences with light/dark theme support.

## Tech Stack

- **Flutter** (with Material 3 design)
- **Dart**
- **Syncfusion** UI packages:
  - [`syncfusion_flutter_charts`](https://pub.dev/packages/syncfusion_flutter_charts)
  - [`syncfusion_flutter_gauges`](https://pub.dev/packages/syncfusion_flutter_gauges)
  - [`syncfusion_flutter_sliders`](https://pub.dev/packages/syncfusion_flutter_sliders)
- [`waveform_flutter`](https://pub.dev/packages/waveform_flutter) for audio waveform visualization
- [`flutter_svg`](https://pub.dev/packages/flutter_svg) for vector asset rendering
- [`flex_color_scheme`](https://pub.dev/packages/flex_color_scheme) for theme management

## Architecture

The app is structured with:

- Reusable **card-based layouts** for system info and controls  
- Platform-adaptive **navigation** (bottom navigation bar for mobile, sidebar for desktop)  
- A combination of **Flutter packages**, **custom painters**, and **reusable widgets** for UI components and styling  
- **Mocked data sources** that simulate integration with Python backends and Raspberry Pi APIs  

## Screenshots

View the screenshots in the [`/screenshots`](./screenshots) folder of this repository.

## Getting Started

```bash
# Clone the repo
git clone https://github.com/your-org/raspberry-pi-interface-app.git
cd raspberry-pi-interface-app

# Get dependencies
flutter pub get

# Run on Windows
flutter run -d windows

# Or run on Android
flutter run -d android
```

## User Acceptibility Testing

## ✅ User Acceptance Test Cases – Flutter Companion App

| Test Case ID | Test Scenario              | Test Description                                                              | Expected Result                                                | Actual Result            | Status              |
|--------------|----------------------------|-------------------------------------------------------------------------------|----------------------------------------------------------------|---------------------------|---------------------|
| UAT-01       | Toggle Controls            | Verify that toggles and sliders across DSP settings respond to user input    | UI controls change state and values update visually            | Works as expected         | ✅ Passed            |
| UAT-02       | View System Metrics & Charts | Confirm CPU, memory, mic status, and system charts display changing mock data | Metrics and visualizations (charts/gauges) update as intended  | Works as expected         | ✅ Passed            |
| UAT-03       | Switch Themes              | Switch between light, dark, and system theme modes                            | App updates UI appearance according to selected theme          | Works as expected         | ✅ Passed            |
| UAT-04       | Navigate Between Pages     | Tap on navigation elements to change between sections                         | Correct screen loads without layout issues                     | Works as expected         | ✅ Passed            |
| UAT-05       | Simulate Waveform          | Ensure waveform visualizer animates to reflect simulated audio data           | Waveform updates in sync with mock values                      | Works as expected         | ✅ Passed            |
| UAT-06       | Display on Multiple Devices | Test layout behavior across Android and Windows devices                       | Responsive layout adjusts to screen size and platform          | Minor overflow on Android | ☑️ Passed with note  |
| UAT-07       | Platform-aware Navigation  | Confirm correct navigation behavior per platform (bottom nav vs sidebar)      | Navigation type switches based on target platform              | Works as expected         | ✅ Passed            |
| UAT-08       | Visual Consistency         | Check for visual and spacing consistency across components                    | Uniform design language with no visual anomalies               | Works as expected         | ✅ Passed            |
| UAT-09       | Simulated Data Handling    | Validate how mock services provide simulated values to UI                     | Simulated values display properly (charts, metrics, waveform)  | Not applicable (mock-only phase) | ⚠️ Not Applicable  |
