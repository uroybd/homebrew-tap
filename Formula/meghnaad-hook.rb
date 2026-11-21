class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.41/meghnaad-hook-0.8.41-aarch64-apple-darwin.tar.gz"
      sha256 "071871f2edf6ae07977e84127e857d5fc1abe1613fe6e7daa4e1c7b0ecd3f60b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.41/meghnaad-hook-0.8.41-x86_64-apple-darwin.tar.gz"
      sha256 "b18ba3ccec5c77a3ba0bcadeda0b606867549c57ad8d9f2d52fa5f84f6aa4237"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.41/meghnaad-hook-0.8.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5bba3ce3e7b95f09c2231618223f0dde476557fb2d8a538249a47d45fa533e8e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.41/meghnaad-hook-0.8.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45333eadf76e31ceaae02f351eb6a9c1a60f919f0b0e49f52e645d11cb7e2337"
    end
  end

  def install
    bin.install "meghnaad-hook"
  end

  def caveats
    <<~EOS
      Point task at your script, once (and again when it defines a hook it did not before):
        meghnaad-hook check ~/hooks.lua
        meghnaad-hook install ~/hooks.lua
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.41/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
