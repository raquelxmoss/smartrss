def apply_feed_subscription_rules(feed_subscriptions)
  feed_subscriptions.each do |feed|
    rules = feed.rules
    if rules[:ignore_phrases]
      feed.feed.ignore_phrases(rules[:ignore_phrases])
    end
  end
end