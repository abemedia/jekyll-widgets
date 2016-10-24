# Frozen-string-literal: true
# Copyright: 2016 - MIT License
# Encoding: utf-8

module Jekyll
  module Tags
    class Widgets < Jekyll::Tags::IncludeTag
      def initialize(tag_name, markup, tokens)
        super
        @widget = @file
        @file += ".html"
      end

      def parse_params(context)
        params = super(context)
        if params.key?("params")
          p = params.delete("params")
          Jekyll::Utils.deep_merge_hashes!(params, p)
        end
        params
      end

      def locate_include_file(_context, file, _safe)
        path = File.join(widget_path, file)
        return path if File.exist?(path)
        raise IOError, "Widget not found: '#{@widget}'. "\
          "For a full list of available widgets visit "\
          "https://github.com/abemedia/jekyll-widgets."
      end

      def widget_path
        @widget_path ||= begin
          File.expand_path "./jekyll/widgets/html", File.dirname(__FILE__)
        end
      end
    end
  end
end

Liquid::Template.register_tag("widget", Jekyll::Tags::Widgets)
