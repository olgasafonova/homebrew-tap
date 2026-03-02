# Homebrew Formula for Miro MCP Server
# Usage: brew tap olgasafonova/tap && brew install miro-mcp-server

class MiroMcpServer < Formula
  desc "Model Context Protocol (MCP) server for Miro whiteboard integration"
  homepage "https://github.com/olgasafonova/miro-mcp-server"
  version "1.15.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.15.1/miro-mcp-server-darwin-amd64"
      sha256 "ca77d78364272ff101fd6bb11ed02fc1d5727ca251a4f9f09c05b874fd094cc3"

      def install
        bin.install "miro-mcp-server-darwin-amd64" => "miro-mcp-server"
      end
    end

    on_arm do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.15.1/miro-mcp-server-darwin-arm64"
      sha256 "d2ba91d1213263531c1e8d0d2296ba979ac55b45f4fe6f581dc6399ec1c56985"

      def install
        bin.install "miro-mcp-server-darwin-arm64" => "miro-mcp-server"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/olgasafonova/miro-mcp-server/releases/download/v1.15.1/miro-mcp-server-linux-amd64"
      sha256 "ff115eb60e74bfc84547ced4a8c50667ef66fce3a554cb56d6f02f7923311a6f"

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
