import parsers


def test_Cisco_9k_sw_version_parser():
    assert parsers.Cisco_9k_sw_version_parser("fake string") == "0.0.0"
    assert (
        parsers.Cisco_9k_sw_version_parser(
            "Extra_data\ndummy data\nCisco IOS Software [Gibraltar], Catalyst L3 Switch Software (CAT9K_LITE_IOSXE), Version 16.10.1, RELEASE SOFTWARE (fc1)"
        )
        == "16.10.1"
    )
