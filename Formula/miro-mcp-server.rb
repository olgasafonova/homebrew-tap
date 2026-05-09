# Homebrew Formula for Miro MCP Server
# Usage: brew tap olgasafonova/tap && brew install miro-mcp-server

class MiroMcpServer < Formula
  desc "Model Context Protocol (MCP) server for Miro whiteboard integration"
  homepage "https://github.com/olgasafonova/miro-mcp-server"
  version "1.21.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.21.0/miro-mcp-server-darwin-amd64"
      sha256 "d75f81a5d62de66e67793ab6a1ecec62a0bb1880722a478ddb745f5e5365ca39"

      def install
        bin.install "miro-mcp-server-darwin-amd64" => "miro-mcp-server"
      end
    end

    on_arm do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.21.0/miro-mcp-server-darwin-arm64"
      sha256 "5771b582023eeed3bfdcf3d8459fcaa121106a2997489c440881ec9f9f7d5309"

      def install
        bin.install "miro-mcp-server-darwin-arm64" => "miro-mcp-server"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.21.0/miro-mcp-server-linux-amd64"
      sha256 "0988a03b523bc747db4633741c59c201a429c179ca5b891b47265d00183b772c"

      def install
        bin.install "miro-mcp-server-linux-amd64" => "miro-mcp-server"
      end
    end
  end

  def caveats
    <<~EOS
      Miro MCP Server has been installed!

      To use it, you need a Miro access token:

      1. Get a token from: https://miro.com/app/settings/user-profile/apps

      2. Configure Claude Code:
         claude mcp add miro-mcp-server -- miro-mcp-server

      3. Set the token as environment variable:
         export MIRO_ACCESS_TOKEN="your_token_here"

      For more information, see:
        https://github.com/olgasafonova/miro-mcp-server#readme
    EOS
  end

  test do
    assert_match "miro-mcp-server", shell_output("#{bin}/miro-mcp-server --version 2>&1", 1)
  end
end
