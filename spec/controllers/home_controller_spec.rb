require 'rails_helper'

describe HomeController do
  context '.top_streamer' do
    it 'request is successful' do
      VCR.use_cassette("home_controller.top_streamer") do
        get :top_streamer
        expect(response).to render_template("shared/_top_streamer")
      end
    end
  end

  context '.twitch_call' do
    it 'request is successful' do
      VCR.use_cassette("home_controller.twitch_call") do
        get :twitch_call
        expect(response).to render_template("shared/_twitch")
      end
    end
  end

  context '.movie_call' do
    it 'request is successful' do
      VCR.use_cassette("home_controller.movie_call") do
        get :movie_call
        expect(response).to render_template("shared/_movies")
      end
    end
  end

  context '.ign_call' do
    it 'request is successful' do
      VCR.use_cassette("home_controller.ign_call") do
        get :ign_call
        expect(response).to render_template("shared/_ign")
      end
    end
  end

  context '.hackers' do
    it 'request is successful' do
      VCR.use_cassette("home_controller.hackers") do
        get :hackers
        expect(response).to render_template("shared/_hacker")
      end
    end
  end

  context '.espn' do
    it 'request is successful' do
      VCR.use_cassette("home_controller.espn") do
        get :espn
        expect(response).to render_template("shared/_espn")
      end
    end
  end 

  context '.reddit' do
    it 'request is successful' do
      VCR.use_cassette("home_controller.reddit") do
        get :reddit
        expect(response).to render_template("shared/_reddit")
      end
    end
  end
end