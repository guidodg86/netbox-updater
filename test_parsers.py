import parsers


def test_Cisco_9k_sw_version_parser():
    assert parsers.Cisco_9k_sw_version_parser("fake string") == "0.0.0"
    assert (
        parsers.Cisco_9k_sw_version_parser(
            "Extra_data\ndummy data\nCisco IOS Software [Gibraltar], Catalyst L3 Switch Software (CAT9K_LITE_IOSXE), Version 16.10.1, RELEASE SOFTWARE (fc1)"
        )
        == "16.10.1"
    )


def test_Cisco_nexus_sw_version_parser():
    assert parsers.Cisco_NEXUS_sw_version_parser("fake string") == "0.0.0"
    assert (
        parsers.Cisco_NEXUS_sw_version_parser(
            "Extra_data\ndummy data\nsystem: version 5.0(2)N2(1) [build 5.0(2)N2(1)]"
        )
        == "5.0(2)N2(1)"
    )


def test_Cisco_ASA_sw_version_parser():
    assert parsers.Cisco_ASA_sw_version_parser("fake string") == "0.0.0"
    assert (
        parsers.Cisco_ASA_sw_version_parser(
            "Extra_data\ndummy data\nCisco Adaptive Security Appliance Software Version 9.8(2)"
        )
        == "9.8(2)"
    )


def test_Aruba_7205_sw_version_parser():
    assert parsers.Aruba_7205_sw_version_parser("fake string") == "0.0.0"
    assert (
        parsers.Aruba_7205_sw_version_parser(
            "Extra_data\ndummy data\nSoftware Version        : ArubaOS 8.0.0.0-svcs-ctrl (Digitally Signed - Developer/Internal Build)"
        )
        == "8.0.0.0-svcs-ctrl"
    )


def test_PaloAlto_sw_version_parser():
    assert parsers.PaloAlto_sw_version_parser("fake string") == "0.0.0"
    assert (
        parsers.PaloAlto_sw_version_parser("Extra_data\ndummy data\nsw-version: 8.0.4")
        == "8.0.4"
    )
