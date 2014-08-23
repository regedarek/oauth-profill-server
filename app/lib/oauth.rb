class Oauth

  def initialize(params)
    @params = params
  end

  def valid?
    true
  end

  def params
    @params
  end
end
