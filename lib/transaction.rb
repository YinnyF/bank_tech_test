class Transaction
  attr_reader :date
  
  def initialize
    @date = Time.now
  end
end
