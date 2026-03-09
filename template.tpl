___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_consentcheck_consent_default",
  "version": 1,
  "securityGroups": [],
  "displayName": "ConsentCheck – Consent Mode v2 Default",
  "categories": ["TAG_MANAGEMENT", "UTILITY", "ADVERTISING"],
  "description": "Set Consent Mode v2 default to denied (GDPR/CCPA compliant). Fire on Consent Initialization. Wire your CMP to call updateConsentState when users accept. Verify at consentcheck.online",
  "containerContexts": ["WEB"]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "waitForUpdate",
    "displayName": "Wait for update (ms)",
    "simpleValueType": true,
    "defaultValue": "500",
    "help": "Milliseconds to wait for your CMP to update consent before tags fire. Default 500. Increase if your CMP loads slowly.",
    "valueValidators": [
      {
        "type": "REGEX",
        "args": ["^\\d+$"]
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "verifyLabel",
    "displayName": "After setup: verify Consent Mode v2 at consentcheck.online"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const setDefaultConsentState = require('setDefaultConsentState');

var waitMs = 500;
if (data.waitForUpdate) {
  var n = data.waitForUpdate - 0;
  if (n === n && n >= 0) {
    waitMs = n;
  }
}

setDefaultConsentState({
  'ad_storage': 'denied',
  'ad_user_data': 'denied',
  'ad_personalization': 'denied',
  'analytics_storage': 'denied',
  'wait_for_update': waitMs
});

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_consent",
        "versionId": "1"
      },
      "param": [
        {
          "key": "consentTypes",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "ad_storage"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "ad_user_data"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "ad_personalization"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "consentType"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"}
                ],
                "mapValue": [
                  {"type": 1, "string": "analytics_storage"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {"isEditedByUser": true},
    "isRequired": true
  }
]


___TESTS___

scenarios:
  - name: Sets default consent denied
    code: |-
      const mockData = {
        waitForUpdate: '500',
        adsDataRedaction: false,
        urlPassthrough: false
      };

      let consentState = null;
      mock('setDefaultConsentState', (state) => {
        consentState = state;
      });

      runCode(mockData);

      assertThat(consentState).isNotNull();
      assertThat(consentState.ad_storage).isEqualTo('denied');
      assertThat(consentState.ad_user_data).isEqualTo('denied');
      assertThat(consentState.ad_personalization).isEqualTo('denied');
      assertThat(consentState.analytics_storage).isEqualTo('denied');
      assertThat(consentState.wait_for_update).isEqualTo(500);
      assertApi('gtmOnSuccess').wasCalled();

  - name: Custom wait_for_update
    code: |-
      const mockData = {
        waitForUpdate: '1000',
        adsDataRedaction: false,
        urlPassthrough: false
      };

      let consentState = null;
      mock('setDefaultConsentState', (state) => {
        consentState = state;
      });

      runCode(mockData);

      assertThat(consentState.wait_for_update).isEqualTo(1000);
      assertApi('gtmOnSuccess').wasCalled();


___NOTES___

ConsentCheck Consent Mode v2 Default template. Fire on Consent Initialization - All Pages.
Wire your CMP to call updateConsentState when users accept. Verify at consentcheck.online
