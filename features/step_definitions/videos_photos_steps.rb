When(/^Filter "(.*?)" from Media Type Overlay$/) do |filter_type|
  find('.media-filter-link').click
  find('.media-select-option', :text => filter_type).click
  find('.close-media-filter').click
end

Then(/^I should see "([^"]*)" heading$/) do |media_header|

  if media_header == 'All'
    expect(page).to have_selector('.media-page-heading', :text => 'VIDEOS & PHOTOS')
  elsif media_header == 'Videos'
    expect(page).to have_selector('.media-page-heading', :text => 'VIDEOS')
  elsif media_header == 'Photos'
    expect(page).to have_selector('.media-page-heading', :text => 'PHOTOS')
  end

end

And(/^I should see both videos and photos on the page$/) do

  all('.media-container-details').each  { | media_details |
    if media_details.first('a')["class"] == 'grid-photo-link'

      photo_title = media_details.find('span.photo-item-title').text

      # Debugging
      # puts photo_title
      # puts ""

      expect(photo_title).to match(/\w/)
      expect(media_details).to have_selector('.media-gallery-icon')
    else
      duration = media_details.find('span.video-first-duration').text
      video_title = media_details.find('span.video-first-title').text

      # puts duration
      # puts video_title
      # puts ""

      expect(duration).to match(/^\d{2}:\d{2}/)
      expect(video_title).to match(/\w/)
      expect(page).to have_selector('.media-play-icon')
    end

  }

end

And(/^I should see only "([^"]*)" on the page$/) do |filter_type|
  if filter_type == 'Videos'
    all('.media-container-details').each do |video_details|
      # Set the video details to a variable to validated 'duration' contains time syntax and 'title' contains text
      duration = video_details.find('span.video-first-duration').text
      video_title = video_details.find('span.video-first-title').text

      # Debugging
      # puts duration
      # puts video_title

      expect(duration).to match(/^\d{2}:\d{2}/)
      expect(video_title).to match(/\w/)
      expect(page).to have_selector('.media-play-icon')
      expect(page).to have_no_selector('.media-gallery-icon')
    end
  elsif filter_type == 'Photos'
    all('.media-container-details').each do |photo_details|
      # Set the photo details to a variable to validated 'title' contains text
      photo_title = photo_details.find('span.photo-item-title').text

      # Debugging
      # puts photo_title

      expect(photo_title).to match(/\w/)
      expect(page).to have_selector('.media-gallery-icon')
      expect(page).to have_no_selector('.media-play-icon')
    end
  end
end