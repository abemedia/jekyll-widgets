# Jekyll Widgets

A set of useful widgets for jekyll sites.

[![Gem Version](https://badge.fury.io/rb/jekyll-widgets.svg)](https://badge.fury.io/rb/jekyll-widgets) [![Build Status](https://travis-ci.org/abeMedia/jekyll-widgets.svg)](https://travis-ci.org/abemedia/jekyll-widgets)

## What it does

Jekyll Widgets is a collection of snippets for common hosted apps & widgets such as a youtube video, facebook comments or Google Analytics.

## Installation

1. Add the following to your site's `Gemfile`:

  ```ruby
  gem 'jekyll-widgets'
  ```

2. Add the following to your site's `_config.yml`:

  ```yml
  gems:
    - jekyll-widgets
  ```

## Usage

Jekyll Widgets contains a number of different widgets, all with their own configuration parameters.
The general syntax is as follows:

```liquid
{% widget widget-name param1="var1" param2="var2" %}
```

You can use liquid variables too, even passing all params as a single hash.

Consider the following example:

```liquid
---
provider: piwik
options:
  baseurl: //example.com
  site_id: 123
---
{% widget {{page.provider}} params=page.options %}
```

Is the same as:

```liquid
---
{% widget piwik site_id=123 baseurl="//example.com" %}
```

## Available Widgets

### Analytics

#### Google Analytics

```liquid
{% widget google_analytics tracking_id=GOOGLE_ANALYTICS_TRACKING_ID %}
```

#### GetClicky

```liquid
{% widget getclicky site_id=GETCLICKY_SITE_ID %}
```

#### Mixpanel

```liquid
{% widget mixpanel token=MIXPANEL_TOKEN %}
```

#### Piwik

```liquid
{% widget piwik site_id=PIWIK_SITE_ID baseurl="//yoursite.com" %}
```

### Comments

#### Disqus

```liquid
{% widget disqus shortname=DISQUS_SHORTNAME %}
```

#### Facebook Comments

```liquid
{% widget facebook_comments appid=YOUR_FACEBOOK_APP_ID num_posts=5 width=500 colorscheme="dark" %}
```

#### IntenseDebate

```liquid
{% widget intensedebate account=YOUR_INTENSEDEBATE_ACCOUNT %}
```

#### Livefyre

```liquid
{% widget livefyre site_id=YOUR_LIVEFYRE_SITE_ID %}
```

### Share Buttons

#### DonReach

```liquid
{% widget donshare providers="facebook,twitter,google,linkedin,pinterest" %}
```
