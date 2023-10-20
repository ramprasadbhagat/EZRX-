package com.zuelligpharma.ezrxplus

import android.content.Intent
import android.os.Build
import com.clevertap.android.sdk.CleverTapAPI
import io.flutter.embedding.android.FlutterFragmentActivity


class MainActivity: FlutterFragmentActivity() {

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)

        // On Android 12 and above, inform the notification click to get the above mentioned callback on dart side.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val cleverTapDefaultInstance = CleverTapAPI.getDefaultInstance(this);
            cleverTapDefaultInstance?.pushNotificationClickedEvent(intent.extras)
        }
    }
}