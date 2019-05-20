module PortfoliosHelper
  def image_generator(height:, width:)
    "https://via.placeholder.com/#{height}x#{width}"
  end

  def portfolio_image image, type
    if image 
      image
    elsif type == 'thumb'
      image_generator(height: '300', width: '250')
    else
      image_generator(height: '600', width: '400')
    end
  end
end


