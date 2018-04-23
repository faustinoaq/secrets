require "./spec_helper"

describe Secrets do
  it ".gets" do
    password = FakeSecrets.gets
    password.should eq "abc"
  end

  it ".gets with prompt" do
    FakeIO.rewind
    password = FakeSecrets.gets prompt: "password: "
    password.should eq "abc"
  end

  it ".gets with empty_error" do
    spawn do
      FakeIO.rewind
    end
    password = FakeSecrets.gets empty_error: "Try again!"
    password.should eq "abc"
  end

  it ".gets with empty_error and no message" do
    spawn do
      FakeIO.rewind
    end
    password = FakeSecrets.gets prompt: ">>>", empty_error: ""
    password.should eq "abc"
  end

  it ".gets with empty_error and new line message" do
    spawn do
      FakeIO.rewind
    end
    password = FakeSecrets.gets prompt: ">>>", empty_error: "\n"
    password.should eq "abc"
  end

  it ".gets with hint character" do
    FakeIO.rewind
    password = FakeSecrets.gets hint: "."
    password.should eq "abc"
  end

  it ".gets without hint character" do
    FakeIO.rewind
    password = FakeSecrets.gets hint: ""
    password.should eq "abc"
  end

  it ".gets with all options" do
    spawn do
      FakeIO.rewind
    end
    password = FakeSecrets.gets prompt: "Your secret: ", hint: "x", empty_error: "Please, Try again!"
    password.should eq "abc"
  end

  it ".gets with zero retry" do
    spawn do
      FakeIO.rewind
    end
    password = FakeSecrets.gets retry: 0
    password.should eq ""
  end

  it ".gets with one retry" do
    spawn do
      FakeIO.rewind
    end
    password = FakeSecrets.gets retry: 1
    password.should eq "abc"
  end

  it ".gets with one retry" do
    spawn do
      FakeIO.rewind
    end
    password = FakeSecrets.gets empty_error: "Try again!", retry: 1
    password.should eq "abc"
  end
end
