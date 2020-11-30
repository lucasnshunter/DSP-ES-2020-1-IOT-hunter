class CercaController < ApplicationController
  def home
      @fences = Fence.all
  end
end
