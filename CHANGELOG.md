## Change Log
**7.13.0**
- TVP-59245 [iOS/tvOS] Remove case sensitivity for parsing extensions and extension nodes in SMRX ad response

**7.12.0**
- TVP-53059 [iOS/tvOS] Update OMSDK to version 1.5.6

- TVP-53009 [iOS/tvOS] Update AdManager for iOS/tvOS 26

**7.11.0**
- TVP-50340 [iOS/tvOS] Distribute in Swift Package Manager
    - AdManager XCFramework is now available as a Swift Package.
    - Add the following repository URL to your project: https://github.com/FreeWheelVIS/FWAdManager_Apple.
    - The package automatically includes both iOS and tvOS frameworks.
    - Add "import AdManager" in your code.

- TVP-51151 [iOS/tvOS] Add FWQRCodeExtension to support displaying a QR code for the first click-through URL on video ads.
    - New Constants
        - FWParameterExtensionQRCodeWidth
            - An NSString that the FWQRCodeExtension should use for the QR code width.
                - If the parameter is set, the FWQRCodeExtension will use this value as the QR code width.
                - The default value is @"150".
                - Valid range: 50-500 pixels.
        - FWParameterExtensionQRCodeHeight
            - An NSString that the FWQRCodeExtension should use for the QR code height.
                - If the parameter is set, the FWQRCodeExtension will use this value as the QR code height.
                - The default value is @"150".
                - Valid range: 50-500 pixels.
        - FWParameterExtensionQRCodeOffsetX
            - An NSString that the FWQRCodeExtension should use for horizontal positioning offset.
                - If the parameter is set, the FWQRCodeExtension will use this value for horizontal offset.
                - The default value is @"10".
                - Valid range: 0-1000 pixels.
        - FWParameterExtensionQRCodeOffsetY
            - An NSString that the FWQRCodeExtension should use for vertical positioning offset.
                - If the parameter is set, the FWQRCodeExtension will use this value for vertical offset.
                - The default value is @"10".
                - Valid range: 0-1000 pixels.
        - FWParameterExtensionQRCodeErrorCorrectionLevel
            - An NSString that the FWQRCodeExtension should use for QR code error correction level.
                - If the parameter is set, the FWQRCodeExtension will use this value for error correction.
                - The default value is @"Q".
                - Valid values: @"L" (Low), @"M" (Medium), @"Q" (Quartile), @"H" (High).
                - Higher correction levels provide better error recovery but may result in larger QR codes.
        - FWParameterExtensionQRCodeCornerRadius
            - An NSString that the FWQRCodeExtension should use for QR code corner radius.
                - If the parameter is set, the FWQRCodeExtension will use this value for corner radius.
                - The default value is @"0.0".
                - Valid range: 0.0-50.0 pixels.
                - 0.0 creates square corners, higher values create more rounded corners.
        - FWParameterExtensionQRCodeAlpha
            - An NSString that the FWQRCodeExtension should use for QR code transparency.
                - If the parameter is set, the FWQRCodeExtension will use this value for transparency.
                - The default value is @"1.0".
                - Valid range: 0.0-1.0.
                - 0.0 is fully transparent, 1.0 is fully opaque.

**7.10**
- TVP-44176 [iOS/tvOS] Support retrieving Extensions data from Smart XML and third-party VAST responses and replace [adInstance vastExtensionsWithType] API with [adInstance getExtensionByType]
    - New API: [adInstance getAllExtensions]
        - Returns an array of all extensions.
    - New API: [adInstance getExtensionByType]
        - Returns an array of extensions whose type matches the string passed as an argument to getExtensionsByType.
        - Replaces [adInstance vastExtensionsWithType] API. 
        - Clients may still access extensions from VAST by using the owner attribute to filter out Extensions whose owner is 'Freewheel'.

**7.9.**
- TVP-30914 [iOS/tvOS] Deprecate static library
    - Starting with V7.9, static AdManager has been deprecated and only dynamic AdManager is distributed in a multi-platform XCFramework for iOS and tvOS.
    - To include the dynamic framework in your project, add "#import <AdManager/AdManager.h>" to your code.
- TVP-43748 [iOS/tvOS] Support retrieving UniversalAdId value from node value
    - Update [FWAdInstance getUniversalAdId] method to return the universal ad ID from node value, and will fallback to the value in the idValue attribute if the universal ad ID node value is not found.

**7.8.0**
- TVP-15206 [iOS/tvOS] Fix fallback ad parsing logic on nested fallback ads

**7.7.0**
- TVP-32069 [iOS/tvOS] Support VAST 4.2 Icons node. (https://iabtechlab.com/wp-content/uploads/2019/06/VAST_4.2_final_june26.pdf section 3.11)
	- New API: [FWAdInstance getIcons]
	- Returns an NSData obect containing the Icons element from the third party VAST file.
	- The NSData object can be parsed with the native NSXMLParser, or libxml, a commonly used library.
	- This API should only be called after the VAST parsing is complete (e.g., after receiving the defaultImpression event).

**7.6**
- TVP-25434 [iOS/tvOS] Update OMSDK to version 1.5.2

**7.5.0**
- TVP-20184 [iOS/tvOS] Fix an issue where third party inline VAST error tracking URLs are not fired correctly.
- TVP-20706 [iOS/tvOS] Update iOS/tvOS SDK to iOS 18
- TVP-27490 [iOS] Remove support for BlueKai extension.

**7.4.0**
- TVP-19054 [iOS] Remove FWConstants.FWParameterSIMIDRendererCreativeTimeoutDelay as SIMID creative will not time out until the end of media playback.

- TVP-15200 [iOS] Support for SIMID errors 1212 and 1213, and various enhancements for SIMIDRenderer, including:
    - Added support for error codes 1212 (creative not responding to INIT) and 1213 (creative not responding to START_CREATIVE), which will be fired as VAST errors if the creative does not resolve or reject before the end of ad video playback
    - Added support for firing error codes passed by the creative when sending Creative FATAL_ERROR, or when rejecting INIT or START_CREATIVE as VAST errors
    - Error code 1223, SESSION_NOT_CREATED, will now be fired as a VAST error
    - Added logic to prevent the posting of SIMID Player or Media messages if the INIT message has not been resolved or rejected, in order to align with IAB spec
        - Any SIMID messages that were fired before the INIT message resolves will be cached and fired if the creative resolves INIT before the end of ad video playback

**7.3.0**
- TVP-11220 [iOS/tvOS] VAST 4.1 - Support the VAST macros [CONTENTPLAYHEAD], [MEDIAPLAYHEAD] and [ADPLAYHEAD] in tracking URLs returned by VAST responses
    - For further information, please refer to the IAB VAST4 doc section 3.11 and 7.1 (https://interactiveadvertisingbureau.github.io/vast/vast4macros/vast4-macros-latest.html)

- TVP-11217 [iOS/tvOS] - Added New API to AdInstance
	- isFallbackAd - returns BOOL value indicating whether the ad instance is a fallback ad or not.

**7.2.0**
- TVP-11013 [tvOS] Fix an issue of CFBundleShortVersionString missing in info.plist file in the 7.1.0 tvOS Dyanmic XCFramework.

- TVP-6302 [iOS] Update SIMIDRenderer to support SIMID:Creative:requestNavigation
	- If the uri provided by the creative is valid, AdManager will open the uri in a webview
	- If the uri provided by the creative is invalid, AdManager will post reject with errorCode 1214 

- FW-176401 [iOS] cleaned up FWHTMLRenderer code to remove iOS deprecation build warnings

- TVP-3793 [iOS/tvOS] Update logic for when FWCapabilityRecordVideoView is set
    - When set, 'recordVideoView' will replace 'requiresVideoCallbackUrl' capability flag in the ad request, and AdManager will not fire video view callbacks. Instead, one video view event will be recorded by the ad server for each ad request.

- TVP-5303 [iOS] Update SIMIDRenderer to support SIMID:Creative:clickThru
	- url will take precedence over uri when both are present in the Creative:clickThru message.
	- When playerHandles is set to true but url and uri are both empty, AdManager will post reject with errorCode 1214 and open window with url booked in MRM UI or VAST clickthru url.

**7.1.0**
- FW-186450 [iOS/tvOS] Update OMSDK to 1.4.12 and update Privacy Manifest with relevant OMSDK information

- FW-185706 [iOS] Parse multiple InteractiveCreativeFile nodes.
    - Update VAST parsing logic to handle VAST files with multiple InteractiveCreativeFile nodes.
    - For SIMID ads, AdManager will select the first InteractiveCreateFile node with valid SIMID attributes (i.e., type="text/html" and apiFramework="SIMID") for ad playback.

- TVP-917 [iOS/tvOS] Release iOS and tvOS AdManager in a multiplatform XCFramework.
    - static or dynamic AdManager is distributed in a multiplatform XCFramework for iOS and tvOS.
    - iOS and tvOS AdManager change log merged together going forward.
    - Fix an issue that FWSkippableAdExtension is not correctly loaded in dynamic iOS AdManager.

**7.0.0**
- FW-175516 [iOS/tvOS] Add Privacy Manifest
    - Starting in Spring 2024, App Store connect will require apps that use a required reason API to contain a privacy manifest declaring the reason for the use of the API. One of these APIs is UserDefaults, which AdManager uses to retrieve GDPR, USPAPI and GPP consent values, per the IAB specifications.
    - Due to limitations preventing the inclusion of bundle resources with static libraries, the privacy manifest is not available in the static AdManager distribution. Only the dynamic AdManager distribution includes the privacy manifest.

**6.60.0**
- FW-172892 [iOS] Release SIMID Renderer, to support playback of SIMID creatives.
    - The SIMID Renderer follows the Uninterrupted Initialization WorkFlow where ad video playback will begin immediately. If the SIMID creative is unable to be loaded or encounters non-fatal errors, the ad video will continue playback. If the SIMID creative reports a fatal error, ad video playback will stop.
    - New Constant:
        - FWParameterSIMIDRendererCreativeTimeoutDelay
            - An NSString representing the timeout value in milliseconds that AdManager will wait for the SIMID creative to respond before reporting an error to the SIMID creative with the RESPONSE_TIMEOUT SIMID Player error code.
            - Note this timeout will not cause the ad to fail. To control the timeout for ad video playback, use FWParameterVideoAdRendererTimeout.
            - Default value: `@"5000"`

**6.59.0**
- FW-169110 [iOS/tvOS] Fix FWOMSDKExtension stop to finish adSession
    - Fixed an issue where our OMSDK extension failed to properly stop when FWContext was deallocated

- FW-165266 [iOS/tvOS] Added _fw_omidpn and _fw_omidpv key values in ad request to fill in omidpn and omidpv in OpenRTB request 

- FW-167128 [iOS/tvOS] Update to iOS 17 and tvOS 17
    - iOS and tvOS deployment target updated to iOS 12.0 and tvOS 12.0, respectively, per Apple's recommendation

- FW-174037 [iOS/tvOS] Fix NSURL Double Encoding of macros
    - For apps linked on or after iOS 17 and aligned OS versions, NSURL parsing has updated from the obsolete RFC 1738/1808 parsing to the same RFC 3986 parsing
    - Modified AdManager where calling [NSURL URLWithString] to ensure that URL encoding remains consistent between iOS 17.0 and earlier verions of iOS

**6.58.0**
- FW-159902 [iOS] Updated iOS Deployment Target to iOS 9.0 for iOS AdManager dynamic Build to match iOS AdManager static Build.

- FW-159250 [iOS] Updated OMSDK to 1.4.7
- FW-158886 [tvOS] Introduce support for OMSDK 1.4.7 for tvOS
    - New method: [FWContext updateOmidLastActivity]
        - Notifies OMSDK to update last activity time when users interact on CTV devices.
        - Per IAB, a specified list of event types which are acceptable to trigger the “last activity”
        signal are not included, as these interactions may vary by app. This may include interactions such as “watch next,” “are you still watching,” “skip,” or others. The integrator may include as many signals as desired.
        - This method will not have any effect before OMSDKExtension is initiated.

- FW-163014 [iOS/tvOS] Added new properties for windowStartTime and breakSequence
    - [FWVideoAssetConfiguration.windowStartTime]
        - A NSUInteger value representing the timestamp of the start time of the break window. Must be an integer greater than zero. A breakSequence for a temporal slot configuration must also be set for this value to be added to the Ad Request. This property is only inteded for Comcast T6 integrations.
    - [FWTemporalSlotConfiguration.breakSequence]
        - A NSUInteger value for the break sequence. Must be an integer greater than zero. This value will not be added to the Ad Request unless the video asset configuration's windowStartTime is also set. This property is only inteded for Comcast T6 integrations.

**6.57.0**
- FW-155066 [iOS/tvOS] Fix an issue that AdParameters is not parsed correctly when it's located after the MediaFiles node

**6.56.1**
- FW-146667 [iOS] Add OMSDK methods
    - [FWAdManager getOMSDKLibraryVersion]
        - The version string of OMSDK that is being integrated.
    - [FWAdManager getOMSDKPartnerVersion]
        - The AdManager version string that is submitted to OMSDK.

- FW-144169 [iOS] Updated OMSDK partner version to use the common SDK version string (i.e. 6.56.1) as opposed to a numeric representation.

- FW-148253 [iOS/tvOS] Update to XCFramework for the static library. To import the new library:
    - Add AdManager.xcframework to your project.
    - Add "#import <AdManager.h>" in your code.

**6.56.0**
- FW-132738 [iOS/tvOS] Add support for IAB Global Privacy Platform, Consent Management Platform API in Ad Manager.

**6.55.1**
- FW-143411 [iOS] Fix an issue where FWOMSDKFriendlyObstructionConfiguration still retains the FriendlyObstruction view after dereferencing.

**6.52.0**
- FW-114832 [iOS/tvOS] Remove i386 and armv7 from architecture due to deprecation on XCode 14.

- FW-101815 [iOS/tvOS] Added support for replacing TIMESTAMP, APPBUNDLE and LIMITADTRACKING macros in VAST urls.
    - LIMITADTRACKING is based on _fw_is_lat value to indicate that user has enabled limited ad tracking (value=1) or the user has not enabled limited ad tracking (value=0) with a default value of replacing the macro with an empty string.

**6.51.0**
- FW-77095 [iOS] Add SkippableAdExtension
    - New Constants
        - FWParameterExtensionSkippableAdButtonWidth
            - An NSString that the SkippableAdExtension should use for the skip button width.
                - If the parameter is set, the SkippableAdExtension will use this value as the skip button width.
                - The default value is @"80".
        - FWParameterExtensionSkippableAdButtonHeight
            - An NSString that the SkippableAdExtension should use for the skip button height.
                - If the parameter is set, the SkippableAdExtension will use this value as the skip button height.
                - The default value is @"40".
        - FWParameterExtensionSkippableAdButtonPosition
            - An NSString that the SkippableAdExtension should use for positioning the skip button inside the video display base.
                - Valid values are:
                    - @"bottom-left"
                    - @"bottom-center"
                    - @"bottom-right"
                    - @"top-left"
                    - @"top-center"
                    - @"top-right"
                - The default value is @"bottom-right".
        - FWParameterExtensionSkippableAdButtonHtml
            - The value of the parameter is a HTML snippet that renders a button inside the inAppView. The button id should be '_fw_skip_button'.
                - If the parameter is set, the SkippableAdExtension will use this html to render the skip button.
                - If the parameter is not set, the SkippableAdExtension will create a default button to use as the skip button.
        - FWParamaterExtensionSkippableAdButtonText
            - An NSString that the SkippableAdExtension should use for the skip button text.
                - If the parameter is set, the SkippableAdExtension will use this NSString as the skip button, when skip is enabled.
                - If the parameter is not set, the SkippableAdExtension will use the default text of 'Skip Ad'.
            - This parameter can be used both when using the default skip button, as well as a custom skip button.

- FW-103754 [iOS/tvOS] Update VAST url query string encoding to not encode '=' when it is a kv delimiter.

**6.50.0**
- FW-99149 [iOS/tvOS] Add parameters for use with VastTranslator.
    - New Constant: FWConstants.FWParameterVastMaxWrapperCount
        - Indicates the maximum amount of VAST wrappers allowed. The ad will fail with an error when the number of wrappers equals this number.
            - Should be a string value which can convert to a int. Default value is "5".
    - New Constant: FWConstants.FWParameterVastTimeoutInMilliseconds
        - Indicates the amount of time in milliseconds allowed for a VAST creative before it fails due to timeout.
            - Should be a string value which can convert to a int. Default value is "5000".
    - Add reporting for VAST error codes 301 - timeout loading VAST uri, 302 - max wrapper limit reached, and 303 - no ad.

**6.49.1**
- FW-101403 [tvOS] Add arm64 simulator architecture for Apple chip for tvOS dynamic build.

**6.49.0**
- FW-96985 [iOS/tvOS] Add new maxAds property to FWTemporalSlotConfiguration. This can be used to set the maximum number of ads allowed for the slot.
- FW-94121 [iOS/tvOS] Fix an issue where skip beacon is sent if an HLS rendition has an inaccurate duration in non airplay mode.

**6.48.0**
- FW-83234 [iOS] Add arm64 simulator architecture for Apple chip for iOS dynamic build
- FW-83218 [iOS/tvOS] Use media file duration to calculate skip offset value
- FW-73684 [iOS/tvOS] Encode spaces in VAST creative URL for iOS/tvOS 

**6.46.0**
- FW-78093 [iOS/tvOS] Add support for VAST progress tracking event and skip tracking event callbacks
  - AdManager now supports VAST's skipoffset attribute and firing VAST progress tracking event and VAST skip event callbacks
  - New APIs
    - FWAdInstance
      - skipOffset - skipOffset time from a third-party VAST ad in seconds. If the skipOffset time is not supported, not provided, or invalid, it will return -1.
      - getAdSkippableState - returns true if the ad playhead time has reached the skipOffset time for VAST Linear Skippable ads. Otherwise, it returns false. If the ad is not skippable, it will remain false. For VPAID ads, it returns true if the ad is able to be skipped, otherwise it returns false.
    - New Events
      - FWAdProgressEvent - fired when a progress callback is sent
        - Player can use this event to listen for when a progress tracking event fired.
        - Player can access the progress offset value in seconds using FWInfoKeyAdOffset.
        - VPAID ads do not support this event type.
      - FWAdSkippableStateChangedEvent - dispatched when an AdInstance is skippable. This is determined when the AdInstance's current playhead time passes the skipOffset time. This will not fire if no skipOffset is provided.
        - The player can access the skippable state from [FWAdInstance getAdSkippableState].
        - The player can also get the skippable state at the time of firing the FWAdSkippableStateChangedEvent from the event notification's userInfo payload using FWInfoKeyAdSkippableState.
    - New Constants
      - FWInfoKeyAdOffset - Used to get the progress event's offset value in seconds from the FWAdProgressEvent notification's userInfo dictionary
      - FWInfoKeyAdSkippableState - Used to indicate whether the ad's skipabble state changed from the FWAdSkippableStateChangedEvent notification's userInfo dictionary

**6.45.0**
- FW-69391 [iOS/tvOS] Encode query string of VAST wrapper url if it contains reserved characters.
- FW-60260 [iOS/tvOS] Added support for Picture in Picture for video ads.
- FW-73680 [iOS/tvOS] Added support for replacing APIFRAMEWORKS and OMIDPARTNER macros.

**6.44.0**
- FW-49139 [iOS/tvOS] Distribute iOS/tvOS dynamic build using XCFramework.

- FW-64543 [iOS/tvOS] Add constant FWVideoAssetAutoPlayTypeClickToPlay to FWVideoAssetAutoPlayType to support click to play flag in the ad request
	- New Constant: FWVideoAssetAutoPlayTypeClickToPlay

- FW-53379 [iOS/tvOS] Add support to parse and return Fixed or Replaced action for programmer addressable
  - Add New API to AdInstance
      - action - returns the action string of an ad instance, and empty string if the ad instance doesn't contain action string.

**6.43.0**
- FW-59662 [iOS/tvOS] Expose sold as ad unit property of Ad Instance
  - FWAdInstance now exposes the soAdUnit property of type NSString
  - Users can access this property using: adInstance.soAdUnit;

- FW-60914 [iOS/tvOS] Update [FWAdInstance universalAdId] method to return the universal ad ID of the ad instance, if it is returned in the SMRX ad response. If there is no universal ad ID in the SMRX ad response, the method will fall back to the existing behavior of returning the universal ad ID of VAST ads during the VAST ad playback.
  - Please see documentation for all supported parameters and their positions.

**6.42.0**
- FW-45629 [iOS] Include OMSDK source code and re-enable OMSDK in iOS dynamic library
  - For both AdManager static and dynamic framework, client will need to add JavascriptCore.framework, which is used by the OMSDK to the Link Binary With Libraries. Otherwise it will result in build error.
- FW-50631 [iOS/tvOS] Added support for parsing dealId, marketUnifiedAdId, and openExchangeId
  - Added New APIs to AdInstance
      - dealId - returns the deal id of the ad instance if the ad is delivered via deal, otherwise it will be an empty String. This property is readonly.
      - openExchangeId - returns the open exchange id of the ad instance if the ad is delivered via the Open Exchange rule, otherwise it will be an empty String. This property is readonly.
      - marketUnifiedAdId - returns the market unified ad id of the ad instance if the ad is delivered via deal or the Open Exchange rule, otherwise it will be an empty String. This property is readonly.

**6.41.1**
- FW-49892 [iOS/tvOS] Fix an issue where they key-value stpos=0 is added in defaultImpression beacons as default behavior

**6.41.0**
- FW-44411 [iOS/tvOS] Append stpos key-value to defaultImpression callback based on the startTimePosition passed by custom renderer for trick mode.
- FW-44348 [iOS/tvOS] Support init value in quartiles for replay if enableCountingReplayCallback is set to true through profile for trick mode.

**6.39.0**
- FW-37679 [iOS/tvOS] Fix an issue that caused a delay on getting the current device volume when native audio session is mixed with webview audio session while playing a VPAID ad. This issue could lead to the VPAID playback freezing.
- FW-24839 [iOS] Handle empty and null VerificationParameters and vendor key in OMSDK extension.
- FW-36036 [iOS] Remove OMSDK support in AdManager dynamic framework. OMSDK currently only provides a static framework, which may cause a code signing issue when submitting to app store with our dynamic build.

**6.38.0**
- FW-27600 [iOS] Fix an issue of importing header FWOMSDKFriendlyObstructionType.h
- FW-28263 [iOS] Fire Loaded event for display ad in OMSDK extension
  - OMSDK Extension listens to FWAdLoadedEvent for overlay, display, and pause midroll slots and calls OMSDK API to fire OMSDK loaded event
- FW-28679 [iOS/tvOS] Removed fetching of IDFA.
	- Due to Apple deprecating isAdvertisingTrackingEnabled in iOS 14, and their plan to deprecate IDFA retrieval early next year, we have removed fetching of IDFA from AdManager. To include the IDFA in the ad request, it will need to be manually added to the FWRequestConfiguration:
		[fwRequestConfiguration addValue:{idfa} forKey:@"_fw_did_idfa"]
	- Removed constant FWParameterCollectIDFA that was used to enable and disable auto fetching of IDFA.

**6.37.0**
- FW-16115 [iOS] Add iOS OMSDK 1.3.5 Framework to iOS AdManager
  - iOS AdManager now includes the OMSDK 1.3.5 Framework. This change removes all references to UIWebView in iOS AdManager SDK while maintaining support for OMSDK.
  - New APIs
    - FWOMSDKFriendlyObstructionConfiguration
      - A class used to support adding friendly obstructions aligned with the OMSDK 1.3.5's API
      - Properties
        - NSString\* detailedReason
          - The detailed reason provided by the integrator for why the friendly obstruction was needed. The detailed reason can be nil. If not nil, it can be 50 characters or less and only contain characters `A-z`, `0-9`, or spaces.
        - FWOMSDKFriendlyObstructionType purpose
          - The purpose of the friendly obstruction. Acceptable parameters include FWOMSDKFriendlyObstructionMediaControls, FWOMSDKFriendlyObstructionCloseAd, FWOMSDKFriendlyObstructionNotVisible, and FWOMSDKriendlyObstructionOther.
        - UIView\* view
          - The UIView associated with a friendly obstruction.
        - NSError\* error
          - A property used to access the error message associated with adding an invalid friendly obstruction
      - Methods
        - initWithView:(nonnull UIView\*)view purpose:(FWOMSDKFriendlyObstructionType)purpose detailedReason:(nullable NSString\*)detailedReason;
    - FWOMSDKFriendlyObstructionType
      - An ENUM wrapper for allowed friendly obstruction purposes
        - Acceptable values
          - FWOMSDKFriendlyObstructionMediaControls=OMIDFriendlyObstructionMediaControls
            - The friendly obstruction relates to interacting with a video (such as play/pause buttons)
          - FWOMSDKFriendlyObstructionCloseAd=OMIDFriendlyObstructionCloseAd
            - The friendly obstruction relates to closing an ad (such as a close button)
          - FWOMSDKFriendlyObstructionNotVisible=OMIDFriendlyObstructionNotVisible
            - The friendly obstruction is not visibly obstructing the ad but may seem so due to technical limitations
          - FWOMSDKFriendlyObstructionOther=OMIDFriendlyObstructionOther
            - The friendly obstruction is obstructing for any purpose not already described
    - FWContext
      - (void)addFriendlyObstructionConfiguration:(FWOMSDKFriendlyObstructionConfiguration \*)obstructionConfiguration;
        - Add the friendly obstruction configuration of a view which should be excluded from all ad session viewability calculations for Open Measurement SDK
        - This method will have no effect if called after the ad session has finished
      - (void)removeFriendlyObstructionConfiguration:(FWOMSDKFriendlyObstructionConfiguration \*)obstructionConfiguration;
        - Remove a registered friendly obstruction view for Open Measurement SDK
        - This method will have no effect if called after the ad session has finished
      - New renderer API for renderers to return the friendly obstructions and another to return the actual ad view
        - Note that all custom renderers need to implement these two new renderer API functions
          - (NSArray <FWOMSDKFriendlyObstructionConfiguration\*> \*)getFriendlyObstructionConfigurations;
          - (UIView \*)adView;
    - Architecture Updates
        - In order to support OMSDK's 1.3.5 Framework, iOS AdManager removed armv7s from its architectures.

**6.36.0**
- FW-11666 [iOS/tvOS] Add public subsessionToken api
    - We added a new property, subsessionToken, to FWRequestConfiguration
      - subsessionToken is the subsession token value used for synchronizing multiple ad requests
      - This property accepts NSUInteger values.
	    - The subsession token must be a positive integer value that uniquely identifies a subsession. By default if this method is not called by the app or an invalid value is passed, a random number is generated as subsession token when the request mode is live.

- FW-13428 [iOS/tvOS]: Fixed an issue preventing FWRequestConfiguration from being copied

**6.35.0**
- FW-6139 [iOS] Remove OMSDK framework and related code.
    - We have temporarily removed the OMSDK framework from iOS AdManager, due to the usage of UIWebView in OMSDK, which has been deprecated by Apple for new app submission starting April 2020 and app updates starting in December 2020.
    - The following public facing methods have been removed:
        - FWContext.addFriendlyObstruction
        - FWContext.removeFriendlyObstruction
        - FWRenderer.getFriendlyObstructions
    - Clients should not call [FWContext loadExtension:@"FWOMSDKExtension"]
- FW-4760 [iOS/tvOS] Remove CTS client side beaconing VOD SSAI integrations
- EPU-690 [iOS/tvOS] Release AdManager dynamic Framework
    - In order to better meet the needs of our clients we will release a dynamic framework in addition to the static framework for iOS and tvOS during each release, starting with version 6.35. Now clients can download the dynamic framework in addition to the static framework on our SDK download page.
    - The download package will contain a device-only build and a universal build which includes both simulator and device slices. The device-only build should be used for app store submission based on Apple's suggestion.
        - If an app is submitted to the app store using the universal build it may be rejected.

**6.34.0**
- EPU-1306 [iOS/tvOS] Support IAB GDPR/TCF 2.0
    - Technical specifications for IAB Europe Transparency and Consent Framework 2.0 can be found at https://github.com/InteractiveAdvertisingBureau/GDPR-Transparency-and-Consent-Framework/blob/master/TCFv2/IAB%20Tech%20Lab%20-%20CMP%20API%20v2.md
    - The value stored in NSUserDefaults with key FWConstants.FWParameterIABConsentSubjectToGDPRKey is now an NSInteger instead of an NSString.
        - Valid values: NSInteger 1, 0, nil
    - Beginning with 6.34.0, AdManager will not be compatible with TCF/CMP API 1.0 and 1.1. Clients need to update to TCF/CMP API 2.0 if using AdManager version 6.34.0 or later. iOS/tvOS AdManager versions 6.30.0 - 6.33.0 will only support TCF/CMP API 1.0 and 1.1.

**6.33.0**

- EPU-1258 [iOS] Recognize overlay and pause midroll slots as display slots in OMSDK extension
- EPU-1243 [iOS] Listen to FWAdLoadedEvent in OMSDK extension and fire OMSDK video loaded event
- EPU-1248 [iOS/tvOS] Add FWAdLoadedEvent
	- New constant:
		- FWConstants
			- FWAdLoadedEvent
			- Event is dispatched when an ad has been loaded and is ready to play.
- EPU-1252 [iOS/tvOS] Remove Hybrid Stream Stitcher from AdManager
	- Remove FWStreamStitcherContext class
	- Remove [AdManager newStreamStitcherContextWithStreamUrl]
- EPU-1246[iOS/tvOS] Adoption of CCPA in AdManager
	- New APIs available to support CCPA in AdManager
	- New classes
		- FWCCPAConsentConfiguration
			- Class used for configuring FWConsentConfiguration with user CCPA consent information
			- Note, this class is intended for readonly purposes as FWConsentConfiguration will handle its implementation
			- For more information, please visit our documentation
	- New properties, methods, and functions added to existing classes
		- FWConstants
			- FWParameterIABUSPrivacyStringKey
				- Parameter used to set the disclosures made and choices selected by a user regarding consumer data privacy in association with CCPA.
				- This key should be set in [NSUserDefaults standardUserDefaults]
				- Please see our documentation for more information on automatic retrieval
		- FWConsentConfiguration
			- ccpaConsentConfiguration
				- A readonly property used for holding CCPA consent configuration information
				- FWConsentConfiguration will automatically set ccpaConsentConfiguration from [NSUserDefaults standardUserDefaults] using the key, FWParameterIABUSPrivacyStringKey
				- This property cannot be manually set by the user
				- Please see our documentation for more information on automatic retrieval
	- In cases where the consent configuration is set on the AdRequestConfiguration object, values of keys "\_fw\_us\_privacy" would be replaced by CCPA consent values

**6.32.0**

- EPU-1193 [iOS] OMSDK extension should not fire ad session for VAST wrapper

**6.31.0**

-EPU-835 [iOS/tvOS] Change user agent string for tvOS AdManager to reflect the correct platform

**6.30.0**

-EPU-1000 [iOS/tvOS]  Adoption of GDPR in AdManager
	-  New APIs available to support GDPR in AdManager
		- New classes
			- FWConsentConfiguration
				-  Class used for configuring the ad request with user consent information
			- FWGDPRConsentConfiguration
				-  Class used for configuring FWConsentConfiguration with user GDPR consent information
		- New properties, methods, and functions added to existing classes
			- FWRequestConfiguration
				- consentConfiguration
					- Property to hold consent configuration information
			- FWConstants
				- FWConsentApplicable
					- Enumeration for defining the applicability of user consent
					- Valid values include FWConsentIsApplicable and FWConsentNotApplicable
				- FWParameterIABConsentSubjectToGDPRKey
					- Parameter used to set whether the ad is subject to GDPR regulations in the application
					- This key should be set in [NSUserDefaults standardUserDefaults]
					- Please see our documentation for more information on automatic retrieval
				- FWParameterIABConsentConsentStringKey
					- Parameter used to set what information and which vendors the user consented to in the application
					- This key should be set in [NSUserDefaults standardUserDefaults]
					- Please see our documentation for more information on automatic retrieval
    - In cases where the consent configuration is set on the AdRequestConfiguration object, values of keys "\_fw\_gdpr" and "\_fw\_gdpr\_consent" would be replaced by GDPR consent values

**6.29.0**

- EPU-854 [iOS/tvOS] Add FWPlayerConfiguration property to parse ad response on the background thread instead of the main thread
	- New API
		- [FWPlayerConfiguration parseResponseOnBackgroundThread]
			- Note: parseResponseOnBackgroundThread has a default value of NO

- EPU-993 [iOS/tvOS] Add FWPlayerConfiguration
	- New API
		- FWPlayerConfiguration

**6.28.0**

- EPU-894 [iOS] Add a parameter that enables the body element in the VPAID creative loading iframe
- EPU-255 [iOS/tvOS] VAST 4 - Support VAST Error nodes 100
	- The following VAST codes are supported:
		- 100: XML parsing error
- EPU-891 [iOS/tvOS] VAST 4 - Support VAST Error nodes 101, 102
	- The following VAST codes are supported:
		- 101: VAST schema validation error.
		- 102: VAST version of response not supported.
	- For further information, please refer to the IAB VAST4 doc section 2.3.6
		- https://www.iab.com/guidelines/digital-video-ad-serving-template-vast-4-0/
	- To report VAST error codes, iOS/tvOS AdManager will replace an [ERRORCODE] macro within the appropriate VAST error URL.

**6.27.0**

- EPU-850 [iOS/tvOS] Fix an issue where VPAID ads are not paused/resumed when calling the pause and resume methods on slot
- EPU-862 [iOS/tvOS] Fix a potential issue where pause/resume callbacks are fired twice while pausing/resuming a VPAID creative
- EPU-712 [iOS] Adopt IAB's Open Measurement SDK in AdManager by loading FreeWheel Extension - OpenMeasurementExtension, which is used to interact with OMSDK. Clients should call loadExtension "FWOMSDKExtension" using the AdContext class to load the OpenMeasurementExtension.
    - Ad types supported:
        - Video
        - VPAID
    - Ad types currently not supported:
        - Companion
        - MRAID
        - Interstitial
        - Standalone display
    - Beacons supported:
        - omidSupport
        - sessionStart
        - start
        - first quartile [25%]
        - midpoint [50%]
        - third quartile [75%]
        - complete [only if ad reaches 100%]
        - pause [user initiated]
        - resume [user initated]
        - volumeChange
        - adUserInteraction [click]
        - sessionEnd
    - Beacons currently not supported:
        - sessionError [Due to a limitation with OMSDK's implementation]
        - stateChange - expand, collapse, minimize
        - stateChange - enterFullscreen, exitFullscreen, normal
        - skipped [any early termination of playback]
        - onVastLoaded
        - adUserInteraction [acceptInvitation]
        - repeat beacons
            - note that when Slot.play() is called second times to play the slot, there will be no OMSDK beacons fired
         - bufferingStart, bufferingEnd
    - New API for the player to register and remove friendly obstructions to OMSDK on AdContext class:
        - addFriendlyObstruction:(UIView \*)obstruction
        - removeFriendlyObstruction:(UIView \*)obstruction
    - New renderer API for renderers to return the friendly obstructions and another to return the actual ad view, note that all custom renderers need to implement these two new renderer API functions:
        - (NSArray \*)getFriendlyObstructions
        - (UIView \*)getAdView

**6.26.0**

- EPU-677 [iOS] Replace all UIWebView usages with WKWebView
- EPU-768 [iOS/tvOS] Adopt externalAdId in SmartXML

**6.25.0**

- EPU-713 [iOS/tvOS] Parse and expose <Extensions> from VAST and SmartXML responses
	- New API
		- [FWAdInstance vastExtensionsWithType:]
		- [FWExtension type]
		- [FWExtension value]
		- [FWExtension owner]
- EPU-719 [iOS/tvOS] Support parsing <AdVerifications> Node in VAST 4.1
- EPU-716 [iOS/tvOS] Support parsing <AdVerifications> under <Extension type="AdVerifications"> Node before VAST 4.1
- EPU-714 [iOS/tvOS] Add AdPreInitEvent. FWAdPreInitEvent is dispatched when an AdInstance has started either playback attempt or preloading in background, whichever comes first.
    - Note: PreInit is not dispatched when replaying a slot (or the adInstance in it). Also, multiple PreInit's will be dispatched when unwrapping multiple wrappers of VAST
- EPU-768 [iOS/tvOS] Support parsing "externalAdId" property on <Ad> and <AdInstance> node to uniquely identify third party ads in SmartXML Responses
- EPU-768 [iOS/tvOS] Expose Unique Ad Id API which can be used by the integration to uniquely identify an Ad
    - New APIs
        - [FWAdInstance externalAdId]
        - [FWAdInstance adUniqueId]

**6.24.0**

- EPU-668 [iOS/tvOS] Add player dimensions (points) in FWRequestConfiguration and carry them in the ad request
    - Deprecated API
        - [FWRequestConfiguration initWithServerURL: playerProfile:]
    - New API
        - [FWRequestConfiguration initWithServerURL: playerProfile: playerDimensions:]

- EPU-660 [iOS/tvOS] Trim last digit of AdManager version from 4 to 3 digits

**6.23.0.0**

- EPU-623 [iOS] Fixed an issue causing VPAID ads to crash on iOS 9 while setting playback action requirement.
- EPU-289 [iOS/tvOS] Consolidate duplicate timer implementations with rigorously tested timer implementation
- EPU-590 [iOS] Replace frame based layout with constraints based autolayout in FWInAppViewExtension
- EPU-596 [iOS/tvOS] Remove deprecated APIs, deprecate defaultVideoPlayerSlotProfile and defaultSiteSectionSlotProfile with new API defaultNonTemporalSlotProfile
    - Deleted Constants
        - FW_NOTIFICATION_AD_IMPRESSION
        - FW_NOTIFICATION_AD_IMPRESSION_END
        - FW_NOTIFICATION_AD_ERROR
        - FW_NOTIFICATION_AD_EXPAND_TO_FULLSCREEN
        - FW_NOTIFICATION_AD_COLLAPSE_FROM_FULLSCREEN
        - FWSlotExternalPlaybackDidStartNotification
        - FW_NOTIFICATION_SLOT_EXTERNAL_PLAYBACK_STARTED
        - FWSlotExternalPlaybackDidStopNotification
        - FW_NOTIFICATION_SLOT_EXTERNAL_PLAYBACK_STOPPED
    - Deleted APIs
        - [FWContext transactionId];
        - [FWRendererController setCapability: status:]
        - [FWRequestConfiguration requestDuration]
    - Deprecated APIs
        - [FWContext addCandidateAdId:]
        - [FWAdInstance adUniqueId];
        - [FWAdInstance play2]
        - [FWRequestConfiguration defaultVideoPlayerSlotProfile]
        - [FWRequestConfiguration defaultSiteSectionSlotProfile]
    - New API
        - [FWRequestConfiguration defaultNonTemporalSlotProfile]

**6.22.0.0**

- EPU-464 [iOS] Deprecate the support of calendar functionalities in MRAID creatives. It is scheduled to be removed in 6.23
- EPU-585 [iOS/tvOS] Fix potential crashes that could be caused by inserting nil objects into a NSDictionary object
- EPU-41 [iOS] Pass creativeData as a JS object from VAST response to VPAID creative

**6.21.0.0**

- EPU-460 [iOS] Support mute/unmute events in AirPlay mode. Note that this requires the app to implement the method playerShouldSetVolume in the FWVideoAdDelegate protocol.

**6.19.0.0**

- EPU-211 [iOS] Use WKWebView instead of UIWebView in InAppViewExtension
- EPU-376 [iOS/tvOS] Remove deprecated constants
    - Deleted Constants
        - FW_LOG_LEVEL_QUIET
        - FW_LOG_LEVEL_INFO
        - FW_LOG_LEVEL_VERBOSE
        - FW_SLOT_OPTION_INITIAL_AD_STAND_ALONE
        - FW_SLOT_OPTION_INITIAL_AD_KEEP_ORIGINAL
        - FW_SLOT_OPTION_INITIAL_AD_FIRST_COMPANION_ONLY
        - FW_SLOT_OPTION_INITIAL_AD_FIRST_COMPANION_OR_STAND_ALONE
        - FW_SLOT_OPTION_INITIAL_AD_FIRST_COMPANION_THEN_STAND_ALONE
        - FW_SLOT_OPTION_INITIAL_AD_FIRST_COMPANION_OR_NO_STAND_ALONE
        - FW_SLOT_OPTION_INITIAL_AD_NO_STAND_ALONE
        - FW_SLOT_OPTION_INITIAL_AD_NO_STAND_ALONE_IF_TEMPORAL
        - FW_SLOT_OPTION_INITIAL_AD_FIRST_COMPANION_OR_NO_STAND_ALONE_IF_TEMPORAL
        - FW_CAPABILITY_STATUS_OFF
        - FW_CAPABILITY_STATUS_ON
        - FW_CAPABILITY_STATUS_DEFAULT
        - FW_ID_TYPE_CUSTOM
        - FW_ID_TYPE_FW
        - FW_ID_TYPE_FWGROUP
        - FW_VIDEO_STATE_PLAYING
        - FW_VIDEO_STATE_PAUSED
        - FW_VIDEO_STATE_STOPPED
        - FW_VIDEO_STATE_COMPLETED
        - FW_TIME_POSITION_CLASS_PREROLL
        - FW_TIME_POSITION_CLASS_MIDROLL
        - FW_TIME_POSITION_CLASS_POSTROLL
        - FW_TIME_POSITION_CLASS_OVERLAY
        - FW_TIME_POSITION_CLASS_DISPLAY
        - FW_TIME_POSITION_CLASS_PAUSE_MIDROLL
        - FW_SLOT_TYPE_TEMPORAL
        - FW_SLOT_TYPE_VIDEOPLAYER_NONTEMPORAL
        - FW_SLOT_TYPE_SITESECTION_NONTEMPORAL
        - FW_PARAMETER_LEVEL_PROFILE
        - FW_PARAMETER_LEVEL_GLOBAL
        - FW_PARAMETER_LEVEL_SLOT
        - FW_PARAMETER_LEVEL_CREATIVE
        - FW_PARAMETER_LEVEL_RENDITION
        - FW_PARAMETER_LEVEL_OVERRIDE
        - FW_RENDERER_STATE_PRELOADED
        - FW_RENDERER_STATE_STARTED
        - FW_RENDERER_STATE_COMPLETED
        - FW_RENDERER_STATE_FAILED
        - FW_REQUEST_MODE_ON_DEMAND
        - FW_REQUEST_MODE_LIVE
        - FW_VIDEO_ASSET_DURATION_TYPE_EXACT
        - FW_VIDEO_ASSET_DURATION_TYPE_VARIABLE
        - FW_VIDEO_ASSET_AUTO_PLAY_TYPE_NONE
        - FW_VIDEO_ASSET_AUTO_PLAY_TYPE_ATTENDED
        - FW_VIDEO_ASSET_AUTO_PLAY_TYPE_UNATTENDED
        - FW_USER_ACTION_PAUSE_BUTTON_CLICKED
        - FW_USER_ACTION_RESUME_BUTTON_CLICKED
        - FW_MODULE_TYPE_RENDERER
        - FW_MODULE_TYPE_TRANSLATOR
        - FW_NOTIFICATION_REQUEST_COMPLETE
        - FW_NOTIFICATION_SLOT_PRELOADED
        - FW_NOTIFICATION_SLOT_STARTED
        - FW_NOTIFICATION_SLOT_ENDED
        - FW_NOTIFICATION_IN_APP_VIEW_OPEN
        - FW_NOTIFICATION_IN_APP_VIEW_CLOSE
        - FW_NOTIFICATION_IN_APP_VIEW_WILL_OPEN_MEDIA_DOCUMENT
        - FW_NOTIFICATION_CONTENT_PAUSE_REQUEST
        - FW_NOTIFICATION_CONTENT_RESUME_REQUEST
        - FW_NOTIFICATION_USER_ACTION_NOTIFIED
        - FW_NOTIFICATION_RENDERER_EVENT
        - FW_NOTIFICATION_VIDEO_DISPLAY_BASE_CHANGED
        - FW_NOTIFICATION_VIDEO_DISPLAY_BASE_FRAME_CHANGED
        - FW_NOTIFICATION_EXTENSION_LOADED
        - FW_NOTIFICATION_EXTERNALPLAYBACK_INTERRUPTED
        - FW_ADUNIT_PREROLL
        - FW_ADUNIT_MIDROLL
        - FW_ADUNIT_POSTROLL
        - FW_ADUNIT_OVERLAY
        - FW_ADUNIT_PAUSE_MIDROLL
        - FW_ADUNIT_STREAM_PREROLL
        - FW_ADUNIT_STREAM_POSTROLL
        - FW_CAPABILITY_SLOT_TEMPLATE
        - FW_CAPABILITY_ADUNIT_IN_MULTIPLE_SLOTS
        - FW_CAPABILITY_BYPASS_COMMERCIAL_RATIO_RESTRICTION
        - FW_CAPABILITY_CHECK_COMPANION
        - FW_CAPABILITY_CHECK_TARGETING
        - FW_CAPABILITY_RECORD_VIDEO_VIEW
        - FW_CAPABILITY_SYNC_MULTI_REQUESTS
        - FW_CAPABILITY_RESET_EXCLUSIVITY
        - FW_CAPABILITY_FALLBACK_ADS
        - FW_CAPABILITY_MULTIPLE_CREATIVE_RENDITIONS
        - FW_EVENT_AD_IMPRESSION
        - FW_EVENT_AD_IMPRESSION_END
        - FW_EVENT_AD_QUARTILE
        - FW_EVENT_AD_FIRST_QUARTILE
        - FW_EVENT_AD_MIDPOINT
        - FW_EVENT_AD_THIRD_QUARTILE
        - FW_EVENT_AD_COMPLETE
        - FW_EVENT_AD_CLICK
        - FW_EVENT_AD_MUTE
        - FW_EVENT_AD_UNMUTE
        - FW_EVENT_AD_COLLAPSE
        - FW_EVENT_AD_EXPAND
        - FW_EVENT_AD_PAUSE
        - FW_EVENT_AD_RESUME
        - FW_EVENT_AD_REWIND
        - FW_EVENT_AD_ACCEPT_INVITATION
        - FW_EVENT_AD_CLOSE
        - FW_EVENT_AD_MINIMIZE
        - FW_EVENT_AD_RESELLER_NO_AD
        - FW_EVENT_AD_ERROR
        - FW_EVENT_AD_MEASUREMENT
        - FW_EVENT_AD_BUFFERING_START
        - FW_EVENT_AD_BUFFERING_END
        - FW_EVENT_RESELLER_NO_AD
        - FW_EVENT_TYPE_CLICK_TRACKING
        - FW_EVENT_TYPE_IMPRESSION
        - FW_EVENT_TYPE_CLICK
        - FW_EVENT_TYPE_STANDARD
        - FW_EVENT_TYPE_CUSTOM
        - FW_PARAMETER_OPEN_IN_APP
        - FW_PARAMETER_IN_APP_VIEW_LOADING_TIMEOUT
        - FW_PARAMETER_IN_APP_VIEW_TOOLBAR_SURFACE_RENDER
        - FW_PARAMETER_IN_APP_VIEW_NAVIGATION_BAR_BACKGROUND_COLOR
        - FW_PARAMETER_IN_APP_VIEW_NAVIGATION_BAR_ALPHA
        - FW_PARAMETER_IN_APP_VIEW_NAVIGATION_BAR_HEIGHT
        - FW_PARAMETER_IN_APP_VIEW_WEB_VIEW_BACKGROUND_COLOR
        - FW_PARAMETER_IN_APP_VIEW_WEB_VIEW_ALPHA
        - FW_PARAMETER_COUNTDOWN_TIMER_DISPLAY
        - FW_PARAMETER_COUNTDOWN_TIMER_REFRESH_INTERVAL
        - FW_PARAMETER_COUNTDOWN_TIMER_UPDATE_CALLBACK
        - FW_PARAMETER_COUNTDOWN_TIMER_POSITION
        - FW_PARAMETER_COUNTDOWN_TIMER_ALPHA
        - FW_PARAMETER_COUNTDOWN_TIMER_HEIGHT
        - FW_PARAMETER_COUNTDOWN_TIMER_WIDTH
        - FW_PARAMETER_COUNTDOWN_TIMER_TEXT_SIZE
        - FW_PARAMETER_COUNTDOWN_TIMER_BG_COLOR
        - FW_PARAMETER_COUNTDOWN_TIMER_FONT_COLOR
        - FW_PARAMETER_COUNTDOWN_TIMER_TEXT_FONT
        - FW_PARAMETER_COUNTDOWN_TIMER_HTML
        - FW_PARAMETER_NONTEMPORAL_SLOT_VISIBILITY_AUTO_TRACKING
        - FW_PARAMETER_PAUSEAD_ENABLE
        - FW_PARAMETER_CLICK_DETECTION
        - FW_PARAMETER_DESIRED_BITRATE
        - FW_PARAMETER_IDFA
        - FW_PARAMETER_POSTAL_CODE
        - FW_PARAMETER_AREA_CODE
        - FW_PARAMETER_DATE_OF_BIRTH
        - FW_PARAMETER_GENDER
        - FW_PARAMETER_KEYWORDS
        - FW_PARAMETER_SEARCH_STRING
        - FW_PARAMETER_MARITAL
        - FW_PARAMETER_ETHNICITY
        - FW_PARAMETER_ORIENTATION
        - FW_PARAMETER_INCOME
        - FW_INFO_KEY_URL
        - FW_INFO_KEY_ERROR
        - FW_INFO_KEY_CUSTOM_ID
        - FW_INFO_KEY_CONCRETE_EVENT_ID
        - FW_INFO_KEY_SLOT
        - FW_INFO_KEY_ADINSTANCE
        - FW_INFO_KEY_AD_ID
        - FW_INFO_KEY_REPLICA_ID
        - FW_INFO_KEY_CREATIVE_ID
        - FW_INFO_KEY_USER_ACTION
        - FW_INFO_KEY_MODULE_NAME
        - FW_INFO_KEY_MODULE_TYPE
        - FW_INFO_KEY_REQUIRED_API_VERSION
        - FW_INFO_KEY_ERROR_CODE
        - FW_INFO_KEY_ERROR_INFO
        - FW_INFO_KEY_ERROR_MODULE
        - FW_INFO_KEY_SUB_EVENT_NAME
        - FW_INFO_KEY_CUSTOM_EVENT_NAME
        - FW_INFO_KEY_SHOW_BROWSER
        - FW_INFO_KEY_VIDEO_DISPLAY_BASE
        - FW_ERROR_IO
        - FW_ERROR_TIMEOUT
        - FW_ERROR_NULL_ASSET
        - FW_ERROR_ADINSTANCE_UNAVAILABLE
        - FW_ERROR_UNKNOWN
        - FW_ERROR_MISSING_PARAMETER
        - FW_ERROR_NO_AD_AVAILABLE
        - FW_ERROR_PARSE
        - FW_ERROR_INVALID_VALUE
        - FW_ERROR_INVALID_SLOT
        - FW_ERROR_NO_RENDERER
        - FW_ERROR_NO_PRELOAD_IN_TRANSLATOR
        - FW_ERROR_IN_APP_VIEW
        - FW_ERROR_3P_COMPONENT
        - FW_ERROR_UNSUPPORTED_3P_FEATURE
- EPU-377 [iOS/tvOS] Deprecate the old API on FWRendererController that enables custom renderers to set supported ad events.
    - Deprecated API
        - [FWRendererController setCapability: status:]. Please use [FWRendererController setSupportedAdEvent: supported:] instead

**6.18.0.0**

- EPU-151 [iOS/tvOS] Support Universal Ad Id in VAST 4
    - New API: [FWAdInstance universalAdId]

- EPU-276 [iOS/tvOS] Remove deprecated APIs
    - Deleted APIs
        - [FWAdManager setServerUrl:]
        - [FWContext setCapability: status:]
        - [FWAdManager newContextWithContext:]
        - [FWContext addValue: forKey:]
        - [FWContext setPlayerProfile: defaultTemporalSlotProfile: defaultVideoPlayerSlotProfile: defaultSiteSectionSlotProfile:]
        - [FWContext setVisitorId: ipV4Address: bandwidth: bandwidthSource:]
        - [FWContext setVisitorHTTPHeader: withValue:]
        - [FWContext setVideoAssetId: idType: duration: durationType: location: autoPlayType: videoPlayRandom: networkId: fallbackIdString:]
        - [FWContext setVideoAssetCurrentTimePosition:]
        - [FWContext setSiteSectionId: idType: pageViewRandom: networkId: fallbackIdString:]
        - [FWContext addTemporalSlot: adUnit: timePosition: slotProfile: cuePointSequence: minDuration: maxDuration: acceptPrimaryContentType: acceptContentType:]
        - [FWContext addVideoPlayerNonTemporalSlot: adUnit: width: height: slotProfile: acceptCompanion: initialAdOption: acceptPrimaryContentType: acceptContentType: compatibleDimensions:]
        - [FWContext addSiteSectionNonTemporalSlot: adUnit: width: height: slotProfile: acceptCompanion: initialAdOption: acceptPrimaryContentType: acceptContentType: compatibleDimensions:]
        - [FWContext setVideoDisplayCompatibleSizes:]
        - [FWContext setRequestMode:]
        - [FWContext setRequestDuration:]
        - [FWContext resetExclusivity:]
        - [FWContext startSubsessionWithToken:]
        - [FWContext submitRequestWithTimeout:]

- EPU-279 [iOS] Support iOS 11
    - Tested our SDK against iOS 11 to ensure compatibility

- EPU-278 [iOS] Enable inline playback by default for VPAID creatives
    - Set playsinline attribute on the HTML5 video element passed to VPAID creative to default playback in inline mode instead of fullscreen

**6.17.5.1**

- EPU-258 [iOS/tvOS] Resolve potential name conflicts with other SDKs

**6.17.0.0**

- Note that all deprecated APIs will be removed in the next major release(6.18.0.0). Please prepare for it accordingly.

- EPU-52 [iOS/tvOS] Support mute and unmute events for video ads in CTS SSAI integration.

- EPU-219 [iOS/tvOS] Move requestDuration from AdRequestConfiguration to VideoAssetConfiguration
    - New APIs
        - FWVideoAssetConfiguration.requestDuration
    - Deprecated APIs
        - FWRequestConfiguration.requestDuration

- EPU-29 [iOS/tvOS] Support companion ads in CTS SSAI integrations

- EPU-65 [iOS/tvOS] Adopt ARC (Automatic Reference Counting)

**6.16.4.0**
- EPU-217 [iOS] Support VAST3 single ad
	- Note that only the first ad in the VAST 3 response will be played

**6.16.3.0**
- EPU-198 [iOS/tvOS] Automatically stop the interstitial ad after the ad duration is reached
- ESC-6837 [iOS] Fix a problem that VPAID renderer doesn't escape backslash characters in the <AdParameters> node.
- ESC-7077 [iOS] Fix a problem that default impression is fired before the webview added to the key window for interstitial display ad.

**6.16.0.0**

- OPP-8133 [iOS/tvOS] Support CTS client side beaconing for video ads in VOD SSAI integrations
    - New APIs
        - [FWAdManager newCTSContext]
        - FWCTSContext
        - FWCTSRequestConfiguration
- EPU-142 [iOS/tvOS] Redesign ad request related APIs
    - Deprecated APIs
        - [FWAdManager setServerUrl:]
        - [FWContext setCapability: status:]
        - [FWAdManager newContextWithContext:]
        - [FWContext addValue: forKey:]
        - [FWContext setPlayerProfile: defaultTemporalSlotProfile: defaultVideoPlayerSlotProfile: defaultSiteSectionSlotProfile:]
        - [FWContext setVisitorId: ipV4Address: bandwidth: bandwidthSource:]
        - [FWContext setVisitorHTTPHeader: withValue:]
        - [FWContext setVideoAssetId: idType: duration: durationType: location: autoPlayType: videoPlayRandom: networkId: fallbackIdString:]
        - [FWContext setVideoAssetCurrentTimePosition:]
        - [FWContext setSiteSectionId: idType: pageViewRandom: networkId: fallbackIdString:]
        - [FWContext addTemporalSlot: adUnit: timePosition: slotProfile: cuePointSequence: minDuration: maxDuration: acceptPrimaryContentType: acceptContentType:]
        - [FWContext addVideoPlayerNonTemporalSlot: adUnit: width: height: slotProfile: acceptCompanion: initialAdOption: acceptPrimaryContentType: acceptContentType: compatibleDimensions:]
        - [FWContext addSiteSectionNonTemporalSlot: adUnit: width: height: slotProfile: acceptCompanion: initialAdOption: acceptPrimaryContentType: acceptContentType: compatibleDimensions:]
        - [FWContext setVideoDisplayCompatibleSizes:]
        - [FWContext setRequestMode:]
        - [FWContext setRequestDuration:]
        - [FWContext resetExclusivity:]
        - [FWContext startSubsessionWithToken:]
        - [FWContext submitRequestWithTimeout:]
    - New APIs
        - FWAdRequestConfiguration
        - FWTemporalSlotConfiguration
        - FWNonTemporalSlotConfiguration
        - FWVisitorConfiguration
        - FWSiteSectionConfiguration
        - FWVideoAssetConfiguration
        - [FWContext submitRequestWithConfiguration: timeout:]

**6.15.6.0**

- ESC-6717  [iOS/tvOS] Fixed a bug FWStreamStitcherContext that caused the player's pause event not to be recognized properly by the SDK.

**6.15.0.0**

- ESC-5956 [iOS/tvOS] Fixed a problem that App crashes on adding creative rendition due to out of memory .
- ESC-6121[iOS] Fixed a problem that creativeData parameter which contains newline characters in VPAID are not passed correctly.

**6.14.5.0**
- EPU-11 [iOS/tvOS] Add setAdVolume API in iOS/tvOS SDKs so that the player can change the ad volume
- ESC-6264 [iOS/tvOS] Fix a warning message in FreeWheel SDK when the FWContext instance is being deallocated

**6.14.3.1**
- ESC-6104 [iOS/tvOS] Fix a problem that app crashes on referencing a deallocated object in FWToolBarWebView.
- ESC-6106 [iOS/tvOS] Fix a problem that FWImageAdRenderer does not use creative rendition size for image overlay ad.

**6.14.2.0**
- ESC-6084 [iOS/tvOS] Admanager and player crashes when VIDEO ad does not contain a URL

**6.14.0.1**
- OPP-6817 [iOS/tvOS] Merge the AdManager and Hybrid SDKs to suppport client side beaconing for FreeWheel Stream Stitching integrations in AdManager
    - New API: FWStreamStitcherContext

**6.12.0**
- OPP-7549 [iOS/tvOS] Add support for iOS/tvOS 10 and deprecate support for iOS 7.

**6.11.0**
- OPP-6943 [tvOS] Release the tvOS SDK.
- OPP-6179 [iOS/tvOS] Add an Image Renderer for tvOS and iOS which can renderer image ads through UIImageView.
- OPP-7285 [iOS/tvOS] Dispatch the request initiated Event immediately after [FWContext submitRequest: withTimeout:] is called.

**6.10.0**
- OPP-779 [iOS] Support for Airplay while the app is in background
    - New API: FWVideoAdDelegate
- ESC-4485 [iOS] Fixed the issue that ad buffering start/end events are not dispatched as FWAdEventNotification

**6.9.3**
- ESC-4242 [iOS] Fixed a bug that ad request is not immediately canceled if the FWContext instance associated is released before the request completes.

**6.9.2**
- INK-10081 [iOS] Improve the video renderer for the video view to be scaled smoothly when the player size changes during ad playback

**6.9.0**
- OPP-5381 [iOS] Implemented Slot.skipCurrentAd() for the app to be able to skip the current ad in the current playing slot. Note that it's only valid for linear ads.
- ESC-3559 [iOS] Fixed the bug that the page view random parameter in [FWContext setSiteSectionId: idType: pageViewRandom: networkId fallbackId:] became a negative number in the ad request if it's larger that 2^32 on 64-bit devices.

**6.8.3**
- ESC-3835 [iOS] Fixed an issue that XCode reports bitcode support is missing in FreeWheel SDK when it archives the app for App Store submission. The issue is introduced by XCode 7.3 (related discussion: http://stackoverflow.com/questions/36184930/xcodebuild-7-3-cant-enable-bitcode). We fixed it with a linker flag that enforces bitcode support in the FreeWheel SDK.

**6.8.1**
- ESC-3775 [iOS] Fixed a bug that site section id and video asset id are populated in the ad request using the same value as their custom IDs.

**6.8.0**
- OPP-4622 [iOS] SDK API design improvements: improved compatibility with Swift; renamed constants according to Apple's code conventions and guidelines.
- OPP-1701 [iOS] Added timeout detection for video ads using parameter FWParameterVideoAdRendererTimeout.
- ESC-3504 [iOS] Improves AdManager's fault tolerance when FWContext is not created / released in the main thread.
- ESC-2556 [iOS] Fixed a bug that ad request doesn't timeout.
- INK-7325 [iOS] Fixed a bug that in some cases a video ad can only be clicked once.
- INK-6634 [iOS] Fixed a bug that swipe gesture is recognized as click in the video ad renderer.

**6.6.3**
- ESC-2968 [iOS] Fixed the issue of SDK producing many warnings on other machines caused by change in build settings between Xcode 6 and Xcode 7

**6.6.1**
- OPP-3368 [iOS] Improved AdManager to support Bitcode. Now the SDK is bitcode-enabled and requires Xcode 7 or higher to work with.

**6.6.0**
- OPP-2361 [iOS] Improved AdManager to support iOS9 and removed some deprecated APIs and internal code.
    - Removed APIs:
        - [FWContext setMoviePlayerFullscreen]
        - [FWContext setMoviePlayerController]
        - [FWRendererController moviePlayerController]
        - [FWRendererController moviePlayerFullscreen]
    - Replaced NSURLConnection with NSURLSession.
    - Replaced [NSString stringByReplacingPercentEscapesUsingEncoding:] with [NSString stringByRemovingPercentEncoding].
    - Removed airPlayVideoActive property of AVPlayer.
Replaced libxml2.dylib with libxml2.tbd.
