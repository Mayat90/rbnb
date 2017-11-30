class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: :home

  def home
    @data = {address: "", start:"", end: "", number_of_kids: 1, domicile: true}
    @data[:address] = session['address'] if session['address']
    @data[:start] = session['start'] if session['start']
    @data[:end] = session['end'] if session['end']
    @data[:number_of_kids] = session['number_of_kids'] if session['number_of_kids']
    @data[:domicile] = session['domicile'] if session['domicile']

  end
end
