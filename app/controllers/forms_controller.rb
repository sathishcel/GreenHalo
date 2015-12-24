class FormsController < ApplicationController

  def basic_forms
  end

  def advanced
  end

  def wizard
    if params[:business] == "true"
      @signup_type = "Business"
    else
      @signup_type = "Government"
    end
  end

  def file_upload
  end

  def text_editor
  end

end
