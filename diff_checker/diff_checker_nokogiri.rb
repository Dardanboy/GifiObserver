require 'nokogiri/diff' # gem install nokogiri-diff

class DiffCheckerNokogiri
  def data_diffs(data_1, data_2)
    changes = []
    Nokogiri::HTML(data_1).diff(Nokogiri::HTML(data_2), :added => true) do |change, node| # We check for the added changes (we could use :removed or :added with Nokogiri)
      changes << node.to_html
    end

    changes
  end
end
