class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.59"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.59/meghnaad-hook-0.8.59-aarch64-apple-darwin.tar.gz"
      sha256 "e0b85d2627903e85b338227c7ce43bb5a28d2f249888dc08952ccc8dd39a889b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.59/meghnaad-hook-0.8.59-x86_64-apple-darwin.tar.gz"
      sha256 "e1f269401c4bab4917774786ed73a1bd5cb892e32afb56b865f8ff0e3fd69f56"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.59/meghnaad-hook-0.8.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d76f5edea72c4721bc2ee64e7b47ac1683ea87ab9c77650472e6b09b832e809d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.59/meghnaad-hook-0.8.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2abcf8cb7b916b3f5676639bf1c6eefe77d7498125e28b1ea866bb2671858234"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.59/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
