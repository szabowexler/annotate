match_rules =
  conditions: [
    new chrome.declarativeContent.PageStateMatcher(
      pageUrl:
        hostContains: 'clients.mindbodyonline',
        schemes: ['https']
    )
  ]
  actions: [new chrome.declarativeContent.ShowPageAction()]

chrome.runtime.onInstalled.addListener((details) ->
  chrome.declarativeContent.onPageChanged.removeRules(undefined, ->
    chrome.declarativeContent.onPageChanged.addRules([match_rules])
  )
)
