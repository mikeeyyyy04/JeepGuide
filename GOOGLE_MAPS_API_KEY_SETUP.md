# How to Add Google Maps API Key

## Step 1: Get Your Google Maps API Key

1. **Go to Google Cloud Console**
   - Visit: https://console.cloud.google.com/
   - Sign in with your Google account

2. **Create or Select a Project**
   - Click on the project dropdown at the top
   - Click "New Project" or select an existing project
   - Give it a name (e.g., "JeepGuide App")
   - Click "Create"

3. **Enable Required APIs**
   - In the left sidebar, go to "APIs & Services" > "Library"
   - Search for "Maps SDK for Android" and click on it
   - Click "Enable"
   - Repeat for "Maps SDK for iOS" (if developing for iOS)

4. **Create API Key**
   - Go to "APIs & Services" > "Credentials"
   - Click "Create Credentials" > "API Key"
   - Copy your API key (it will look like: `AIzaSy...`)

5. **Restrict Your API Key (Recommended for Security)**
   - Click on your newly created API key
   - Under "Application restrictions", select "Android apps"
   - Click "Add an item"
   - Enter your package name: `com.example.jeepguide` (check your `android/app/build.gradle` for the actual package name)
   - Enter your SHA-1 certificate fingerprint (optional but recommended)
   - Under "API restrictions", select "Restrict key"
   - Choose "Maps SDK for Android" and "Maps SDK for iOS"
   - Click "Save"

## Step 2: Add API Key to Android

1. **Open the AndroidManifest.xml file**
   - Location: `jeepguide/android/app/src/main/AndroidManifest.xml`

2. **Replace the placeholder**
   - Find this line:
     ```xml
     <meta-data
         android:name="com.google.android.geo.API_KEY"
         android:value="YOUR_GOOGLE_MAPS_API_KEY" />
     ```
   - Replace `YOUR_GOOGLE_MAPS_API_KEY` with your actual API key:
     ```xml
     <meta-data
         android:name="com.google.android.geo.API_KEY"
         android:value="AIzaSyYourActualAPIKeyHere" />
     ```

## Step 3: Add API Key to iOS (If Developing for iOS)

1. **Open AppDelegate.swift**
   - Location: `jeepguide/ios/Runner/AppDelegate.swift`

2. **Add the Google Maps import and API key**
   - Add this at the top:
     ```swift
     import GoogleMaps
     ```
   - Add this line in the `didFinishLaunchingWithOptions` method before `GeneratedPluginRegistrant.register`:
     ```swift
     GMSServices.provideAPIKey("YOUR_GOOGLE_MAPS_API_KEY")
     ```

3. **Add Location Permissions to Info.plist**
   - Open `jeepguide/ios/Runner/Info.plist`
   - Add these keys before the closing `</dict>` tag:
     ```xml
     <key>NSLocationWhenInUseUsageDescription</key>
     <string>This app needs location access to show your current position on the map</string>
     <key>NSLocationAlwaysUsageDescription</key>
     <string>This app needs location access to show your current position on the map</string>
     ```

## Step 4: Verify Setup

1. **Run the app**
   ```bash
   flutter run
   ```

2. **Test the Maps page**
   - Navigate to the Maps page
   - You should see Google Maps loading
   - Your current location should be tracked and displayed

## Troubleshooting

- **Maps not loading**: Check that your API key is correct and the Maps SDK is enabled
- **Location not working**: Ensure location permissions are granted in device settings
- **API key errors**: Verify that your API key restrictions match your app's package name and SHA-1 fingerprint

## Important Notes

- Keep your API key secure and never commit it to public repositories
- Consider using environment variables or a secrets file for production apps
- The free tier of Google Maps API includes $200 credit per month, which is usually enough for development

