module Api
  class HistoryTrackersController < Api::BaseController
    def index
      @history_trackers = HistoryTracker.all
    end
  end
end