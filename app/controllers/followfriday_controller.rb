class FollowfridayController < ApplicationController

  def index

    if session['access_token'] && session['access_token_secret']

      begin

        @user = client.user()
        friendsId = client.friend_ids().to_a
        @friends = Array.new
        friendsId.each_slice(100) do |slice|
          @friends << client.users(slice)

        end

        @friendsDetail = Array.new
        @friends.each do |friend|
          @friendsDetail.concat(friend)
        end

      rescue Twitter::Error::TooManyRequests => error

        puts "Rate limit error, sleeping for #{error.rate_limit.reset_in} seconds..."
        sleep error.rate_limit.reset_in
        retry

      end

    else

      redirect_to failure_path

    end

  end

end
