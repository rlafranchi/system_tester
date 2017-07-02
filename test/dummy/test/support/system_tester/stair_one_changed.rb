module SystemTester
  module StairOneChanged
    def stair_one_changed
      # Assertion: Assert New Example
      assert_selector "h1", text: "New Example"

      # Action: Visit New Path as
      visit "/examples/new"

      # Action: Visit New Path as
      visit "/examples/new"

    end
  end
end
