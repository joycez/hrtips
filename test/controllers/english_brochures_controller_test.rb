# coding: utf-8

require 'test_helper'

class EnglishBrochuresControllerTest < ActionController::TestCase
  setup do
    @english_brochure = english_brochures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:english_brochures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create english_brochure" do
    assert_difference('EnglishBrochure.count') do
      post :create, english_brochure: {  }
    end

    assert_redirected_to english_brochure_path(assigns(:english_brochure))
  end

  test "should show english_brochure" do
    get :show, id: @english_brochure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @english_brochure
    assert_response :success
  end

  test "should update english_brochure" do
    patch :update, id: @english_brochure, english_brochure: {  }
    assert_redirected_to english_brochure_path(assigns(:english_brochure))
  end

  test "should destroy english_brochure" do
    assert_difference('EnglishBrochure.count', -1) do
      delete :destroy, id: @english_brochure
    end

    assert_redirected_to english_brochures_path
  end
end
