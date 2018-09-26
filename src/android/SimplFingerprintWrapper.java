package com.simpl;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.simpl.android.fingerprint.SimplFingerprintListener;
import com.simpl.android.fingerprint.SimplFingerprint;
import android.content.Context;

public class SimplFingerprintWrapper extends CordovaPlugin {

    @Override
    public boolean execute(final String action, final JSONArray args, final CallbackContext callbackContext) throws JSONException {
        if (action.equals("generateFingerprint")) {
            String phoneNumber = args.getString(1);
            String email = args.getString(2);
            this.generateFingerprint(phoneNumber, email, callbackContext);
            return true;
        }
        return false;
    }

    private void generateFingerprint(final String phoneNumber, final String email, final CallbackContext callbackContext) {
        Context context=this.cordova.getActivity().getApplicationContext();
        SimplFingerprint.init(context, phoneNumber, email);
        SimplFingerprint.getInstance().generateFingerprint(new SimplFingerprintListener() {
            @Override
            public void fingerprintData(String payload) {
                callbackContext.success(payload);
            }
        });
    }
}
