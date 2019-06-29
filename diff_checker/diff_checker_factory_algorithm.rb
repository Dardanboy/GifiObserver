require_relative 'diff_checker_nokogiri'

class DiffCheckerFactoryAlgorithm

  def self.use(algorithm)
    case algorithm
    when "Nokogiri"
      require_relative 'diff_checker_nokogiri'
      return DiffCheckerNokogiri.new
    else
      puts "Algorithm for diff not known"
    end
  end
end
