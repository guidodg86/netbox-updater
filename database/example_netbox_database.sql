--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO netbox;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO netbox;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: circuits_circuit; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuit (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    cid character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    install_date date,
    commit_rate integer,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id bigint NOT NULL,
    tenant_id bigint,
    termination_a_id bigint,
    termination_z_id bigint,
    type_id bigint NOT NULL,
    CONSTRAINT circuits_circuit_commit_rate_check CHECK ((commit_rate >= 0))
);


ALTER TABLE public.circuits_circuit OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuit_id_seq OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuit_id_seq OWNED BY public.circuits_circuit.id;


--
-- Name: circuits_circuittermination; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittermination (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    term_side character varying(1) NOT NULL,
    port_speed integer,
    upstream_speed integer,
    xconnect_id character varying(50) NOT NULL,
    pp_info character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_type_id integer,
    cable_id bigint,
    circuit_id bigint NOT NULL,
    provider_network_id bigint,
    site_id bigint,
    CONSTRAINT circuits_circuittermination__link_peer_id_a4b01a1e_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT circuits_circuittermination_port_speed_check CHECK ((port_speed >= 0)),
    CONSTRAINT circuits_circuittermination_upstream_speed_check CHECK ((upstream_speed >= 0))
);


ALTER TABLE public.circuits_circuittermination OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittermination_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittermination_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittermination_id_seq OWNED BY public.circuits_circuittermination.id;


--
-- Name: circuits_circuittype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.circuits_circuittype OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittype_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittype_id_seq OWNED BY public.circuits_circuittype.id;


--
-- Name: circuits_provider; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_provider (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    asn bigint,
    account character varying(30) NOT NULL,
    portal_url character varying(200) NOT NULL,
    noc_contact text NOT NULL,
    admin_contact text NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.circuits_provider OWNER TO netbox;

--
-- Name: circuits_provider_asns; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_provider_asns (
    id bigint NOT NULL,
    provider_id bigint NOT NULL,
    asn_id bigint NOT NULL
);


ALTER TABLE public.circuits_provider_asns OWNER TO netbox;

--
-- Name: circuits_provider_asns_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_provider_asns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_provider_asns_id_seq OWNER TO netbox;

--
-- Name: circuits_provider_asns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_provider_asns_id_seq OWNED BY public.circuits_provider_asns.id;


--
-- Name: circuits_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_provider_id_seq OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_provider_id_seq OWNED BY public.circuits_provider.id;


--
-- Name: circuits_providernetwork; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_providernetwork (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id bigint NOT NULL,
    service_id character varying(100) NOT NULL
);


ALTER TABLE public.circuits_providernetwork OWNER TO netbox;

--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_providernetwork_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_providernetwork_id_seq OWNER TO netbox;

--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_providernetwork_id_seq OWNED BY public.circuits_providernetwork.id;


--
-- Name: dcim_cable; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cable (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    termination_a_id bigint NOT NULL,
    termination_b_id bigint NOT NULL,
    type character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    label character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    length numeric(8,2),
    length_unit character varying(50) NOT NULL,
    _abs_length numeric(10,4),
    _termination_a_device_id bigint,
    _termination_b_device_id bigint,
    termination_a_type_id integer NOT NULL,
    termination_b_type_id integer NOT NULL,
    tenant_id bigint,
    CONSTRAINT dcim_cable_termination_a_id_check CHECK ((termination_a_id >= 0)),
    CONSTRAINT dcim_cable_termination_b_id_check CHECK ((termination_b_id >= 0))
);


ALTER TABLE public.dcim_cable OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cable_id_seq OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cable_id_seq OWNED BY public.dcim_cable.id;


--
-- Name: dcim_cablepath; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cablepath (
    id bigint NOT NULL,
    origin_id bigint NOT NULL,
    destination_id bigint,
    path character varying(40)[] NOT NULL,
    is_active boolean NOT NULL,
    is_split boolean NOT NULL,
    destination_type_id integer,
    origin_type_id integer NOT NULL,
    CONSTRAINT dcim_cablepath_destination_id_check CHECK ((destination_id >= 0)),
    CONSTRAINT dcim_cablepath_origin_id_check CHECK ((origin_id >= 0))
);


ALTER TABLE public.dcim_cablepath OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cablepath_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cablepath_id_seq OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cablepath_id_seq OWNED BY public.dcim_cablepath.id;


--
-- Name: dcim_consoleport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    speed integer,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    module_id bigint,
    CONSTRAINT dcim_consoleport__link_peer_id_aa92484e_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_consoleport_speed_check CHECK ((speed >= 0))
);


ALTER TABLE public.dcim_consoleport OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleport_id_seq OWNED BY public.dcim_consoleport.id;


--
-- Name: dcim_consoleporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id bigint,
    module_type_id bigint
);


ALTER TABLE public.dcim_consoleporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleporttemplate_id_seq OWNED BY public.dcim_consoleporttemplate.id;


--
-- Name: dcim_consoleserverport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    speed integer,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    module_id bigint,
    CONSTRAINT dcim_consoleserverport__link_peer_id_9b7c4549_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_consoleserverport_speed_check CHECK ((speed >= 0))
);


ALTER TABLE public.dcim_consoleserverport OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverport_id_seq OWNED BY public.dcim_consoleserverport.id;


--
-- Name: dcim_consoleserverporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id bigint,
    module_type_id bigint
);


ALTER TABLE public.dcim_consoleserverporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverporttemplate_id_seq OWNED BY public.dcim_consoleserverporttemplate.id;


--
-- Name: dcim_device; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_device (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    name character varying(64),
    _name character varying(100),
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    "position" smallint,
    face character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    vc_position smallint,
    vc_priority smallint,
    comments text NOT NULL,
    cluster_id bigint,
    device_role_id bigint NOT NULL,
    device_type_id bigint NOT NULL,
    location_id bigint,
    platform_id bigint,
    primary_ip4_id bigint,
    primary_ip6_id bigint,
    rack_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    virtual_chassis_id bigint,
    airflow character varying(50) NOT NULL,
    CONSTRAINT dcim_device_position_check CHECK (("position" >= 0)),
    CONSTRAINT dcim_device_vc_position_check CHECK ((vc_position >= 0)),
    CONSTRAINT dcim_device_vc_priority_check CHECK ((vc_priority >= 0))
);


ALTER TABLE public.dcim_device OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_device_id_seq OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_device_id_seq OWNED BY public.dcim_device.id;


--
-- Name: dcim_devicebay; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebay (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint NOT NULL,
    installed_device_id bigint
);


ALTER TABLE public.dcim_devicebay OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebay_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebay_id_seq OWNED BY public.dcim_devicebay.id;


--
-- Name: dcim_devicebaytemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebaytemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_devicebaytemplate OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebaytemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebaytemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebaytemplate_id_seq OWNED BY public.dcim_devicebaytemplate.id;


--
-- Name: dcim_devicerole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicerole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    vm_role boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_devicerole OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicerole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicerole_id_seq OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicerole_id_seq OWNED BY public.dcim_devicerole.id;


--
-- Name: dcim_devicetype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicetype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    model character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    part_number character varying(50) NOT NULL,
    u_height smallint NOT NULL,
    is_full_depth boolean NOT NULL,
    subdevice_role character varying(50) NOT NULL,
    front_image character varying(100) NOT NULL,
    rear_image character varying(100) NOT NULL,
    comments text NOT NULL,
    manufacturer_id bigint NOT NULL,
    airflow character varying(50) NOT NULL,
    CONSTRAINT dcim_devicetype_u_height_check CHECK ((u_height >= 0))
);


ALTER TABLE public.dcim_devicetype OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicetype_id_seq OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicetype_id_seq OWNED BY public.dcim_devicetype.id;


--
-- Name: dcim_frontport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    _link_peer_type_id integer,
    cable_id bigint,
    device_id bigint NOT NULL,
    rear_port_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    module_id bigint,
    CONSTRAINT dcim_frontport__link_peer_id_318ee0d1_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_frontport_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontport OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontport_id_seq OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontport_id_seq OWNED BY public.dcim_frontport.id;


--
-- Name: dcim_frontporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    device_type_id bigint,
    rear_port_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    module_type_id bigint,
    CONSTRAINT dcim_frontporttemplate_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontporttemplate OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontporttemplate_id_seq OWNED BY public.dcim_frontporttemplate.id;


--
-- Name: dcim_interface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    enabled boolean NOT NULL,
    mac_address macaddr,
    mtu integer,
    mode character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    lag_id bigint,
    parent_id bigint,
    untagged_vlan_id bigint,
    wwn macaddr8,
    bridge_id bigint,
    rf_role character varying(30) NOT NULL,
    rf_channel character varying(50) NOT NULL,
    rf_channel_frequency numeric(7,2),
    rf_channel_width numeric(7,3),
    tx_power smallint,
    wireless_link_id bigint,
    module_id bigint,
    vrf_id bigint,
    duplex character varying(50),
    speed integer,
    CONSTRAINT dcim_interface__link_peer_id_f93e17cf_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_interface_mtu_check CHECK ((mtu >= 0)),
    CONSTRAINT dcim_interface_speed_check CHECK ((speed >= 0)),
    CONSTRAINT dcim_interface_tx_power_check CHECK ((tx_power >= 0))
);


ALTER TABLE public.dcim_interface OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_id_seq OWNED BY public.dcim_interface.id;


--
-- Name: dcim_interface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_tagged_vlans (
    id bigint NOT NULL,
    interface_id bigint NOT NULL,
    vlan_id bigint NOT NULL
);


ALTER TABLE public.dcim_interface_tagged_vlans OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_tagged_vlans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_tagged_vlans_id_seq OWNED BY public.dcim_interface_tagged_vlans.id;


--
-- Name: dcim_interface_wireless_lans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_wireless_lans (
    id bigint NOT NULL,
    interface_id bigint NOT NULL,
    wirelesslan_id bigint NOT NULL
);


ALTER TABLE public.dcim_interface_wireless_lans OWNER TO netbox;

--
-- Name: dcim_interface_wireless_lans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_wireless_lans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_wireless_lans_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_wireless_lans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_wireless_lans_id_seq OWNED BY public.dcim_interface_wireless_lans.id;


--
-- Name: dcim_interfacetemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interfacetemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    device_type_id bigint,
    module_type_id bigint
);


ALTER TABLE public.dcim_interfacetemplate OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interfacetemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interfacetemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interfacetemplate_id_seq OWNED BY public.dcim_interfacetemplate.id;


--
-- Name: dcim_inventoryitem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitem (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    part_id character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    discovered boolean NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    device_id bigint NOT NULL,
    manufacturer_id bigint,
    parent_id bigint,
    role_id bigint,
    component_id bigint,
    component_type_id integer,
    CONSTRAINT dcim_inventoryitem_component_id_check CHECK ((component_id >= 0)),
    CONSTRAINT dcim_inventoryitem_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_inventoryitem_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_inventoryitem_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_inventoryitem_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_inventoryitem OWNER TO netbox;

--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_inventoryitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitem_id_seq OWNER TO netbox;

--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_inventoryitem_id_seq OWNED BY public.dcim_inventoryitem.id;


--
-- Name: dcim_inventoryitemrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitemrole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_inventoryitemrole OWNER TO netbox;

--
-- Name: dcim_inventoryitemrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_inventoryitemrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitemrole_id_seq OWNER TO netbox;

--
-- Name: dcim_inventoryitemrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_inventoryitemrole_id_seq OWNED BY public.dcim_inventoryitemrole.id;


--
-- Name: dcim_inventoryitemtemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitemtemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    component_id bigint,
    part_id character varying(50) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    component_type_id integer,
    device_type_id bigint NOT NULL,
    manufacturer_id bigint,
    parent_id bigint,
    role_id bigint,
    CONSTRAINT dcim_inventoryitemtemplate_component_id_check CHECK ((component_id >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_inventoryitemtemplate_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_inventoryitemtemplate OWNER TO netbox;

--
-- Name: dcim_inventoryitemtemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_inventoryitemtemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitemtemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_inventoryitemtemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_inventoryitemtemplate_id_seq OWNED BY public.dcim_inventoryitemtemplate.id;


--
-- Name: dcim_location; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_location (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    CONSTRAINT dcim_location_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_location_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_location_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_location_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_location OWNER TO netbox;

--
-- Name: dcim_location_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_location_id_seq OWNER TO netbox;

--
-- Name: dcim_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_location_id_seq OWNED BY public.dcim_location.id;


--
-- Name: dcim_manufacturer; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_manufacturer (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_manufacturer OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_manufacturer_id_seq OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_manufacturer_id_seq OWNED BY public.dcim_manufacturer.id;


--
-- Name: dcim_module; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_module (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    comments text NOT NULL,
    device_id bigint NOT NULL,
    module_bay_id bigint NOT NULL,
    module_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_module OWNER TO netbox;

--
-- Name: dcim_module_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_module_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_module_id_seq OWNER TO netbox;

--
-- Name: dcim_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_module_id_seq OWNED BY public.dcim_module.id;


--
-- Name: dcim_modulebay; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_modulebay (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    "position" character varying(30) NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint NOT NULL
);


ALTER TABLE public.dcim_modulebay OWNER TO netbox;

--
-- Name: dcim_modulebay_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_modulebay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_modulebay_id_seq OWNER TO netbox;

--
-- Name: dcim_modulebay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_modulebay_id_seq OWNED BY public.dcim_modulebay.id;


--
-- Name: dcim_modulebaytemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_modulebaytemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    "position" character varying(30) NOT NULL,
    description character varying(200) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_modulebaytemplate OWNER TO netbox;

--
-- Name: dcim_modulebaytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_modulebaytemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_modulebaytemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_modulebaytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_modulebaytemplate_id_seq OWNED BY public.dcim_modulebaytemplate.id;


--
-- Name: dcim_moduletype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_moduletype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    model character varying(100) NOT NULL,
    part_number character varying(50) NOT NULL,
    comments text NOT NULL,
    manufacturer_id bigint NOT NULL
);


ALTER TABLE public.dcim_moduletype OWNER TO netbox;

--
-- Name: dcim_moduletype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_moduletype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_moduletype_id_seq OWNER TO netbox;

--
-- Name: dcim_moduletype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_moduletype_id_seq OWNED BY public.dcim_moduletype.id;


--
-- Name: dcim_platform; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_platform (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    napalm_driver character varying(50) NOT NULL,
    napalm_args jsonb,
    description character varying(200) NOT NULL,
    manufacturer_id bigint
);


ALTER TABLE public.dcim_platform OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_platform_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_platform_id_seq OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_platform_id_seq OWNED BY public.dcim_platform.id;


--
-- Name: dcim_powerfeed; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerfeed (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    name character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    supply character varying(50) NOT NULL,
    phase character varying(50) NOT NULL,
    voltage smallint NOT NULL,
    amperage smallint NOT NULL,
    max_utilization smallint NOT NULL,
    available_power integer NOT NULL,
    comments text NOT NULL,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    power_panel_id bigint NOT NULL,
    rack_id bigint,
    CONSTRAINT dcim_powerfeed__link_peer_id_0b698860_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_powerfeed_amperage_check CHECK ((amperage >= 0)),
    CONSTRAINT dcim_powerfeed_available_power_check CHECK ((available_power >= 0)),
    CONSTRAINT dcim_powerfeed_max_utilization_check CHECK ((max_utilization >= 0))
);


ALTER TABLE public.dcim_powerfeed OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerfeed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerfeed_id_seq OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerfeed_id_seq OWNED BY public.dcim_powerfeed.id;


--
-- Name: dcim_poweroutlet; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlet (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    power_port_id bigint,
    module_id bigint,
    CONSTRAINT dcim_poweroutlet__link_peer_id_8c0fea3c_check CHECK ((_link_peer_id >= 0))
);


ALTER TABLE public.dcim_poweroutlet OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlet_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlet_id_seq OWNED BY public.dcim_poweroutlet.id;


--
-- Name: dcim_poweroutlettemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlettemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    device_type_id bigint,
    power_port_id bigint,
    module_type_id bigint
);


ALTER TABLE public.dcim_poweroutlettemplate OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlettemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlettemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlettemplate_id_seq OWNED BY public.dcim_poweroutlettemplate.id;


--
-- Name: dcim_powerpanel; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerpanel (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    location_id bigint,
    site_id bigint NOT NULL
);


ALTER TABLE public.dcim_powerpanel OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerpanel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerpanel_id_seq OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerpanel_id_seq OWNED BY public.dcim_powerpanel.id;


--
-- Name: dcim_powerport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    _link_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    module_id bigint,
    CONSTRAINT dcim_powerport__link_peer_id_c1d5750c_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_powerport_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerport_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerport OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerport_id_seq OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerport_id_seq OWNED BY public.dcim_powerport.id;


--
-- Name: dcim_powerporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    device_type_id bigint,
    module_type_id bigint,
    CONSTRAINT dcim_powerporttemplate_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerporttemplate_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerporttemplate OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerporttemplate_id_seq OWNED BY public.dcim_powerporttemplate.id;


--
-- Name: dcim_rack; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rack (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    facility_id character varying(50),
    status character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    type character varying(50) NOT NULL,
    width smallint NOT NULL,
    u_height smallint NOT NULL,
    desc_units boolean NOT NULL,
    outer_width smallint,
    outer_depth smallint,
    outer_unit character varying(50) NOT NULL,
    comments text NOT NULL,
    location_id bigint,
    role_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    CONSTRAINT dcim_rack_outer_depth_check CHECK ((outer_depth >= 0)),
    CONSTRAINT dcim_rack_outer_width_check CHECK ((outer_width >= 0)),
    CONSTRAINT dcim_rack_u_height_check CHECK ((u_height >= 0)),
    CONSTRAINT dcim_rack_width_check CHECK ((width >= 0))
);


ALTER TABLE public.dcim_rack OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rack_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rack_id_seq OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rack_id_seq OWNED BY public.dcim_rack.id;


--
-- Name: dcim_rackreservation; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackreservation (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    units smallint[] NOT NULL,
    description character varying(200) NOT NULL,
    rack_id bigint NOT NULL,
    tenant_id bigint,
    user_id integer NOT NULL
);


ALTER TABLE public.dcim_rackreservation OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackreservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackreservation_id_seq OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackreservation_id_seq OWNED BY public.dcim_rackreservation.id;


--
-- Name: dcim_rackrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackrole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_rackrole OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackrole_id_seq OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackrole_id_seq OWNED BY public.dcim_rackrole.id;


--
-- Name: dcim_rearport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearport (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _link_peer_id bigint,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    _link_peer_type_id integer,
    cable_id bigint,
    device_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    module_id bigint,
    CONSTRAINT dcim_rearport__link_peer_id_8bdc183e_check CHECK ((_link_peer_id >= 0)),
    CONSTRAINT dcim_rearport_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearport OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearport_id_seq OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearport_id_seq OWNED BY public.dcim_rearport.id;


--
-- Name: dcim_rearporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearporttemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    device_type_id bigint,
    color character varying(6) NOT NULL,
    module_type_id bigint,
    CONSTRAINT dcim_rearporttemplate_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearporttemplate OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearporttemplate_id_seq OWNED BY public.dcim_rearporttemplate.id;


--
-- Name: dcim_region; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_region (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT dcim_region_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_region_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_region_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_region_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_region OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_region_id_seq OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_region_id_seq OWNED BY public.dcim_region.id;


--
-- Name: dcim_site; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_site (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    facility character varying(50) NOT NULL,
    time_zone character varying(63) NOT NULL,
    description character varying(200) NOT NULL,
    physical_address character varying(200) NOT NULL,
    shipping_address character varying(200) NOT NULL,
    latitude numeric(8,6),
    longitude numeric(9,6),
    comments text NOT NULL,
    group_id bigint,
    region_id bigint,
    tenant_id bigint
);


ALTER TABLE public.dcim_site OWNER TO netbox;

--
-- Name: dcim_site_asns; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_site_asns (
    id bigint NOT NULL,
    site_id bigint NOT NULL,
    asn_id bigint NOT NULL
);


ALTER TABLE public.dcim_site_asns OWNER TO netbox;

--
-- Name: dcim_site_asns_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_site_asns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_site_asns_id_seq OWNER TO netbox;

--
-- Name: dcim_site_asns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_site_asns_id_seq OWNED BY public.dcim_site_asns.id;


--
-- Name: dcim_site_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_site_id_seq OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_site_id_seq OWNED BY public.dcim_site.id;


--
-- Name: dcim_sitegroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_sitegroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT dcim_sitegroup_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_sitegroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_sitegroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_sitegroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_sitegroup OWNER TO netbox;

--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_sitegroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_sitegroup_id_seq OWNER TO netbox;

--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_sitegroup_id_seq OWNED BY public.dcim_sitegroup.id;


--
-- Name: dcim_virtualchassis; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_virtualchassis (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    domain character varying(30) NOT NULL,
    master_id bigint
);


ALTER TABLE public.dcim_virtualchassis OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_virtualchassis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_virtualchassis_id_seq OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_virtualchassis_id_seq OWNED BY public.dcim_virtualchassis.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO netbox;

--
-- Name: extras_configcontext; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    data jsonb NOT NULL,
    CONSTRAINT extras_configcontext_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_configcontext OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_cluster_groups (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    clustergroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_cluster_groups OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_cluster_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_cluster_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_cluster_groups_id_seq OWNED BY public.extras_configcontext_cluster_groups.id;


--
-- Name: extras_configcontext_cluster_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_cluster_types (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    clustertype_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_cluster_types OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_cluster_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_cluster_types_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_cluster_types_id_seq OWNED BY public.extras_configcontext_cluster_types.id;


--
-- Name: extras_configcontext_clusters; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_clusters (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    cluster_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_clusters OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_clusters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_clusters_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_clusters_id_seq OWNED BY public.extras_configcontext_clusters.id;


--
-- Name: extras_configcontext_device_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_device_types (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    devicetype_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_device_types OWNER TO netbox;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_device_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_device_types_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_device_types_id_seq OWNED BY public.extras_configcontext_device_types.id;


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_id_seq OWNED BY public.extras_configcontext.id;


--
-- Name: extras_configcontext_platforms; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_platforms (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    platform_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_platforms OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_platforms_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_platforms_id_seq OWNED BY public.extras_configcontext_platforms.id;


--
-- Name: extras_configcontext_regions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_regions (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    region_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_regions OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_regions_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_regions_id_seq OWNED BY public.extras_configcontext_regions.id;


--
-- Name: extras_configcontext_roles; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_roles (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    devicerole_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_roles OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_roles_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_roles_id_seq OWNED BY public.extras_configcontext_roles.id;


--
-- Name: extras_configcontext_site_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_site_groups (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    sitegroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_site_groups OWNER TO netbox;

--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_site_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_site_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_site_groups_id_seq OWNED BY public.extras_configcontext_site_groups.id;


--
-- Name: extras_configcontext_sites; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_sites (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    site_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_sites OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_sites_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_sites_id_seq OWNED BY public.extras_configcontext_sites.id;


--
-- Name: extras_configcontext_tags; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tags (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tags OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tags_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tags_id_seq OWNED BY public.extras_configcontext_tags.id;


--
-- Name: extras_configcontext_tenant_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenant_groups (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    tenantgroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tenant_groups OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenant_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenant_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenant_groups_id_seq OWNED BY public.extras_configcontext_tenant_groups.id;


--
-- Name: extras_configcontext_tenants; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenants (
    id bigint NOT NULL,
    configcontext_id bigint NOT NULL,
    tenant_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tenants OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenants_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenants_id_seq OWNED BY public.extras_configcontext_tenants.id;


--
-- Name: extras_configrevision; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configrevision (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    comment character varying(200) NOT NULL,
    data jsonb
);


ALTER TABLE public.extras_configrevision OWNER TO netbox;

--
-- Name: extras_configrevision_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configrevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configrevision_id_seq OWNER TO netbox;

--
-- Name: extras_configrevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configrevision_id_seq OWNED BY public.extras_configrevision.id;


--
-- Name: extras_customfield; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield (
    id bigint NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    label character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    required boolean NOT NULL,
    filter_logic character varying(50) NOT NULL,
    "default" jsonb,
    weight smallint NOT NULL,
    validation_minimum integer,
    validation_maximum integer,
    validation_regex character varying(500) NOT NULL,
    choices character varying(100)[],
    created timestamp with time zone,
    last_updated timestamp with time zone,
    object_type_id integer,
    CONSTRAINT extras_customfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfield OWNER TO netbox;

--
-- Name: extras_customfield_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield_content_types (
    id bigint NOT NULL,
    customfield_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_customfield_content_types OWNER TO netbox;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_content_types_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_content_types_id_seq OWNED BY public.extras_customfield_content_types.id;


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_id_seq OWNED BY public.extras_customfield.id;


--
-- Name: extras_customlink; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customlink (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    link_text character varying(500) NOT NULL,
    link_url character varying(500) NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(50) NOT NULL,
    button_class character varying(30) NOT NULL,
    new_window boolean NOT NULL,
    content_type_id integer NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    enabled boolean NOT NULL,
    CONSTRAINT extras_customlink_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customlink OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customlink_id_seq OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customlink_id_seq OWNED BY public.extras_customlink.id;


--
-- Name: extras_exporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_exporttemplate (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    template_code text NOT NULL,
    mime_type character varying(50) NOT NULL,
    file_extension character varying(15) NOT NULL,
    as_attachment boolean NOT NULL,
    content_type_id integer NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.extras_exporttemplate OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_exporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_exporttemplate_id_seq OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_exporttemplate_id_seq OWNED BY public.extras_exporttemplate.id;


--
-- Name: extras_imageattachment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_imageattachment (
    id bigint NOT NULL,
    object_id bigint NOT NULL,
    image character varying(100) NOT NULL,
    image_height smallint NOT NULL,
    image_width smallint NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone,
    content_type_id integer NOT NULL,
    last_updated timestamp with time zone,
    CONSTRAINT extras_imageattachment_image_height_check CHECK ((image_height >= 0)),
    CONSTRAINT extras_imageattachment_image_width_check CHECK ((image_width >= 0)),
    CONSTRAINT extras_imageattachment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.extras_imageattachment OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_imageattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_imageattachment_id_seq OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_imageattachment_id_seq OWNED BY public.extras_imageattachment.id;


--
-- Name: extras_jobresult; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_jobresult (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    completed timestamp with time zone,
    status character varying(30) NOT NULL,
    data jsonb,
    job_id uuid NOT NULL,
    obj_type_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.extras_jobresult OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_jobresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_jobresult_id_seq OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_jobresult_id_seq OWNED BY public.extras_jobresult.id;


--
-- Name: extras_journalentry; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_journalentry (
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    assigned_object_id bigint NOT NULL,
    created timestamp with time zone,
    kind character varying(30) NOT NULL,
    comments text NOT NULL,
    assigned_object_type_id integer NOT NULL,
    created_by_id integer,
    custom_field_data jsonb NOT NULL,
    CONSTRAINT extras_journalentry_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.extras_journalentry OWNER TO netbox;

--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_journalentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_journalentry_id_seq OWNER TO netbox;

--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_journalentry_id_seq OWNED BY public.extras_journalentry.id;


--
-- Name: extras_objectchange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_objectchange (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    user_name character varying(150) NOT NULL,
    request_id uuid NOT NULL,
    action character varying(50) NOT NULL,
    changed_object_id bigint NOT NULL,
    related_object_id bigint,
    object_repr character varying(200) NOT NULL,
    prechange_data jsonb,
    postchange_data jsonb,
    changed_object_type_id integer NOT NULL,
    related_object_type_id integer,
    user_id integer,
    CONSTRAINT extras_objectchange_changed_object_id_check CHECK ((changed_object_id >= 0)),
    CONSTRAINT extras_objectchange_related_object_id_check CHECK ((related_object_id >= 0))
);


ALTER TABLE public.extras_objectchange OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_objectchange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_objectchange_id_seq OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_objectchange_id_seq OWNED BY public.extras_objectchange.id;


--
-- Name: extras_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_tag (
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_tag OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_tag_id_seq OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_tag_id_seq OWNED BY public.extras_tag.id;


--
-- Name: extras_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_taggeditem (
    object_id integer NOT NULL,
    id bigint NOT NULL,
    content_type_id integer NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.extras_taggeditem OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_taggeditem_id_seq OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_taggeditem_id_seq OWNED BY public.extras_taggeditem.id;


--
-- Name: extras_webhook; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    type_create boolean NOT NULL,
    type_update boolean NOT NULL,
    type_delete boolean NOT NULL,
    payload_url character varying(500) NOT NULL,
    enabled boolean NOT NULL,
    http_method character varying(30) NOT NULL,
    http_content_type character varying(100) NOT NULL,
    additional_headers text NOT NULL,
    body_template text NOT NULL,
    secret character varying(255) NOT NULL,
    ssl_verification boolean NOT NULL,
    ca_file_path character varying(4096),
    created timestamp with time zone,
    last_updated timestamp with time zone,
    conditions jsonb
);


ALTER TABLE public.extras_webhook OWNER TO netbox;

--
-- Name: extras_webhook_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook_content_types (
    id bigint NOT NULL,
    webhook_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_webhook_content_types OWNER TO netbox;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_content_types_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_content_types_id_seq OWNED BY public.extras_webhook_content_types.id;


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_id_seq OWNED BY public.extras_webhook.id;


--
-- Name: ipam_aggregate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_aggregate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    prefix cidr NOT NULL,
    date_added date,
    description character varying(200) NOT NULL,
    rir_id bigint NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_aggregate OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_aggregate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_aggregate_id_seq OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_aggregate_id_seq OWNED BY public.ipam_aggregate.id;


--
-- Name: ipam_asn; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_asn (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    asn bigint NOT NULL,
    description character varying(200) NOT NULL,
    rir_id bigint NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_asn OWNER TO netbox;

--
-- Name: ipam_asn_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_asn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_asn_id_seq OWNER TO netbox;

--
-- Name: ipam_asn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_asn_id_seq OWNED BY public.ipam_asn.id;


--
-- Name: ipam_fhrpgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_fhrpgroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    group_id smallint NOT NULL,
    protocol character varying(50) NOT NULL,
    auth_type character varying(50) NOT NULL,
    auth_key character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT ipam_fhrpgroup_group_id_check CHECK ((group_id >= 0))
);


ALTER TABLE public.ipam_fhrpgroup OWNER TO netbox;

--
-- Name: ipam_fhrpgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_fhrpgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_fhrpgroup_id_seq OWNER TO netbox;

--
-- Name: ipam_fhrpgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_fhrpgroup_id_seq OWNED BY public.ipam_fhrpgroup.id;


--
-- Name: ipam_fhrpgroupassignment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_fhrpgroupassignment (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    interface_id bigint NOT NULL,
    priority smallint NOT NULL,
    group_id bigint NOT NULL,
    interface_type_id integer NOT NULL,
    CONSTRAINT ipam_fhrpgroupassignment_interface_id_check CHECK ((interface_id >= 0)),
    CONSTRAINT ipam_fhrpgroupassignment_priority_check CHECK ((priority >= 0))
);


ALTER TABLE public.ipam_fhrpgroupassignment OWNER TO netbox;

--
-- Name: ipam_fhrpgroupassignment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_fhrpgroupassignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_fhrpgroupassignment_id_seq OWNER TO netbox;

--
-- Name: ipam_fhrpgroupassignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_fhrpgroupassignment_id_seq OWNED BY public.ipam_fhrpgroupassignment.id;


--
-- Name: ipam_ipaddress; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_ipaddress (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    address inet NOT NULL,
    status character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    assigned_object_id bigint,
    dns_name character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    assigned_object_type_id integer,
    nat_inside_id bigint,
    tenant_id bigint,
    vrf_id bigint,
    CONSTRAINT ipam_ipaddress_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.ipam_ipaddress OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_ipaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_ipaddress_id_seq OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_ipaddress_id_seq OWNED BY public.ipam_ipaddress.id;


--
-- Name: ipam_iprange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_iprange (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    start_address inet NOT NULL,
    end_address inet NOT NULL,
    size integer NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    role_id bigint,
    tenant_id bigint,
    vrf_id bigint,
    CONSTRAINT ipam_iprange_size_check CHECK ((size >= 0))
);


ALTER TABLE public.ipam_iprange OWNER TO netbox;

--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_iprange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_iprange_id_seq OWNER TO netbox;

--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_iprange_id_seq OWNED BY public.ipam_iprange.id;


--
-- Name: ipam_prefix; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_prefix (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    prefix cidr NOT NULL,
    status character varying(50) NOT NULL,
    is_pool boolean NOT NULL,
    description character varying(200) NOT NULL,
    role_id bigint,
    site_id bigint,
    tenant_id bigint,
    vlan_id bigint,
    vrf_id bigint,
    _children bigint NOT NULL,
    _depth smallint NOT NULL,
    mark_utilized boolean NOT NULL,
    CONSTRAINT ipam_prefix__children_check CHECK ((_children >= 0)),
    CONSTRAINT ipam_prefix__depth_check CHECK ((_depth >= 0))
);


ALTER TABLE public.ipam_prefix OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_prefix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_prefix_id_seq OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_prefix_id_seq OWNED BY public.ipam_prefix.id;


--
-- Name: ipam_rir; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_rir (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    is_private boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.ipam_rir OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_rir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_rir_id_seq OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_rir_id_seq OWNED BY public.ipam_rir.id;


--
-- Name: ipam_role; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_role (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT ipam_role_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.ipam_role OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_role_id_seq OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_role_id_seq OWNED BY public.ipam_role.id;


--
-- Name: ipam_routetarget; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_routetarget (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(21) NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_routetarget OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_routetarget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_routetarget_id_seq OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_routetarget_id_seq OWNED BY public.ipam_routetarget.id;


--
-- Name: ipam_service; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    protocol character varying(50) NOT NULL,
    ports integer[] NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint,
    virtual_machine_id bigint
);


ALTER TABLE public.ipam_service OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_id_seq OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_id_seq OWNED BY public.ipam_service.id;


--
-- Name: ipam_service_ipaddresses; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service_ipaddresses (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    ipaddress_id bigint NOT NULL
);


ALTER TABLE public.ipam_service_ipaddresses OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_ipaddresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_ipaddresses_id_seq OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_ipaddresses_id_seq OWNED BY public.ipam_service_ipaddresses.id;


--
-- Name: ipam_servicetemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_servicetemplate (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    protocol character varying(50) NOT NULL,
    ports integer[] NOT NULL,
    description character varying(200) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ipam_servicetemplate OWNER TO netbox;

--
-- Name: ipam_servicetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_servicetemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_servicetemplate_id_seq OWNER TO netbox;

--
-- Name: ipam_servicetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_servicetemplate_id_seq OWNED BY public.ipam_servicetemplate.id;


--
-- Name: ipam_vlan; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlan (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    vid smallint NOT NULL,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    group_id bigint,
    role_id bigint,
    site_id bigint,
    tenant_id bigint,
    CONSTRAINT ipam_vlan_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.ipam_vlan OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlan_id_seq OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlan_id_seq OWNED BY public.ipam_vlan.id;


--
-- Name: ipam_vlangroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlangroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    scope_id bigint,
    description character varying(200) NOT NULL,
    scope_type_id integer,
    max_vid smallint NOT NULL,
    min_vid smallint NOT NULL,
    CONSTRAINT ipam_vlangroup_max_vid_check CHECK ((max_vid >= 0)),
    CONSTRAINT ipam_vlangroup_min_vid_check CHECK ((min_vid >= 0)),
    CONSTRAINT ipam_vlangroup_scope_id_check CHECK ((scope_id >= 0))
);


ALTER TABLE public.ipam_vlangroup OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlangroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlangroup_id_seq OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlangroup_id_seq OWNED BY public.ipam_vlangroup.id;


--
-- Name: ipam_vrf; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rd character varying(21),
    enforce_unique boolean NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_vrf OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_export_targets (
    id bigint NOT NULL,
    vrf_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_vrf_export_targets OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_export_targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_export_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_export_targets_id_seq OWNED BY public.ipam_vrf_export_targets.id;


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_id_seq OWNED BY public.ipam_vrf.id;


--
-- Name: ipam_vrf_import_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_import_targets (
    id bigint NOT NULL,
    vrf_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_vrf_import_targets OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_import_targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_import_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_import_targets_id_seq OWNED BY public.ipam_vrf_import_targets.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO netbox;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO netbox;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO netbox;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO netbox;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO netbox;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO netbox;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data jsonb NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO netbox;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO netbox;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data jsonb NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO netbox;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO netbox;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: tenancy_contact; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contact (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    phone character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    address character varying(200) NOT NULL,
    comments text NOT NULL,
    group_id bigint,
    link character varying(200) NOT NULL
);


ALTER TABLE public.tenancy_contact OWNER TO netbox;

--
-- Name: tenancy_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contact_id_seq OWNER TO netbox;

--
-- Name: tenancy_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contact_id_seq OWNED BY public.tenancy_contact.id;


--
-- Name: tenancy_contactassignment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contactassignment (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    object_id bigint NOT NULL,
    priority character varying(50) NOT NULL,
    contact_id bigint NOT NULL,
    content_type_id integer NOT NULL,
    role_id bigint NOT NULL,
    CONSTRAINT tenancy_contactassignment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.tenancy_contactassignment OWNER TO netbox;

--
-- Name: tenancy_contactassignment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contactassignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contactassignment_id_seq OWNER TO netbox;

--
-- Name: tenancy_contactassignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contactassignment_id_seq OWNED BY public.tenancy_contactassignment.id;


--
-- Name: tenancy_contactgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contactgroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT tenancy_contactgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT tenancy_contactgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT tenancy_contactgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT tenancy_contactgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.tenancy_contactgroup OWNER TO netbox;

--
-- Name: tenancy_contactgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contactgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contactgroup_id_seq OWNER TO netbox;

--
-- Name: tenancy_contactgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contactgroup_id_seq OWNED BY public.tenancy_contactgroup.id;


--
-- Name: tenancy_contactrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_contactrole (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.tenancy_contactrole OWNER TO netbox;

--
-- Name: tenancy_contactrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_contactrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_contactrole_id_seq OWNER TO netbox;

--
-- Name: tenancy_contactrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_contactrole_id_seq OWNED BY public.tenancy_contactrole.id;


--
-- Name: tenancy_tenant; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenant (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    group_id bigint
);


ALTER TABLE public.tenancy_tenant OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenant_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenant_id_seq OWNED BY public.tenancy_tenant.id;


--
-- Name: tenancy_tenantgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenantgroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT tenancy_tenantgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT tenancy_tenantgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT tenancy_tenantgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT tenancy_tenantgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.tenancy_tenantgroup OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenantgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenantgroup_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenantgroup_id_seq OWNED BY public.tenancy_tenantgroup.id;


--
-- Name: users_objectpermission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    enabled boolean NOT NULL,
    actions character varying(30)[] NOT NULL,
    constraints jsonb
);


ALTER TABLE public.users_objectpermission OWNER TO netbox;

--
-- Name: users_objectpermission_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_groups (
    id bigint NOT NULL,
    objectpermission_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_groups OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_groups_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_groups_id_seq OWNED BY public.users_objectpermission_groups.id;


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_id_seq OWNED BY public.users_objectpermission.id;


--
-- Name: users_objectpermission_object_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_object_types (
    id bigint NOT NULL,
    objectpermission_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_object_types OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_object_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_object_types_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_object_types_id_seq OWNED BY public.users_objectpermission_object_types.id;


--
-- Name: users_objectpermission_users; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_users (
    id bigint NOT NULL,
    objectpermission_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_users OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_users_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_users_id_seq OWNED BY public.users_objectpermission_users.id;


--
-- Name: users_token; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_token (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    expires timestamp with time zone,
    key character varying(40) NOT NULL,
    write_enabled boolean NOT NULL,
    description character varying(200) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_token OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_token_id_seq OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_token_id_seq OWNED BY public.users_token.id;


--
-- Name: users_userconfig; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_userconfig (
    id bigint NOT NULL,
    data jsonb NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_userconfig OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_userconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userconfig_id_seq OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_userconfig_id_seq OWNED BY public.users_userconfig.id;


--
-- Name: virtualization_cluster; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_cluster (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id bigint,
    site_id bigint,
    tenant_id bigint,
    type_id bigint NOT NULL
);


ALTER TABLE public.virtualization_cluster OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_cluster_id_seq OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_cluster_id_seq OWNED BY public.virtualization_cluster.id;


--
-- Name: virtualization_clustergroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustergroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustergroup OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustergroup_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustergroup_id_seq OWNED BY public.virtualization_clustergroup.id;


--
-- Name: virtualization_clustertype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustertype (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustertype OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustertype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustertype_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustertype_id_seq OWNED BY public.virtualization_clustertype.id;


--
-- Name: virtualization_virtualmachine; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_virtualmachine (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    vcpus numeric(6,2),
    memory integer,
    disk integer,
    comments text NOT NULL,
    cluster_id bigint NOT NULL,
    platform_id bigint,
    primary_ip4_id bigint,
    primary_ip6_id bigint,
    role_id bigint,
    tenant_id bigint,
    _name character varying(100) NOT NULL,
    CONSTRAINT virtualization_virtualmachine_disk_check CHECK ((disk >= 0)),
    CONSTRAINT virtualization_virtualmachine_memory_check CHECK ((memory >= 0))
);


ALTER TABLE public.virtualization_virtualmachine OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_virtualmachine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_virtualmachine_id_seq OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_virtualmachine_id_seq OWNED BY public.virtualization_virtualmachine.id;


--
-- Name: virtualization_vminterface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    mac_address macaddr,
    mtu integer,
    mode character varying(50) NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    parent_id bigint,
    untagged_vlan_id bigint,
    virtual_machine_id bigint NOT NULL,
    bridge_id bigint,
    vrf_id bigint,
    CONSTRAINT virtualization_vminterface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.virtualization_vminterface OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_id_seq OWNED BY public.virtualization_vminterface.id;


--
-- Name: virtualization_vminterface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface_tagged_vlans (
    id bigint NOT NULL,
    vminterface_id bigint NOT NULL,
    vlan_id bigint NOT NULL
);


ALTER TABLE public.virtualization_vminterface_tagged_vlans OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq OWNED BY public.virtualization_vminterface_tagged_vlans.id;


--
-- Name: wireless_wirelesslan; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.wireless_wirelesslan (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    ssid character varying(32) NOT NULL,
    group_id bigint,
    description character varying(200) NOT NULL,
    auth_cipher character varying(50) NOT NULL,
    auth_psk character varying(64) NOT NULL,
    auth_type character varying(50) NOT NULL,
    vlan_id bigint
);


ALTER TABLE public.wireless_wirelesslan OWNER TO netbox;

--
-- Name: wireless_wirelesslan_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.wireless_wirelesslan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_wirelesslan_id_seq OWNER TO netbox;

--
-- Name: wireless_wirelesslan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.wireless_wirelesslan_id_seq OWNED BY public.wireless_wirelesslan.id;


--
-- Name: wireless_wirelesslangroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.wireless_wirelesslangroup (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT wireless_wirelesslangroup_level_check CHECK ((level >= 0)),
    CONSTRAINT wireless_wirelesslangroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT wireless_wirelesslangroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT wireless_wirelesslangroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.wireless_wirelesslangroup OWNER TO netbox;

--
-- Name: wireless_wirelesslangroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.wireless_wirelesslangroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_wirelesslangroup_id_seq OWNER TO netbox;

--
-- Name: wireless_wirelesslangroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.wireless_wirelesslangroup_id_seq OWNED BY public.wireless_wirelesslangroup.id;


--
-- Name: wireless_wirelesslink; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.wireless_wirelesslink (
    created timestamp with time zone,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    ssid character varying(32) NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    auth_cipher character varying(50) NOT NULL,
    auth_psk character varying(64) NOT NULL,
    auth_type character varying(50) NOT NULL,
    _interface_a_device_id bigint,
    _interface_b_device_id bigint,
    interface_a_id bigint NOT NULL,
    interface_b_id bigint NOT NULL
);


ALTER TABLE public.wireless_wirelesslink OWNER TO netbox;

--
-- Name: wireless_wirelesslink_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.wireless_wirelesslink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_wirelesslink_id_seq OWNER TO netbox;

--
-- Name: wireless_wirelesslink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.wireless_wirelesslink_id_seq OWNED BY public.wireless_wirelesslink.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: circuits_circuit id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuit_id_seq'::regclass);


--
-- Name: circuits_circuittermination id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittermination_id_seq'::regclass);


--
-- Name: circuits_circuittype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittype_id_seq'::regclass);


--
-- Name: circuits_provider id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider ALTER COLUMN id SET DEFAULT nextval('public.circuits_provider_id_seq'::regclass);


--
-- Name: circuits_provider_asns id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns ALTER COLUMN id SET DEFAULT nextval('public.circuits_provider_asns_id_seq'::regclass);


--
-- Name: circuits_providernetwork id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork ALTER COLUMN id SET DEFAULT nextval('public.circuits_providernetwork_id_seq'::regclass);


--
-- Name: dcim_cable id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable ALTER COLUMN id SET DEFAULT nextval('public.dcim_cable_id_seq'::regclass);


--
-- Name: dcim_cablepath id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath ALTER COLUMN id SET DEFAULT nextval('public.dcim_cablepath_id_seq'::regclass);


--
-- Name: dcim_consoleport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleport_id_seq'::regclass);


--
-- Name: dcim_consoleporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleporttemplate_id_seq'::regclass);


--
-- Name: dcim_consoleserverport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverport_id_seq'::regclass);


--
-- Name: dcim_consoleserverporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverporttemplate_id_seq'::regclass);


--
-- Name: dcim_device id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device ALTER COLUMN id SET DEFAULT nextval('public.dcim_device_id_seq'::regclass);


--
-- Name: dcim_devicebay id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebay_id_seq'::regclass);


--
-- Name: dcim_devicebaytemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebaytemplate_id_seq'::regclass);


--
-- Name: dcim_devicerole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicerole_id_seq'::regclass);


--
-- Name: dcim_devicetype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicetype_id_seq'::regclass);


--
-- Name: dcim_frontport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontport_id_seq'::regclass);


--
-- Name: dcim_frontporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontporttemplate_id_seq'::regclass);


--
-- Name: dcim_interface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_id_seq'::regclass);


--
-- Name: dcim_interface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_tagged_vlans_id_seq'::regclass);


--
-- Name: dcim_interface_wireless_lans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_wireless_lans_id_seq'::regclass);


--
-- Name: dcim_interfacetemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_interfacetemplate_id_seq'::regclass);


--
-- Name: dcim_inventoryitem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitem_id_seq'::regclass);


--
-- Name: dcim_inventoryitemrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitemrole_id_seq'::regclass);


--
-- Name: dcim_inventoryitemtemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitemtemplate_id_seq'::regclass);


--
-- Name: dcim_location id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location ALTER COLUMN id SET DEFAULT nextval('public.dcim_location_id_seq'::regclass);


--
-- Name: dcim_manufacturer id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.dcim_manufacturer_id_seq'::regclass);


--
-- Name: dcim_module id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module ALTER COLUMN id SET DEFAULT nextval('public.dcim_module_id_seq'::regclass);


--
-- Name: dcim_modulebay id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay ALTER COLUMN id SET DEFAULT nextval('public.dcim_modulebay_id_seq'::regclass);


--
-- Name: dcim_modulebaytemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_modulebaytemplate_id_seq'::regclass);


--
-- Name: dcim_moduletype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype ALTER COLUMN id SET DEFAULT nextval('public.dcim_moduletype_id_seq'::regclass);


--
-- Name: dcim_platform id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform ALTER COLUMN id SET DEFAULT nextval('public.dcim_platform_id_seq'::regclass);


--
-- Name: dcim_powerfeed id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerfeed_id_seq'::regclass);


--
-- Name: dcim_poweroutlet id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlet_id_seq'::regclass);


--
-- Name: dcim_poweroutlettemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlettemplate_id_seq'::regclass);


--
-- Name: dcim_powerpanel id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerpanel_id_seq'::regclass);


--
-- Name: dcim_powerport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerport_id_seq'::regclass);


--
-- Name: dcim_powerporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerporttemplate_id_seq'::regclass);


--
-- Name: dcim_rack id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack ALTER COLUMN id SET DEFAULT nextval('public.dcim_rack_id_seq'::regclass);


--
-- Name: dcim_rackreservation id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackreservation_id_seq'::regclass);


--
-- Name: dcim_rackrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackrole_id_seq'::regclass);


--
-- Name: dcim_rearport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearport_id_seq'::regclass);


--
-- Name: dcim_rearporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearporttemplate_id_seq'::regclass);


--
-- Name: dcim_region id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region ALTER COLUMN id SET DEFAULT nextval('public.dcim_region_id_seq'::regclass);


--
-- Name: dcim_site id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site ALTER COLUMN id SET DEFAULT nextval('public.dcim_site_id_seq'::regclass);


--
-- Name: dcim_site_asns id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns ALTER COLUMN id SET DEFAULT nextval('public.dcim_site_asns_id_seq'::regclass);


--
-- Name: dcim_sitegroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup ALTER COLUMN id SET DEFAULT nextval('public.dcim_sitegroup_id_seq'::regclass);


--
-- Name: dcim_virtualchassis id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis ALTER COLUMN id SET DEFAULT nextval('public.dcim_virtualchassis_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: extras_configcontext id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_id_seq'::regclass);


--
-- Name: extras_configcontext_cluster_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_cluster_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_cluster_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_cluster_types_id_seq'::regclass);


--
-- Name: extras_configcontext_clusters id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_clusters_id_seq'::regclass);


--
-- Name: extras_configcontext_device_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_device_types_id_seq'::regclass);


--
-- Name: extras_configcontext_platforms id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_platforms_id_seq'::regclass);


--
-- Name: extras_configcontext_regions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_regions_id_seq'::regclass);


--
-- Name: extras_configcontext_roles id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_roles_id_seq'::regclass);


--
-- Name: extras_configcontext_site_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_site_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_sites id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_sites_id_seq'::regclass);


--
-- Name: extras_configcontext_tags id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tags_id_seq'::regclass);


--
-- Name: extras_configcontext_tenant_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenant_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_tenants id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenants_id_seq'::regclass);


--
-- Name: extras_configrevision id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configrevision ALTER COLUMN id SET DEFAULT nextval('public.extras_configrevision_id_seq'::regclass);


--
-- Name: extras_customfield id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_id_seq'::regclass);


--
-- Name: extras_customfield_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_content_types_id_seq'::regclass);


--
-- Name: extras_customlink id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink ALTER COLUMN id SET DEFAULT nextval('public.extras_customlink_id_seq'::regclass);


--
-- Name: extras_exporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate ALTER COLUMN id SET DEFAULT nextval('public.extras_exporttemplate_id_seq'::regclass);


--
-- Name: extras_imageattachment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment ALTER COLUMN id SET DEFAULT nextval('public.extras_imageattachment_id_seq'::regclass);


--
-- Name: extras_jobresult id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult ALTER COLUMN id SET DEFAULT nextval('public.extras_jobresult_id_seq'::regclass);


--
-- Name: extras_journalentry id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry ALTER COLUMN id SET DEFAULT nextval('public.extras_journalentry_id_seq'::regclass);


--
-- Name: extras_objectchange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange ALTER COLUMN id SET DEFAULT nextval('public.extras_objectchange_id_seq'::regclass);


--
-- Name: extras_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag ALTER COLUMN id SET DEFAULT nextval('public.extras_tag_id_seq'::regclass);


--
-- Name: extras_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.extras_taggeditem_id_seq'::regclass);


--
-- Name: extras_webhook id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_id_seq'::regclass);


--
-- Name: extras_webhook_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_content_types_id_seq'::regclass);


--
-- Name: ipam_aggregate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate ALTER COLUMN id SET DEFAULT nextval('public.ipam_aggregate_id_seq'::regclass);


--
-- Name: ipam_asn id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn ALTER COLUMN id SET DEFAULT nextval('public.ipam_asn_id_seq'::regclass);


--
-- Name: ipam_fhrpgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroup ALTER COLUMN id SET DEFAULT nextval('public.ipam_fhrpgroup_id_seq'::regclass);


--
-- Name: ipam_fhrpgroupassignment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment ALTER COLUMN id SET DEFAULT nextval('public.ipam_fhrpgroupassignment_id_seq'::regclass);


--
-- Name: ipam_ipaddress id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress ALTER COLUMN id SET DEFAULT nextval('public.ipam_ipaddress_id_seq'::regclass);


--
-- Name: ipam_iprange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange ALTER COLUMN id SET DEFAULT nextval('public.ipam_iprange_id_seq'::regclass);


--
-- Name: ipam_prefix id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix ALTER COLUMN id SET DEFAULT nextval('public.ipam_prefix_id_seq'::regclass);


--
-- Name: ipam_rir id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir ALTER COLUMN id SET DEFAULT nextval('public.ipam_rir_id_seq'::regclass);


--
-- Name: ipam_role id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role ALTER COLUMN id SET DEFAULT nextval('public.ipam_role_id_seq'::regclass);


--
-- Name: ipam_routetarget id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget ALTER COLUMN id SET DEFAULT nextval('public.ipam_routetarget_id_seq'::regclass);


--
-- Name: ipam_service id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_id_seq'::regclass);


--
-- Name: ipam_service_ipaddresses id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_ipaddresses_id_seq'::regclass);


--
-- Name: ipam_servicetemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_servicetemplate ALTER COLUMN id SET DEFAULT nextval('public.ipam_servicetemplate_id_seq'::regclass);


--
-- Name: ipam_vlan id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlan_id_seq'::regclass);


--
-- Name: ipam_vlangroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlangroup_id_seq'::regclass);


--
-- Name: ipam_vrf id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_id_seq'::regclass);


--
-- Name: ipam_vrf_export_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_export_targets_id_seq'::regclass);


--
-- Name: ipam_vrf_import_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_import_targets_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: tenancy_contact id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contact_id_seq'::regclass);


--
-- Name: tenancy_contactassignment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contactassignment_id_seq'::regclass);


--
-- Name: tenancy_contactgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contactgroup_id_seq'::regclass);


--
-- Name: tenancy_contactrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole ALTER COLUMN id SET DEFAULT nextval('public.tenancy_contactrole_id_seq'::regclass);


--
-- Name: tenancy_tenant id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenant_id_seq'::regclass);


--
-- Name: tenancy_tenantgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenantgroup_id_seq'::regclass);


--
-- Name: users_objectpermission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_id_seq'::regclass);


--
-- Name: users_objectpermission_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_groups_id_seq'::regclass);


--
-- Name: users_objectpermission_object_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_object_types_id_seq'::regclass);


--
-- Name: users_objectpermission_users id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_users_id_seq'::regclass);


--
-- Name: users_token id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token ALTER COLUMN id SET DEFAULT nextval('public.users_token_id_seq'::regclass);


--
-- Name: users_userconfig id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig ALTER COLUMN id SET DEFAULT nextval('public.users_userconfig_id_seq'::regclass);


--
-- Name: virtualization_cluster id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster ALTER COLUMN id SET DEFAULT nextval('public.virtualization_cluster_id_seq'::regclass);


--
-- Name: virtualization_clustergroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustergroup_id_seq'::regclass);


--
-- Name: virtualization_clustertype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustertype_id_seq'::regclass);


--
-- Name: virtualization_virtualmachine id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine ALTER COLUMN id SET DEFAULT nextval('public.virtualization_virtualmachine_id_seq'::regclass);


--
-- Name: virtualization_vminterface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_id_seq'::regclass);


--
-- Name: virtualization_vminterface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_tagged_vlans_id_seq'::regclass);


--
-- Name: wireless_wirelesslan id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan ALTER COLUMN id SET DEFAULT nextval('public.wireless_wirelesslan_id_seq'::regclass);


--
-- Name: wireless_wirelesslangroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup ALTER COLUMN id SET DEFAULT nextval('public.wireless_wirelesslangroup_id_seq'::regclass);


--
-- Name: wireless_wirelesslink id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink ALTER COLUMN id SET DEFAULT nextval('public.wireless_wirelesslink_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add association	7	add_association
26	Can change association	7	change_association
27	Can delete association	7	delete_association
28	Can view association	7	view_association
29	Can add code	8	add_code
30	Can change code	8	change_code
31	Can delete code	8	delete_code
32	Can view code	8	view_code
33	Can add nonce	9	add_nonce
34	Can change nonce	9	change_nonce
35	Can delete nonce	9	delete_nonce
36	Can view nonce	9	view_nonce
37	Can add user social auth	10	add_usersocialauth
38	Can change user social auth	10	change_usersocialauth
39	Can delete user social auth	10	delete_usersocialauth
40	Can view user social auth	10	view_usersocialauth
41	Can add partial	11	add_partial
42	Can change partial	11	change_partial
43	Can delete partial	11	delete_partial
44	Can view partial	11	view_partial
45	Can add tag	12	add_tag
46	Can change tag	12	change_tag
47	Can delete tag	12	delete_tag
48	Can view tag	12	view_tag
49	Can add tagged item	13	add_taggeditem
50	Can change tagged item	13	change_taggeditem
51	Can delete tagged item	13	delete_taggeditem
52	Can view tagged item	13	view_taggeditem
53	Can add circuit	14	add_circuit
54	Can change circuit	14	change_circuit
55	Can delete circuit	14	delete_circuit
56	Can view circuit	14	view_circuit
57	Can add circuit termination	15	add_circuittermination
58	Can change circuit termination	15	change_circuittermination
59	Can delete circuit termination	15	delete_circuittermination
60	Can view circuit termination	15	view_circuittermination
61	Can add circuit type	16	add_circuittype
62	Can change circuit type	16	change_circuittype
63	Can delete circuit type	16	delete_circuittype
64	Can view circuit type	16	view_circuittype
65	Can add provider	17	add_provider
66	Can change provider	17	change_provider
67	Can delete provider	17	delete_provider
68	Can view provider	17	view_provider
69	Can add provider network	18	add_providernetwork
70	Can change provider network	18	change_providernetwork
71	Can delete provider network	18	delete_providernetwork
72	Can view provider network	18	view_providernetwork
73	Can add cable	19	add_cable
74	Can change cable	19	change_cable
75	Can delete cable	19	delete_cable
76	Can view cable	19	view_cable
77	Can add cable path	20	add_cablepath
78	Can change cable path	20	change_cablepath
79	Can delete cable path	20	delete_cablepath
80	Can view cable path	20	view_cablepath
81	Can add console port	21	add_consoleport
82	Can change console port	21	change_consoleport
83	Can delete console port	21	delete_consoleport
84	Can view console port	21	view_consoleport
85	Can add console port template	22	add_consoleporttemplate
86	Can change console port template	22	change_consoleporttemplate
87	Can delete console port template	22	delete_consoleporttemplate
88	Can view console port template	22	view_consoleporttemplate
89	Can add console server port	23	add_consoleserverport
90	Can change console server port	23	change_consoleserverport
91	Can delete console server port	23	delete_consoleserverport
92	Can view console server port	23	view_consoleserverport
93	Can add console server port template	24	add_consoleserverporttemplate
94	Can change console server port template	24	change_consoleserverporttemplate
95	Can delete console server port template	24	delete_consoleserverporttemplate
96	Can view console server port template	24	view_consoleserverporttemplate
97	Can add device	25	add_device
98	Can change device	25	change_device
99	Can delete device	25	delete_device
100	Can view device	25	view_device
101	Can add device bay	26	add_devicebay
102	Can change device bay	26	change_devicebay
103	Can delete device bay	26	delete_devicebay
104	Can view device bay	26	view_devicebay
105	Can add device bay template	27	add_devicebaytemplate
106	Can change device bay template	27	change_devicebaytemplate
107	Can delete device bay template	27	delete_devicebaytemplate
108	Can view device bay template	27	view_devicebaytemplate
109	Can add device role	28	add_devicerole
110	Can change device role	28	change_devicerole
111	Can delete device role	28	delete_devicerole
112	Can view device role	28	view_devicerole
113	Can add device type	29	add_devicetype
114	Can change device type	29	change_devicetype
115	Can delete device type	29	delete_devicetype
116	Can view device type	29	view_devicetype
117	Can add front port	30	add_frontport
118	Can change front port	30	change_frontport
119	Can delete front port	30	delete_frontport
120	Can view front port	30	view_frontport
121	Can add front port template	31	add_frontporttemplate
122	Can change front port template	31	change_frontporttemplate
123	Can delete front port template	31	delete_frontporttemplate
124	Can view front port template	31	view_frontporttemplate
125	Can add interface	32	add_interface
126	Can change interface	32	change_interface
127	Can delete interface	32	delete_interface
128	Can view interface	32	view_interface
129	Can add interface template	33	add_interfacetemplate
130	Can change interface template	33	change_interfacetemplate
131	Can delete interface template	33	delete_interfacetemplate
132	Can view interface template	33	view_interfacetemplate
133	Can add inventory item	34	add_inventoryitem
134	Can change inventory item	34	change_inventoryitem
135	Can delete inventory item	34	delete_inventoryitem
136	Can view inventory item	34	view_inventoryitem
137	Can add location	35	add_location
138	Can change location	35	change_location
139	Can delete location	35	delete_location
140	Can view location	35	view_location
141	Can add manufacturer	36	add_manufacturer
142	Can change manufacturer	36	change_manufacturer
143	Can delete manufacturer	36	delete_manufacturer
144	Can view manufacturer	36	view_manufacturer
145	Can add platform	37	add_platform
146	Can change platform	37	change_platform
147	Can delete platform	37	delete_platform
148	Can view platform	37	view_platform
149	Can add power feed	38	add_powerfeed
150	Can change power feed	38	change_powerfeed
151	Can delete power feed	38	delete_powerfeed
152	Can view power feed	38	view_powerfeed
153	Can add power outlet	39	add_poweroutlet
154	Can change power outlet	39	change_poweroutlet
155	Can delete power outlet	39	delete_poweroutlet
156	Can view power outlet	39	view_poweroutlet
157	Can add power outlet template	40	add_poweroutlettemplate
158	Can change power outlet template	40	change_poweroutlettemplate
159	Can delete power outlet template	40	delete_poweroutlettemplate
160	Can view power outlet template	40	view_poweroutlettemplate
161	Can add power panel	41	add_powerpanel
162	Can change power panel	41	change_powerpanel
163	Can delete power panel	41	delete_powerpanel
164	Can view power panel	41	view_powerpanel
165	Can add power port	42	add_powerport
166	Can change power port	42	change_powerport
167	Can delete power port	42	delete_powerport
168	Can view power port	42	view_powerport
169	Can add power port template	43	add_powerporttemplate
170	Can change power port template	43	change_powerporttemplate
171	Can delete power port template	43	delete_powerporttemplate
172	Can view power port template	43	view_powerporttemplate
173	Can add rack	44	add_rack
174	Can change rack	44	change_rack
175	Can delete rack	44	delete_rack
176	Can view rack	44	view_rack
177	Can add rack reservation	45	add_rackreservation
178	Can change rack reservation	45	change_rackreservation
179	Can delete rack reservation	45	delete_rackreservation
180	Can view rack reservation	45	view_rackreservation
181	Can add rack role	46	add_rackrole
182	Can change rack role	46	change_rackrole
183	Can delete rack role	46	delete_rackrole
184	Can view rack role	46	view_rackrole
185	Can add rear port	47	add_rearport
186	Can change rear port	47	change_rearport
187	Can delete rear port	47	delete_rearport
188	Can view rear port	47	view_rearport
189	Can add rear port template	48	add_rearporttemplate
190	Can change rear port template	48	change_rearporttemplate
191	Can delete rear port template	48	delete_rearporttemplate
192	Can view rear port template	48	view_rearporttemplate
193	Can add region	49	add_region
194	Can change region	49	change_region
195	Can delete region	49	delete_region
196	Can view region	49	view_region
197	Can add site	50	add_site
198	Can change site	50	change_site
199	Can delete site	50	delete_site
200	Can view site	50	view_site
201	Can add site group	51	add_sitegroup
202	Can change site group	51	change_sitegroup
203	Can delete site group	51	delete_sitegroup
204	Can view site group	51	view_sitegroup
205	Can add virtual chassis	52	add_virtualchassis
206	Can change virtual chassis	52	change_virtualchassis
207	Can delete virtual chassis	52	delete_virtualchassis
208	Can view virtual chassis	52	view_virtualchassis
209	Can add module type	53	add_moduletype
210	Can change module type	53	change_moduletype
211	Can delete module type	53	delete_moduletype
212	Can view module type	53	view_moduletype
213	Can add module bay	54	add_modulebay
214	Can change module bay	54	change_modulebay
215	Can delete module bay	54	delete_modulebay
216	Can view module bay	54	view_modulebay
217	Can add module	55	add_module
218	Can change module	55	change_module
219	Can delete module	55	delete_module
220	Can view module	55	view_module
221	Can add module bay template	56	add_modulebaytemplate
222	Can change module bay template	56	change_modulebaytemplate
223	Can delete module bay template	56	delete_modulebaytemplate
224	Can view module bay template	56	view_modulebaytemplate
225	Can add inventory item role	57	add_inventoryitemrole
226	Can change inventory item role	57	change_inventoryitemrole
227	Can delete inventory item role	57	delete_inventoryitemrole
228	Can view inventory item role	57	view_inventoryitemrole
229	Can add inventory item template	58	add_inventoryitemtemplate
230	Can change inventory item template	58	change_inventoryitemtemplate
231	Can delete inventory item template	58	delete_inventoryitemtemplate
232	Can view inventory item template	58	view_inventoryitemtemplate
233	Can add aggregate	59	add_aggregate
234	Can change aggregate	59	change_aggregate
235	Can delete aggregate	59	delete_aggregate
236	Can view aggregate	59	view_aggregate
237	Can add IP address	60	add_ipaddress
238	Can change IP address	60	change_ipaddress
239	Can delete IP address	60	delete_ipaddress
240	Can view IP address	60	view_ipaddress
241	Can add prefix	61	add_prefix
242	Can change prefix	61	change_prefix
243	Can delete prefix	61	delete_prefix
244	Can view prefix	61	view_prefix
245	Can add RIR	62	add_rir
246	Can change RIR	62	change_rir
247	Can delete RIR	62	delete_rir
248	Can view RIR	62	view_rir
249	Can add role	63	add_role
250	Can change role	63	change_role
251	Can delete role	63	delete_role
252	Can view role	63	view_role
253	Can add route target	64	add_routetarget
254	Can change route target	64	change_routetarget
255	Can delete route target	64	delete_routetarget
256	Can view route target	64	view_routetarget
257	Can add VRF	65	add_vrf
258	Can change VRF	65	change_vrf
259	Can delete VRF	65	delete_vrf
260	Can view VRF	65	view_vrf
261	Can add VLAN group	66	add_vlangroup
262	Can change VLAN group	66	change_vlangroup
263	Can delete VLAN group	66	delete_vlangroup
264	Can view VLAN group	66	view_vlangroup
265	Can add VLAN	67	add_vlan
266	Can change VLAN	67	change_vlan
267	Can delete VLAN	67	delete_vlan
268	Can view VLAN	67	view_vlan
269	Can add service	68	add_service
270	Can change service	68	change_service
271	Can delete service	68	delete_service
272	Can view service	68	view_service
273	Can add IP range	69	add_iprange
274	Can change IP range	69	change_iprange
275	Can delete IP range	69	delete_iprange
276	Can view IP range	69	view_iprange
277	Can add FHRP group	70	add_fhrpgroup
278	Can change FHRP group	70	change_fhrpgroup
279	Can delete FHRP group	70	delete_fhrpgroup
280	Can view FHRP group	70	view_fhrpgroup
281	Can add FHRP group assignment	71	add_fhrpgroupassignment
282	Can change FHRP group assignment	71	change_fhrpgroupassignment
283	Can delete FHRP group assignment	71	delete_fhrpgroupassignment
284	Can view FHRP group assignment	71	view_fhrpgroupassignment
285	Can add ASN	72	add_asn
286	Can change ASN	72	change_asn
287	Can delete ASN	72	delete_asn
288	Can view ASN	72	view_asn
289	Can add service template	73	add_servicetemplate
290	Can change service template	73	change_servicetemplate
291	Can delete service template	73	delete_servicetemplate
292	Can view service template	73	view_servicetemplate
293	Can add report	74	add_report
294	Can change report	74	change_report
295	Can delete report	74	delete_report
296	Can view report	74	view_report
297	Can add script	75	add_script
298	Can change script	75	change_script
299	Can delete script	75	delete_script
300	Can view script	75	view_script
301	Can add config context	76	add_configcontext
302	Can change config context	76	change_configcontext
303	Can delete config context	76	delete_configcontext
304	Can view config context	76	view_configcontext
305	Can add tag	77	add_tag
306	Can change tag	77	change_tag
307	Can delete tag	77	delete_tag
308	Can view tag	77	view_tag
309	Can add webhook	78	add_webhook
310	Can change webhook	78	change_webhook
311	Can delete webhook	78	delete_webhook
312	Can view webhook	78	view_webhook
313	Can add tagged item	79	add_taggeditem
314	Can change tagged item	79	change_taggeditem
315	Can delete tagged item	79	delete_taggeditem
316	Can view tagged item	79	view_taggeditem
317	Can add object change	80	add_objectchange
318	Can change object change	80	change_objectchange
319	Can delete object change	80	delete_objectchange
320	Can view object change	80	view_objectchange
321	Can add journal entry	81	add_journalentry
322	Can change journal entry	81	change_journalentry
323	Can delete journal entry	81	delete_journalentry
324	Can view journal entry	81	view_journalentry
325	Can add job result	82	add_jobresult
326	Can change job result	82	change_jobresult
327	Can delete job result	82	delete_jobresult
328	Can view job result	82	view_jobresult
329	Can add image attachment	83	add_imageattachment
330	Can change image attachment	83	change_imageattachment
331	Can delete image attachment	83	delete_imageattachment
332	Can view image attachment	83	view_imageattachment
333	Can add export template	84	add_exporttemplate
334	Can change export template	84	change_exporttemplate
335	Can delete export template	84	delete_exporttemplate
336	Can view export template	84	view_exporttemplate
337	Can add custom link	85	add_customlink
338	Can change custom link	85	change_customlink
339	Can delete custom link	85	delete_customlink
340	Can view custom link	85	view_customlink
341	Can add custom field	86	add_customfield
342	Can change custom field	86	change_customfield
343	Can delete custom field	86	delete_customfield
344	Can view custom field	86	view_customfield
345	Can add config revision	87	add_configrevision
346	Can change config revision	87	change_configrevision
347	Can delete config revision	87	delete_configrevision
348	Can view config revision	87	view_configrevision
349	Can add tenant group	88	add_tenantgroup
350	Can change tenant group	88	change_tenantgroup
351	Can delete tenant group	88	delete_tenantgroup
352	Can view tenant group	88	view_tenantgroup
353	Can add tenant	89	add_tenant
354	Can change tenant	89	change_tenant
355	Can delete tenant	89	delete_tenant
356	Can view tenant	89	view_tenant
357	Can add contact role	90	add_contactrole
358	Can change contact role	90	change_contactrole
359	Can delete contact role	90	delete_contactrole
360	Can view contact role	90	view_contactrole
361	Can add contact group	91	add_contactgroup
362	Can change contact group	91	change_contactgroup
363	Can delete contact group	91	delete_contactgroup
364	Can view contact group	91	view_contactgroup
365	Can add contact	92	add_contact
366	Can change contact	92	change_contact
367	Can delete contact	92	delete_contact
368	Can view contact	92	view_contact
369	Can add contact assignment	93	add_contactassignment
370	Can change contact assignment	93	change_contactassignment
371	Can delete contact assignment	93	delete_contactassignment
372	Can view contact assignment	93	view_contactassignment
373	Can add Group	94	add_admingroup
374	Can change Group	94	change_admingroup
375	Can delete Group	94	delete_admingroup
376	Can view Group	94	view_admingroup
377	Can add User	95	add_adminuser
378	Can change User	95	change_adminuser
379	Can delete User	95	delete_adminuser
380	Can view User	95	view_adminuser
381	Can add User Preferences	96	add_userconfig
382	Can change User Preferences	96	change_userconfig
383	Can delete User Preferences	96	delete_userconfig
384	Can view User Preferences	96	view_userconfig
385	Can add token	97	add_token
386	Can change token	97	change_token
387	Can delete token	97	delete_token
388	Can view token	97	view_token
389	Can add permission	98	add_objectpermission
390	Can change permission	98	change_objectpermission
391	Can delete permission	98	delete_objectpermission
392	Can view permission	98	view_objectpermission
393	Can add cluster	99	add_cluster
394	Can change cluster	99	change_cluster
395	Can delete cluster	99	delete_cluster
396	Can view cluster	99	view_cluster
397	Can add cluster group	100	add_clustergroup
398	Can change cluster group	100	change_clustergroup
399	Can delete cluster group	100	delete_clustergroup
400	Can view cluster group	100	view_clustergroup
401	Can add cluster type	101	add_clustertype
402	Can change cluster type	101	change_clustertype
403	Can delete cluster type	101	delete_clustertype
404	Can view cluster type	101	view_clustertype
405	Can add virtual machine	102	add_virtualmachine
406	Can change virtual machine	102	change_virtualmachine
407	Can delete virtual machine	102	delete_virtualmachine
408	Can view virtual machine	102	view_virtualmachine
409	Can add interface	103	add_vminterface
410	Can change interface	103	change_vminterface
411	Can delete interface	103	delete_vminterface
412	Can view interface	103	view_vminterface
413	Can add Wireless LAN Group	104	add_wirelesslangroup
414	Can change Wireless LAN Group	104	change_wirelesslangroup
415	Can delete Wireless LAN Group	104	delete_wirelesslangroup
416	Can view Wireless LAN Group	104	view_wirelesslangroup
417	Can add Wireless LAN	105	add_wirelesslan
418	Can change Wireless LAN	105	change_wirelesslan
419	Can delete Wireless LAN	105	delete_wirelesslan
420	Can view Wireless LAN	105	view_wirelesslan
421	Can add wireless link	106	add_wirelesslink
422	Can change wireless link	106	change_wirelesslink
423	Can delete wireless link	106	delete_wirelesslink
424	Can view wireless link	106	view_wirelesslink
425	Access admin page	107	view
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$13aWqoZ5JNjtr9PuJFajek$5SqA+l0mXbe1Z3MYrqvEC9hyA7l16cqUoSjceQKFDI4=	2022-06-03 22:35:23.342812-03	t	netbox				t	t	2022-06-03 22:34:42.09382-03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuit; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuit (created, last_updated, custom_field_data, id, cid, status, install_date, commit_rate, description, comments, provider_id, tenant_id, termination_a_id, termination_z_id, type_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittermination; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittermination (created, last_updated, id, _link_peer_id, mark_connected, term_side, port_speed, upstream_speed, xconnect_id, pp_info, description, _link_peer_type_id, cable_id, circuit_id, provider_network_id, site_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittype (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: circuits_provider; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_provider (created, last_updated, custom_field_data, id, name, slug, asn, account, portal_url, noc_contact, admin_contact, comments) FROM stdin;
\.


--
-- Data for Name: circuits_provider_asns; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_provider_asns (id, provider_id, asn_id) FROM stdin;
\.


--
-- Data for Name: circuits_providernetwork; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_providernetwork (created, last_updated, custom_field_data, id, name, description, comments, provider_id, service_id) FROM stdin;
\.


--
-- Data for Name: dcim_cable; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cable (created, last_updated, custom_field_data, id, termination_a_id, termination_b_id, type, status, label, color, length, length_unit, _abs_length, _termination_a_device_id, _termination_b_device_id, termination_a_type_id, termination_b_type_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_cablepath; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cablepath (id, origin_id, destination_id, path, is_active, is_split, destination_type_id, origin_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleport (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, speed, _link_peer_type_id, _path_id, cable_id, device_id, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleporttemplate (created, last_updated, id, name, _name, label, description, type, device_type_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverport (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, speed, _link_peer_type_id, _path_id, cable_id, device_id, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverporttemplate (created, last_updated, id, name, _name, label, description, type, device_type_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_device; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_device (created, last_updated, custom_field_data, id, local_context_data, name, _name, serial, asset_tag, "position", face, status, vc_position, vc_priority, comments, cluster_id, device_role_id, device_type_id, location_id, platform_id, primary_ip4_id, primary_ip6_id, rack_id, site_id, tenant_id, virtual_chassis_id, airflow) FROM stdin;
2022-06-03 22:43:18.63827-03	2022-06-05 17:53:12.969118-03	{"sw_version": "16.10.1"}	1	\N	HEAD-LAN001	HEAD-LAN00000001		\N	\N		active	\N	\N		\N	1	1	\N	\N	1	\N	\N	1	1	\N	
2022-06-04 02:13:31.243932-03	2022-06-05 17:53:13.274706-03	{"sw_version": "16.10.1"}	2	\N	HEAD-LAN002	HEAD-LAN00000002		\N	\N		active	\N	\N		\N	1	1	\N	\N	2	\N	\N	1	1	\N	
2022-06-05 01:01:49.742992-03	2022-06-05 17:53:13.590743-03	{"sw_version": "5.0(2)N2(1)"}	3	\N	HEAD-NEX001	HEAD-NEX00000001		\N	\N		active	\N	\N		\N	2	2	\N	\N	3	\N	\N	1	1	\N	
2022-06-05 15:13:58.251047-03	2022-06-05 17:53:13.868503-03	{"sw_version": "9.8(2)"}	4	\N	HEAD-SEC001	HEAD-SEC00000001		\N	\N		active	\N	\N		\N	3	3	\N	\N	4	\N	\N	1	1	\N	
2022-06-05 16:42:27.980909-03	2022-06-05 17:53:14.173887-03	{"sw_version": "8.0.4"}	6	\N	HEAD-SEC002	HEAD-SEC00000002		\N	\N		active	\N	\N		\N	3	5	\N	\N	6	\N	\N	1	1	\N	
2022-06-05 15:26:19.774457-03	2022-06-05 17:53:14.450429-03	{"sw_version": "8.0.0.0-svcs-ctrl"}	5	\N	HEAD-WLC001	HEAD-WLC00000001		\N	\N		active	\N	\N		\N	4	4	\N	\N	5	\N	\N	1	1	\N	
\.


--
-- Data for Name: dcim_devicebay; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebay (created, last_updated, custom_field_data, id, name, _name, label, description, device_id, installed_device_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicebaytemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebaytemplate (created, last_updated, id, name, _name, label, description, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicerole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicerole (created, last_updated, custom_field_data, id, name, slug, color, vm_role, description) FROM stdin;
2022-06-03 22:39:21.815389-03	2022-06-03 22:42:28.67472-03	{}	1	Lan Access switch	lan-access-switch	9e9e9e	f	
2022-06-05 01:00:47.43672-03	2022-06-05 01:00:47.436735-03	{}	2	NEXUS	nexus	9e9e9e	f	
2022-06-05 15:12:49.369412-03	2022-06-05 15:12:49.369425-03	{}	3	Firewall	firewall	ff9800	t	
2022-06-05 15:24:18.25951-03	2022-06-05 15:24:32.421407-03	{}	4	Wireless Lan Controller	wireless-lan-controller	00bcd4	f	
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicetype (created, last_updated, custom_field_data, id, model, slug, part_number, u_height, is_full_depth, subdevice_role, front_image, rear_image, comments, manufacturer_id, airflow) FROM stdin;
2022-06-05 15:13:17.257571-03	2022-06-05 15:40:48.920141-03	{"sw_version_parser": "Cisco_ASA_sw_version_parser", "command_soft_version": "show version"}	3	Cisco ASA	cisco-asa		1	t					1	
2022-06-03 22:42:14.257408-03	2022-06-05 15:40:48.931282-03	{"sw_version_parser": "Cisco_9k_sw_version_parser", "command_soft_version": "show version"}	1	Cisco Switch 9300	cisco-switch-9300		1	t					1	
2022-06-05 01:01:10.677758-03	2022-06-05 15:40:48.94111-03	{"sw_version_parser": "Cisco_NEXUS_sw_version_parser", "command_soft_version": "show version"}	2	NEXUS	nexus		1	t					1	
2022-06-05 15:24:55.738585-03	2022-06-05 15:41:04.860855-03	{"sw_version_parser": "Aruba_7205_sw_version_parser", "command_soft_version": "show image version"}	4	Controller 7205	controller-7205		1	t					2	
2022-06-05 16:41:48.073302-03	2022-06-05 16:41:48.073314-03	{"sw_version_parser": "PaloAlto_sw_version_parser", "command_soft_version": "show system info"}	5	PA-5420	pa-5420		1	t					3	
\.


--
-- Data for Name: dcim_frontport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontport (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, rear_port_position, _link_peer_type_id, cable_id, device_id, rear_port_id, color, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_frontporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontporttemplate (created, last_updated, id, name, _name, label, description, type, rear_port_position, device_type_id, rear_port_id, color, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_interface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface (created, last_updated, custom_field_data, id, name, label, description, _link_peer_id, mark_connected, enabled, mac_address, mtu, mode, _name, type, mgmt_only, _link_peer_type_id, _path_id, cable_id, device_id, lag_id, parent_id, untagged_vlan_id, wwn, bridge_id, rf_role, rf_channel, rf_channel_frequency, rf_channel_width, tx_power, wireless_link_id, module_id, vrf_id, duplex, speed) FROM stdin;
2022-06-03 23:48:45.460974-03	2022-06-03 23:48:45.460986-03	{}	1	Gi0/1/0			\N	f	t	\N	\N		0000000199999999Gi000000............	1000base-t	f	\N	\N	\N	1	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N		\N
2022-06-04 02:16:46.498915-03	2022-06-04 02:16:46.498926-03	{}	4	Gi1/2/1			\N	f	t	\N	\N		0001000299999999Gi000001............	1000base-t	f	\N	\N	\N	2	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N		\N
2022-06-05 01:02:32.056255-03	2022-06-05 01:02:32.056267-03	{}	5	Gi0/0/1			\N	f	t	\N	\N		0000000099999999Gi000001............	1000base-t	f	\N	\N	\N	3	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N		\N
2022-06-05 15:14:32.370581-03	2022-06-05 15:14:32.370593-03	{}	6	Gi0/1/2			\N	f	t	\N	\N		0000000199999999Gi000002............	1000base-t	f	\N	\N	\N	4	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N		\N
2022-06-05 15:27:40.184921-03	2022-06-05 15:27:40.184932-03	{}	7	INT0/7			\N	f	t	\N	\N		0000999999999999INT000007............	1000base-t	f	\N	\N	\N	5	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N		\N
2022-06-05 16:43:07.203078-03	2022-06-05 16:43:07.203091-03	{}	8	INT-1			\N	f	t	\N	\N		9999999999999999INT-000001............	1000base-t	f	\N	\N	\N	6	\N	\N	\N	\N	\N			\N	\N	\N	\N	\N	\N		\N
\.


--
-- Data for Name: dcim_interface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_tagged_vlans (id, interface_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interface_wireless_lans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_wireless_lans (id, interface_id, wirelesslan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interfacetemplate (created, last_updated, id, name, label, description, _name, type, mgmt_only, device_type_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitem (created, last_updated, custom_field_data, id, name, _name, label, description, part_id, serial, asset_tag, discovered, lft, rght, tree_id, level, device_id, manufacturer_id, parent_id, role_id, component_id, component_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitemrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitemrole (created, last_updated, custom_field_data, id, name, slug, color, description) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitemtemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitemtemplate (created, last_updated, id, name, _name, label, description, component_id, part_id, lft, rght, tree_id, level, component_type_id, device_type_id, manufacturer_id, parent_id, role_id) FROM stdin;
\.


--
-- Data for Name: dcim_location; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_location (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id, site_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_manufacturer; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_manufacturer (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
2022-06-03 22:41:33.900588-03	2022-06-03 22:41:33.900599-03	{}	1	Cisco	cisco	
2022-06-05 15:23:56.858928-03	2022-06-05 15:23:56.85894-03	{}	2	Aruba	aruba	
2022-06-05 16:39:59.840522-03	2022-06-05 16:39:59.840546-03	{}	3	Palo Alto	palo-alto	
\.


--
-- Data for Name: dcim_module; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_module (created, last_updated, custom_field_data, id, local_context_data, serial, asset_tag, comments, device_id, module_bay_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_modulebay; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_modulebay (created, last_updated, custom_field_data, id, name, _name, label, "position", description, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_modulebaytemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_modulebaytemplate (created, last_updated, id, name, _name, label, "position", description, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_moduletype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_moduletype (created, last_updated, custom_field_data, id, model, part_number, comments, manufacturer_id) FROM stdin;
\.


--
-- Data for Name: dcim_platform; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_platform (created, last_updated, custom_field_data, id, name, slug, napalm_driver, napalm_args, description, manufacturer_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerfeed; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerfeed (created, last_updated, custom_field_data, id, _link_peer_id, mark_connected, name, status, type, supply, phase, voltage, amperage, max_utilization, available_power, comments, _link_peer_type_id, _path_id, cable_id, power_panel_id, rack_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlet; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlet (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, feed_leg, _link_peer_type_id, _path_id, cable_id, device_id, power_port_id, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlettemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlettemplate (created, last_updated, id, name, _name, label, description, type, feed_leg, device_type_id, power_port_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerpanel; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerpanel (created, last_updated, custom_field_data, id, name, location_id, site_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerport (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, maximum_draw, allocated_draw, _link_peer_type_id, _path_id, cable_id, device_id, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerporttemplate (created, last_updated, id, name, _name, label, description, type, maximum_draw, allocated_draw, device_type_id, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_rack; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rack (created, last_updated, custom_field_data, id, name, _name, facility_id, status, serial, asset_tag, type, width, u_height, desc_units, outer_width, outer_depth, outer_unit, comments, location_id, role_id, site_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackreservation; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackreservation (created, last_updated, custom_field_data, id, units, description, rack_id, tenant_id, user_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackrole (created, last_updated, custom_field_data, id, name, slug, color, description) FROM stdin;
\.


--
-- Data for Name: dcim_rearport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearport (created, last_updated, custom_field_data, id, name, _name, label, description, _link_peer_id, mark_connected, type, positions, _link_peer_type_id, cable_id, device_id, color, module_id) FROM stdin;
\.


--
-- Data for Name: dcim_rearporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearporttemplate (created, last_updated, id, name, _name, label, description, type, positions, device_type_id, color, module_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_region; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_region (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_site; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_site (created, last_updated, custom_field_data, id, name, _name, slug, status, facility, time_zone, description, physical_address, shipping_address, latitude, longitude, comments, group_id, region_id, tenant_id) FROM stdin;
2022-06-03 22:36:57.995782-03	2022-06-03 22:36:57.995818-03	{}	1	Headquarters Guido Corporation	Headquarters Guido Corporation	headquarters-guido-corporation	active						\N	\N		\N	\N	\N
\.


--
-- Data for Name: dcim_site_asns; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_site_asns (id, site_id, asn_id) FROM stdin;
\.


--
-- Data for Name: dcim_sitegroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_sitegroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_virtualchassis; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_virtualchassis (created, last_updated, custom_field_data, id, name, domain, master_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	social_django	association
8	social_django	code
9	social_django	nonce
10	social_django	usersocialauth
11	social_django	partial
12	taggit	tag
13	taggit	taggeditem
14	circuits	circuit
15	circuits	circuittermination
16	circuits	circuittype
17	circuits	provider
18	circuits	providernetwork
19	dcim	cable
20	dcim	cablepath
21	dcim	consoleport
22	dcim	consoleporttemplate
23	dcim	consoleserverport
24	dcim	consoleserverporttemplate
25	dcim	device
26	dcim	devicebay
27	dcim	devicebaytemplate
28	dcim	devicerole
29	dcim	devicetype
30	dcim	frontport
31	dcim	frontporttemplate
32	dcim	interface
33	dcim	interfacetemplate
34	dcim	inventoryitem
35	dcim	location
36	dcim	manufacturer
37	dcim	platform
38	dcim	powerfeed
39	dcim	poweroutlet
40	dcim	poweroutlettemplate
41	dcim	powerpanel
42	dcim	powerport
43	dcim	powerporttemplate
44	dcim	rack
45	dcim	rackreservation
46	dcim	rackrole
47	dcim	rearport
48	dcim	rearporttemplate
49	dcim	region
50	dcim	site
51	dcim	sitegroup
52	dcim	virtualchassis
53	dcim	moduletype
54	dcim	modulebay
55	dcim	module
56	dcim	modulebaytemplate
57	dcim	inventoryitemrole
58	dcim	inventoryitemtemplate
59	ipam	aggregate
60	ipam	ipaddress
61	ipam	prefix
62	ipam	rir
63	ipam	role
64	ipam	routetarget
65	ipam	vrf
66	ipam	vlangroup
67	ipam	vlan
68	ipam	service
69	ipam	iprange
70	ipam	fhrpgroup
71	ipam	fhrpgroupassignment
72	ipam	asn
73	ipam	servicetemplate
74	extras	report
75	extras	script
76	extras	configcontext
77	extras	tag
78	extras	webhook
79	extras	taggeditem
80	extras	objectchange
81	extras	journalentry
82	extras	jobresult
83	extras	imageattachment
84	extras	exporttemplate
85	extras	customlink
86	extras	customfield
87	extras	configrevision
88	tenancy	tenantgroup
89	tenancy	tenant
90	tenancy	contactrole
91	tenancy	contactgroup
92	tenancy	contact
93	tenancy	contactassignment
94	users	admingroup
95	users	adminuser
96	users	userconfig
97	users	token
98	users	objectpermission
99	virtualization	cluster
100	virtualization	clustergroup
101	virtualization	clustertype
102	virtualization	virtualmachine
103	virtualization	vminterface
104	wireless	wirelesslangroup
105	wireless	wirelesslan
106	wireless	wirelesslink
107	django_rq	queue
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-06-03 22:32:42.729596-03
2	auth	0001_initial	2022-06-03 22:32:42.901957-03
3	admin	0001_initial	2022-06-03 22:32:42.944813-03
4	admin	0002_logentry_remove_auto_add	2022-06-03 22:32:42.959331-03
5	admin	0003_logentry_add_action_flag_choices	2022-06-03 22:32:42.970804-03
6	contenttypes	0002_remove_content_type_name	2022-06-03 22:32:42.983233-03
7	auth	0002_alter_permission_name_max_length	2022-06-03 22:32:42.990347-03
8	auth	0003_alter_user_email_max_length	2022-06-03 22:32:42.999091-03
9	auth	0004_alter_user_username_opts	2022-06-03 22:32:43.005907-03
10	auth	0005_alter_user_last_login_null	2022-06-03 22:32:43.012853-03
11	auth	0006_require_contenttypes_0002	2022-06-03 22:32:43.016046-03
12	auth	0007_alter_validators_add_error_messages	2022-06-03 22:32:43.022822-03
13	auth	0008_alter_user_username_max_length	2022-06-03 22:32:43.035819-03
14	auth	0009_alter_user_last_name_max_length	2022-06-03 22:32:43.04342-03
15	auth	0010_alter_group_name_max_length	2022-06-03 22:32:43.050949-03
16	auth	0011_update_proxy_permissions	2022-06-03 22:32:43.058237-03
17	auth	0012_alter_user_first_name_max_length	2022-06-03 22:32:43.066814-03
18	extras	0001_initial	2022-06-03 22:32:43.535239-03
19	tenancy	0001_initial	2022-06-03 22:32:43.670929-03
20	tenancy	0002_tenant_group_optional	2022-06-03 22:32:43.675578-03
21	tenancy	0003_unicode_literals	2022-06-03 22:32:43.679664-03
22	tenancy	0004_tags	2022-06-03 22:32:43.683693-03
23	tenancy	0005_change_logging	2022-06-03 22:32:43.687879-03
24	tenancy	0006_custom_tag_models	2022-06-03 22:32:43.692086-03
25	tenancy	0007_nested_tenantgroups	2022-06-03 22:32:43.69639-03
26	tenancy	0008_nested_tenantgroups_rebuild	2022-06-03 22:32:43.700703-03
27	tenancy	0009_standardize_description	2022-06-03 22:32:43.705046-03
28	tenancy	0010_custom_field_data	2022-06-03 22:32:43.709948-03
29	tenancy	0011_standardize_name_length	2022-06-03 22:32:43.715218-03
30	tenancy	0012_standardize_models	2022-06-03 22:32:43.720584-03
31	tenancy	0002_tenant_ordering	2022-06-03 22:32:43.736226-03
32	dcim	0001_initial	2022-06-03 22:32:44.625229-03
33	dcim	0002_auto_20160622_1821	2022-06-03 22:32:46.086374-03
34	ipam	0001_initial	2022-06-03 22:32:46.68739-03
35	virtualization	0001_virtualization	2022-06-03 22:32:47.173514-03
36	virtualization	0002_virtualmachine_add_status	2022-06-03 22:32:47.178742-03
37	virtualization	0003_cluster_add_site	2022-06-03 22:32:47.183501-03
38	virtualization	0004_virtualmachine_add_role	2022-06-03 22:32:47.18789-03
39	virtualization	0005_django2	2022-06-03 22:32:47.192599-03
40	virtualization	0006_tags	2022-06-03 22:32:47.198137-03
41	virtualization	0007_change_logging	2022-06-03 22:32:47.203879-03
42	virtualization	0008_virtualmachine_local_context_data	2022-06-03 22:32:47.209708-03
43	virtualization	0009_custom_tag_models	2022-06-03 22:32:47.215625-03
44	virtualization	0010_cluster_add_tenant	2022-06-03 22:32:47.221374-03
45	virtualization	0011_3569_virtualmachine_fields	2022-06-03 22:32:47.227251-03
46	virtualization	0012_vm_name_nonunique	2022-06-03 22:32:47.232505-03
47	virtualization	0013_deterministic_ordering	2022-06-03 22:32:47.237425-03
48	virtualization	0014_standardize_description	2022-06-03 22:32:47.242659-03
49	virtualization	0015_vminterface	2022-06-03 22:32:47.247751-03
50	virtualization	0016_replicate_interfaces	2022-06-03 22:32:47.252801-03
51	virtualization	0017_update_jsonfield	2022-06-03 22:32:47.257464-03
52	virtualization	0018_custom_field_data	2022-06-03 22:32:47.261713-03
53	virtualization	0019_standardize_name_length	2022-06-03 22:32:47.265801-03
54	virtualization	0020_standardize_models	2022-06-03 22:32:47.27028-03
55	virtualization	0021_virtualmachine_vcpus_decimal	2022-06-03 22:32:47.274759-03
56	virtualization	0022_vminterface_parent	2022-06-03 22:32:47.27902-03
57	extras	0002_custom_fields	2022-06-03 22:32:48.428742-03
58	extras	0003_exporttemplate_add_description	2022-06-03 22:32:48.433865-03
59	extras	0004_topologymap_change_comma_to_semicolon	2022-06-03 22:32:48.438595-03
60	extras	0005_useraction_add_bulk_create	2022-06-03 22:32:48.442853-03
61	extras	0006_add_imageattachments	2022-06-03 22:32:48.44699-03
62	extras	0007_unicode_literals	2022-06-03 22:32:48.451119-03
63	extras	0008_reports	2022-06-03 22:32:48.455639-03
64	extras	0009_topologymap_type	2022-06-03 22:32:48.460046-03
65	extras	0010_customfield_filter_logic	2022-06-03 22:32:48.464468-03
66	extras	0011_django2	2022-06-03 22:32:48.469155-03
67	extras	0012_webhooks	2022-06-03 22:32:48.473822-03
68	extras	0013_objectchange	2022-06-03 22:32:48.479051-03
69	extras	0014_configcontexts	2022-06-03 22:32:48.484471-03
70	extras	0015_remove_useraction	2022-06-03 22:32:48.48935-03
71	extras	0016_exporttemplate_add_cable	2022-06-03 22:32:48.493965-03
72	extras	0017_exporttemplate_mime_type_length	2022-06-03 22:32:48.499336-03
73	extras	0018_exporttemplate_add_jinja2	2022-06-03 22:32:48.505058-03
74	extras	0019_tag_taggeditem	2022-06-03 22:32:48.510294-03
75	extras	0020_tag_data	2022-06-03 22:32:48.515173-03
76	extras	0021_add_color_comments_changelog_to_tag	2022-06-03 22:32:48.519896-03
77	extras	0022_custom_links	2022-06-03 22:32:48.524092-03
78	extras	0023_fix_tag_sequences	2022-06-03 22:32:48.528448-03
79	extras	0024_scripts	2022-06-03 22:32:48.532718-03
80	extras	0025_objectchange_time_index	2022-06-03 22:32:48.53702-03
81	extras	0026_webhook_ca_file_path	2022-06-03 22:32:48.541216-03
82	extras	0027_webhook_additional_headers	2022-06-03 22:32:48.548687-03
83	extras	0028_remove_topology_maps	2022-06-03 22:32:48.553033-03
84	extras	0029_3569_customfield_fields	2022-06-03 22:32:48.557296-03
85	extras	0030_3569_objectchange_fields	2022-06-03 22:32:48.562167-03
86	extras	0031_3569_exporttemplate_fields	2022-06-03 22:32:48.566895-03
87	extras	0032_3569_webhook_fields	2022-06-03 22:32:48.571297-03
88	extras	0033_graph_type_template_language	2022-06-03 22:32:48.575629-03
89	extras	0034_configcontext_tags	2022-06-03 22:32:48.579735-03
90	extras	0035_deterministic_ordering	2022-06-03 22:32:48.583963-03
91	extras	0036_contenttype_filters_to_q_objects	2022-06-03 22:32:48.589356-03
92	extras	0037_configcontexts_clusters	2022-06-03 22:32:48.59487-03
93	extras	0038_webhook_template_support	2022-06-03 22:32:48.600563-03
94	extras	0039_update_features_content_types	2022-06-03 22:32:48.606229-03
95	extras	0040_standardize_description	2022-06-03 22:32:48.612154-03
96	extras	0041_tag_description	2022-06-03 22:32:48.618098-03
97	extras	0042_customfield_manager	2022-06-03 22:32:48.624104-03
98	extras	0043_report	2022-06-03 22:32:48.630149-03
99	extras	0044_jobresult	2022-06-03 22:32:48.636055-03
100	extras	0045_configcontext_changelog	2022-06-03 22:32:48.64211-03
101	extras	0046_update_jsonfield	2022-06-03 22:32:48.647492-03
102	extras	0047_tag_ordering	2022-06-03 22:32:48.652184-03
103	extras	0048_exporttemplate_remove_template_language	2022-06-03 22:32:48.6568-03
104	extras	0049_remove_graph	2022-06-03 22:32:48.662515-03
105	extras	0050_customfield_changes	2022-06-03 22:32:48.668355-03
106	extras	0051_migrate_customfields	2022-06-03 22:32:48.67339-03
107	extras	0052_customfield_cleanup	2022-06-03 22:32:48.678052-03
108	extras	0053_rename_webhook_obj_type	2022-06-03 22:32:48.682563-03
109	extras	0054_standardize_models	2022-06-03 22:32:48.686993-03
110	extras	0055_objectchange_data	2022-06-03 22:32:48.692869-03
111	extras	0056_extend_configcontext	2022-06-03 22:32:48.697722-03
112	extras	0057_customlink_rename_fields	2022-06-03 22:32:48.703467-03
113	extras	0058_journalentry	2022-06-03 22:32:48.709062-03
114	extras	0059_exporttemplate_as_attachment	2022-06-03 22:32:48.714966-03
115	extras	0060_customlink_button_class	2022-06-03 22:32:48.7411-03
116	extras	0061_extras_change_logging	2022-06-03 22:32:48.839514-03
117	extras	0062_clear_secrets_changelog	2022-06-03 22:32:48.882914-03
118	tenancy	0003_contacts	2022-06-03 22:32:49.137856-03
119	tenancy	0004_extend_tag_support	2022-06-03 22:32:49.358725-03
120	dcim	0003_auto_20160628_1721	2022-06-03 22:32:53.100114-03
121	dcim	0004_auto_20160701_2049	2022-06-03 22:32:53.105614-03
122	dcim	0005_auto_20160706_1722	2022-06-03 22:32:53.11066-03
123	dcim	0006_add_device_primary_ip4_ip6	2022-06-03 22:32:53.115313-03
124	dcim	0007_device_copy_primary_ip	2022-06-03 22:32:53.119946-03
125	dcim	0008_device_remove_primary_ip	2022-06-03 22:32:53.125602-03
126	dcim	0009_site_32bit_asn_support	2022-06-03 22:32:53.133092-03
127	dcim	0010_devicebay_installed_device_set_null	2022-06-03 22:32:53.139061-03
128	dcim	0011_devicetype_part_number	2022-06-03 22:32:53.144975-03
129	dcim	0012_site_rack_device_add_tenant	2022-06-03 22:32:53.150331-03
130	dcim	0013_add_interface_form_factors	2022-06-03 22:32:53.156097-03
131	dcim	0014_rack_add_type_width	2022-06-03 22:32:53.163431-03
132	dcim	0015_rack_add_u_height_validator	2022-06-03 22:32:53.16844-03
133	dcim	0016_module_add_manufacturer	2022-06-03 22:32:53.174273-03
134	dcim	0017_rack_add_role	2022-06-03 22:32:53.180105-03
135	dcim	0018_device_add_asset_tag	2022-06-03 22:32:53.186129-03
136	dcim	0019_new_iface_form_factors	2022-06-03 22:32:53.19186-03
137	dcim	0020_rack_desc_units	2022-06-03 22:32:53.197887-03
138	dcim	0021_add_ff_flexstack	2022-06-03 22:32:53.203743-03
139	dcim	0022_color_names_to_rgb	2022-06-03 22:32:53.209842-03
140	dcim	0023_devicetype_comments	2022-06-03 22:32:53.215902-03
141	dcim	0024_site_add_contact_fields	2022-06-03 22:32:53.222013-03
142	dcim	0025_devicetype_add_interface_ordering	2022-06-03 22:32:53.228037-03
143	dcim	0026_add_rack_reservations	2022-06-03 22:32:53.234142-03
144	dcim	0027_device_add_site	2022-06-03 22:32:53.24017-03
145	dcim	0028_device_copy_rack_to_site	2022-06-03 22:32:53.246161-03
146	dcim	0029_allow_rackless_devices	2022-06-03 22:32:53.252077-03
147	dcim	0030_interface_add_lag	2022-06-03 22:32:53.257999-03
148	dcim	0031_regions	2022-06-03 22:32:53.263726-03
149	dcim	0032_device_increase_name_length	2022-06-03 22:32:53.269891-03
150	dcim	0033_rackreservation_rack_editable	2022-06-03 22:32:53.276011-03
151	dcim	0034_rename_module_to_inventoryitem	2022-06-03 22:32:53.281251-03
152	dcim	0035_device_expand_status_choices	2022-06-03 22:32:53.286368-03
153	dcim	0036_add_ff_juniper_vcp	2022-06-03 22:32:53.291132-03
154	dcim	0037_unicode_literals	2022-06-03 22:32:53.295743-03
155	dcim	0038_wireless_interfaces	2022-06-03 22:32:53.300657-03
156	dcim	0039_interface_add_enabled_mtu	2022-06-03 22:32:53.305759-03
157	dcim	0040_inventoryitem_add_asset_tag_description	2022-06-03 22:32:53.310638-03
158	dcim	0041_napalm_integration	2022-06-03 22:32:53.31542-03
159	dcim	0042_interface_ff_10ge_cx4	2022-06-03 22:32:53.319773-03
160	dcim	0043_device_component_name_lengths	2022-06-03 22:32:53.323597-03
161	dcim	0044_virtualization	2022-06-03 22:32:53.327507-03
162	dcim	0045_devicerole_vm_role	2022-06-03 22:32:53.331548-03
163	dcim	0046_rack_lengthen_facility_id	2022-06-03 22:32:53.336011-03
164	dcim	0047_more_100ge_form_factors	2022-06-03 22:32:53.340717-03
165	dcim	0048_rack_serial	2022-06-03 22:32:53.346998-03
166	dcim	0049_rackreservation_change_user	2022-06-03 22:32:53.352935-03
167	dcim	0050_interface_vlan_tagging	2022-06-03 22:32:53.358117-03
168	dcim	0051_rackreservation_tenant	2022-06-03 22:32:53.363642-03
169	dcim	0052_virtual_chassis	2022-06-03 22:32:53.368872-03
170	dcim	0053_platform_manufacturer	2022-06-03 22:32:53.373874-03
171	dcim	0054_site_status_timezone_description	2022-06-03 22:32:53.378525-03
172	dcim	0055_virtualchassis_ordering	2022-06-03 22:32:53.384264-03
173	dcim	0056_django2	2022-06-03 22:32:53.390054-03
174	dcim	0057_tags	2022-06-03 22:32:53.395944-03
175	dcim	0058_relax_rack_naming_constraints	2022-06-03 22:32:53.401826-03
176	dcim	0059_site_latitude_longitude	2022-06-03 22:32:53.409387-03
177	dcim	0060_change_logging	2022-06-03 22:32:53.415447-03
178	dcim	0061_platform_napalm_args	2022-06-03 22:32:53.421487-03
179	dcim	0062_interface_mtu	2022-06-03 22:32:53.427523-03
180	dcim	0063_device_local_context_data	2022-06-03 22:32:53.433453-03
181	dcim	0064_remove_platform_rpc_client	2022-06-03 22:32:53.439464-03
182	dcim	0065_front_rear_ports	2022-06-03 22:32:53.445502-03
183	dcim	0066_cables	2022-06-03 22:32:53.45129-03
184	dcim	0067_device_type_remove_qualifiers	2022-06-03 22:32:53.456644-03
185	dcim	0068_rack_new_fields	2022-06-03 22:32:53.461536-03
186	dcim	0069_deprecate_nullablecharfield	2022-06-03 22:32:53.467314-03
187	dcim	0070_custom_tag_models	2022-06-03 22:32:53.473296-03
188	dcim	0071_device_components_add_description	2022-06-03 22:32:53.478845-03
189	dcim	0072_powerfeeds	2022-06-03 22:32:53.484488-03
190	dcim	0073_interface_form_factor_to_type	2022-06-03 22:32:53.49048-03
191	dcim	0074_increase_field_length_platform_name_slug	2022-06-03 22:32:53.49623-03
192	dcim	0075_cable_devices	2022-06-03 22:32:53.50222-03
193	dcim	0076_console_port_types	2022-06-03 22:32:53.511477-03
194	dcim	0077_power_types	2022-06-03 22:32:53.517562-03
195	dcim	0078_3569_site_fields	2022-06-03 22:32:53.52527-03
196	dcim	0079_3569_rack_fields	2022-06-03 22:32:53.531394-03
197	dcim	0080_3569_devicetype_fields	2022-06-03 22:32:53.537648-03
198	dcim	0081_3569_device_fields	2022-06-03 22:32:53.544002-03
199	dcim	0082_3569_interface_fields	2022-06-03 22:32:53.549481-03
200	dcim	0082_3569_port_fields	2022-06-03 22:32:53.556846-03
201	dcim	0083_3569_cable_fields	2022-06-03 22:32:53.562979-03
202	dcim	0084_3569_powerfeed_fields	2022-06-03 22:32:53.568855-03
203	dcim	0085_3569_poweroutlet_fields	2022-06-03 22:32:53.574523-03
204	dcim	0086_device_name_nonunique	2022-06-03 22:32:53.579517-03
205	dcim	0087_role_descriptions	2022-06-03 22:32:53.584195-03
206	dcim	0088_powerfeed_available_power	2022-06-03 22:32:53.590035-03
207	dcim	0089_deterministic_ordering	2022-06-03 22:32:53.595945-03
208	dcim	0090_cable_termination_models	2022-06-03 22:32:53.602745-03
209	dcim	0091_interface_type_other	2022-06-03 22:32:53.6087-03
210	dcim	0092_fix_rack_outer_unit	2022-06-03 22:32:53.614576-03
211	dcim	0093_device_component_ordering	2022-06-03 22:32:53.620559-03
212	dcim	0094_device_component_template_ordering	2022-06-03 22:32:53.626736-03
213	dcim	0095_primary_model_ordering	2022-06-03 22:32:53.632864-03
214	dcim	0096_interface_ordering	2022-06-03 22:32:53.639104-03
215	dcim	0097_interfacetemplate_type_other	2022-06-03 22:32:53.645397-03
216	dcim	0098_devicetype_images	2022-06-03 22:32:53.651791-03
217	dcim	0099_powerfeed_negative_voltage	2022-06-03 22:32:53.658119-03
218	dcim	0100_mptt_remove_indexes	2022-06-03 22:32:53.664399-03
219	dcim	0101_nested_rackgroups	2022-06-03 22:32:53.670717-03
220	dcim	0102_nested_rackgroups_rebuild	2022-06-03 22:32:53.676732-03
221	dcim	0103_standardize_description	2022-06-03 22:32:53.682745-03
222	dcim	0104_correct_infiniband_types	2022-06-03 22:32:53.689081-03
223	dcim	0105_interface_name_collation	2022-06-03 22:32:53.695375-03
224	dcim	0106_role_default_color	2022-06-03 22:32:53.701768-03
225	dcim	0107_component_labels	2022-06-03 22:32:53.707803-03
226	dcim	0108_add_tags	2022-06-03 22:32:53.71395-03
227	dcim	0109_interface_remove_vm	2022-06-03 22:32:53.721605-03
228	dcim	0110_virtualchassis_name	2022-06-03 22:32:53.727044-03
229	dcim	0111_component_template_description	2022-06-03 22:32:53.7327-03
230	dcim	0112_standardize_components	2022-06-03 22:32:53.737925-03
231	dcim	0113_nullbooleanfield_to_booleanfield	2022-06-03 22:32:53.742796-03
232	dcim	0114_update_jsonfield	2022-06-03 22:32:53.748519-03
233	dcim	0115_rackreservation_order	2022-06-03 22:32:53.754655-03
234	dcim	0116_rearport_max_positions	2022-06-03 22:32:53.761881-03
235	dcim	0117_custom_field_data	2022-06-03 22:32:53.768044-03
236	dcim	0118_inventoryitem_mptt	2022-06-03 22:32:53.774098-03
237	dcim	0119_inventoryitem_mptt_rebuild	2022-06-03 22:32:53.780192-03
238	dcim	0120_cache_cable_peer	2022-06-03 22:32:53.786249-03
239	dcim	0121_cablepath	2022-06-03 22:32:53.792499-03
240	dcim	0122_standardize_name_length	2022-06-03 22:32:53.798828-03
241	dcim	0123_standardize_models	2022-06-03 22:32:53.804983-03
242	dcim	0124_mark_connected	2022-06-03 22:32:53.811076-03
243	dcim	0125_console_port_speed	2022-06-03 22:32:53.817321-03
244	dcim	0126_rename_rackgroup_location	2022-06-03 22:32:53.823346-03
245	dcim	0127_device_location	2022-06-03 22:32:53.830536-03
246	dcim	0128_device_location_populate	2022-06-03 22:32:53.836708-03
247	dcim	0129_interface_parent	2022-06-03 22:32:53.842642-03
248	dcim	0130_sitegroup	2022-06-03 22:32:53.848716-03
249	ipam	0002_vrf_add_enforce_unique	2022-06-03 22:32:55.127494-03
250	ipam	0003_ipam_add_vlangroups	2022-06-03 22:32:55.13317-03
251	ipam	0004_ipam_vlangroup_uniqueness	2022-06-03 22:32:55.13806-03
252	ipam	0005_auto_20160725_1842	2022-06-03 22:32:55.143219-03
253	ipam	0006_vrf_vlan_add_tenant	2022-06-03 22:32:55.1486-03
254	ipam	0007_prefix_ipaddress_add_tenant	2022-06-03 22:32:55.153815-03
255	ipam	0008_prefix_change_order	2022-06-03 22:32:55.158907-03
256	ipam	0009_ipaddress_add_status	2022-06-03 22:32:55.164068-03
257	ipam	0010_ipaddress_help_texts	2022-06-03 22:32:55.168898-03
258	ipam	0011_rir_add_is_private	2022-06-03 22:32:55.173711-03
259	ipam	0012_services	2022-06-03 22:32:55.178432-03
260	ipam	0013_prefix_add_is_pool	2022-06-03 22:32:55.183116-03
261	ipam	0014_ipaddress_status_add_deprecated	2022-06-03 22:32:55.189354-03
262	ipam	0015_global_vlans	2022-06-03 22:32:55.193579-03
263	ipam	0016_unicode_literals	2022-06-03 22:32:55.198383-03
264	ipam	0017_ipaddress_roles	2022-06-03 22:32:55.20358-03
265	ipam	0018_remove_service_uniqueness_constraint	2022-06-03 22:32:55.208573-03
266	ipam	0019_virtualization	2022-06-03 22:32:55.213614-03
267	ipam	0020_ipaddress_add_role_carp	2022-06-03 22:32:55.218197-03
268	ipam	0021_vrf_ordering	2022-06-03 22:32:55.223301-03
269	ipam	0022_tags	2022-06-03 22:32:55.228331-03
270	ipam	0023_change_logging	2022-06-03 22:32:55.233279-03
271	ipam	0024_vrf_allow_null_rd	2022-06-03 22:32:55.241937-03
272	ipam	0025_custom_tag_models	2022-06-03 22:32:55.247054-03
273	ipam	0026_prefix_ordering_vrf_nulls_first	2022-06-03 22:32:55.253802-03
274	ipam	0027_ipaddress_add_dns_name	2022-06-03 22:32:55.259117-03
275	ipam	0028_3569_prefix_fields	2022-06-03 22:32:55.264434-03
276	ipam	0029_3569_ipaddress_fields	2022-06-03 22:32:55.269421-03
277	ipam	0030_3569_vlan_fields	2022-06-03 22:32:55.273894-03
278	ipam	0031_3569_service_fields	2022-06-03 22:32:55.27866-03
279	ipam	0032_role_description	2022-06-03 22:32:55.283442-03
280	ipam	0033_deterministic_ordering	2022-06-03 22:32:55.288391-03
281	ipam	0034_fix_ipaddress_status_dhcp	2022-06-03 22:32:55.292405-03
282	ipam	0035_drop_ip_family	2022-06-03 22:32:55.297041-03
283	ipam	0036_standardize_description	2022-06-03 22:32:55.302684-03
284	ipam	0037_ipaddress_assignment	2022-06-03 22:32:55.307938-03
285	ipam	0038_custom_field_data	2022-06-03 22:32:55.312947-03
286	ipam	0039_service_ports_array	2022-06-03 22:32:55.317882-03
287	ipam	0040_service_drop_port	2022-06-03 22:32:55.323674-03
288	ipam	0041_routetarget	2022-06-03 22:32:55.330647-03
289	ipam	0042_standardize_name_length	2022-06-03 22:32:55.33665-03
290	ipam	0043_add_tenancy_to_aggregates	2022-06-03 22:32:55.341041-03
291	ipam	0044_standardize_models	2022-06-03 22:32:55.345381-03
292	ipam	0045_vlangroup_scope	2022-06-03 22:32:55.349865-03
293	ipam	0046_set_vlangroup_scope_types	2022-06-03 22:32:55.354739-03
294	ipam	0047_prefix_depth_children	2022-06-03 22:32:55.425385-03
295	ipam	0048_prefix_populate_depth_children	2022-06-03 22:32:55.474273-03
296	ipam	0049_prefix_mark_utilized	2022-06-03 22:32:55.511094-03
297	ipam	0050_iprange	2022-06-03 22:32:55.593867-03
298	ipam	0051_extend_tag_support	2022-06-03 22:32:55.831566-03
299	extras	0063_webhook_conditions	2022-06-03 22:32:55.853366-03
300	extras	0064_configrevision	2022-06-03 22:32:55.871864-03
301	ipam	0052_fhrpgroup	2022-06-03 22:32:56.058509-03
302	ipam	0053_asn_model	2022-06-03 22:32:56.250543-03
303	dcim	0131_consoleport_speed	2022-06-03 22:32:56.436883-03
304	dcim	0132_cable_length	2022-06-03 22:32:56.545596-03
305	dcim	0133_port_colors	2022-06-03 22:32:56.669235-03
306	dcim	0134_interface_wwn_bridge	2022-06-03 22:32:56.862651-03
307	dcim	0135_tenancy_extensions	2022-06-03 22:32:56.978936-03
308	dcim	0136_device_airflow	2022-06-03 22:32:57.059611-03
309	dcim	0137_relax_uniqueness_constraints	2022-06-03 22:32:57.637153-03
310	dcim	0138_extend_tag_support	2022-06-03 22:32:58.062459-03
311	dcim	0139_rename_cable_peer	2022-06-03 22:32:59.059221-03
312	wireless	0001_wireless	2022-06-03 22:32:59.371739-03
313	dcim	0140_wireless	2022-06-03 22:32:59.840052-03
314	dcim	0141_asn_model	2022-06-03 22:32:59.930683-03
315	dcim	0142_rename_128gfc_qsfp28	2022-06-03 22:33:00.095361-03
316	dcim	0143_remove_primary_for_related_name	2022-06-03 22:33:00.204154-03
317	dcim	0144_fix_cable_abs_length	2022-06-03 22:33:00.258506-03
318	dcim	0145_site_remove_deprecated_fields	2022-06-03 22:33:00.557592-03
319	ipam	0054_vlangroup_min_max_vids	2022-06-03 22:33:00.65608-03
320	virtualization	0023_virtualmachine_natural_ordering	2022-06-03 22:33:00.881799-03
321	virtualization	0024_cluster_relax_uniqueness	2022-06-03 22:33:00.991883-03
322	virtualization	0025_extend_tag_support	2022-06-03 22:33:01.093215-03
323	virtualization	0026_vminterface_bridge	2022-06-03 22:33:01.159642-03
324	extras	0065_imageattachment_change_logging	2022-06-03 22:33:01.182311-03
325	extras	0066_customfield_name_validation	2022-06-03 22:33:01.20432-03
326	extras	0067_customfield_min_max_values	2022-06-03 22:33:01.247343-03
327	extras	0068_configcontext_cluster_types	2022-06-03 22:33:01.460637-03
328	extras	0069_custom_object_field	2022-06-03 22:33:01.529837-03
329	extras	0070_customlink_enabled	2022-06-03 22:33:01.55164-03
330	ipam	0055_servicetemplate	2022-06-03 22:33:01.634316-03
331	ipam	0056_standardize_id_fields	2022-06-03 22:33:02.733087-03
332	ipam	0057_created_datetimefield	2022-06-03 22:33:04.08809-03
333	circuits	0001_initial	2022-06-03 22:33:04.239457-03
334	circuits	0002_auto_20160622_1821	2022-06-03 22:33:05.486598-03
335	circuits	0003_provider_32bit_asn_support	2022-06-03 22:33:05.491767-03
336	circuits	0004_circuit_add_tenant	2022-06-03 22:33:05.496614-03
337	circuits	0005_circuit_add_upstream_speed	2022-06-03 22:33:05.501321-03
338	circuits	0006_terminations	2022-06-03 22:33:05.506107-03
339	circuits	0007_circuit_add_description	2022-06-03 22:33:05.511507-03
340	circuits	0008_circuittermination_interface_protect_on_delete	2022-06-03 22:33:05.516519-03
341	circuits	0009_unicode_literals	2022-06-03 22:33:05.521317-03
342	circuits	0010_circuit_status	2022-06-03 22:33:05.526816-03
343	circuits	0011_tags	2022-06-03 22:33:05.532586-03
344	circuits	0012_change_logging	2022-06-03 22:33:05.538497-03
345	circuits	0013_cables	2022-06-03 22:33:05.544422-03
346	circuits	0014_circuittermination_description	2022-06-03 22:33:05.550295-03
347	circuits	0015_custom_tag_models	2022-06-03 22:33:05.556237-03
348	circuits	0016_3569_circuit_fields	2022-06-03 22:33:05.561514-03
349	circuits	0017_circuittype_description	2022-06-03 22:33:05.566406-03
350	circuits	0018_standardize_description	2022-06-03 22:33:05.572211-03
351	circuits	0019_nullbooleanfield_to_booleanfield	2022-06-03 22:33:05.578237-03
352	circuits	0020_custom_field_data	2022-06-03 22:33:05.584192-03
353	circuits	0021_cache_cable_peer	2022-06-03 22:33:05.59022-03
354	circuits	0022_cablepath	2022-06-03 22:33:05.596266-03
355	circuits	0023_circuittermination_port_speed_optional	2022-06-03 22:33:05.602246-03
356	circuits	0024_standardize_name_length	2022-06-03 22:33:05.608257-03
357	circuits	0025_standardize_models	2022-06-03 22:33:05.613353-03
358	circuits	0026_mark_connected	2022-06-03 22:33:05.618235-03
359	circuits	0027_providernetwork	2022-06-03 22:33:05.624018-03
360	circuits	0028_cache_circuit_terminations	2022-06-03 22:33:05.630047-03
361	circuits	0029_circuit_tracing	2022-06-03 22:33:05.636119-03
362	circuits	0003_extend_tag_support	2022-06-03 22:33:05.704213-03
363	circuits	0004_rename_cable_peer	2022-06-03 22:33:05.77973-03
364	circuits	0032_provider_service_id	2022-06-03 22:33:05.827092-03
365	circuits	0033_standardize_id_fields	2022-06-03 22:33:06.272959-03
366	circuits	0034_created_datetimefield	2022-06-03 22:33:06.81623-03
367	circuits	0035_provider_asns	2022-06-03 22:33:06.918027-03
368	dcim	0146_modules	2022-06-03 22:33:09.533512-03
369	dcim	0147_inventoryitemrole	2022-06-03 22:33:09.732756-03
370	dcim	0148_inventoryitem_component	2022-06-03 22:33:09.942366-03
371	dcim	0149_inventoryitem_templates	2022-06-03 22:33:10.072728-03
372	dcim	0150_interface_vrf	2022-06-03 22:33:10.151254-03
373	dcim	0151_interface_speed_duplex	2022-06-03 22:33:10.256738-03
374	dcim	0152_standardize_id_fields	2022-06-03 22:33:15.307588-03
375	dcim	0153_created_datetimefield	2022-06-03 22:33:19.682565-03
376	django_rq	0001_initial	2022-06-03 22:33:19.706144-03
377	extras	0071_standardize_id_fields	2022-06-03 22:33:20.365642-03
378	extras	0072_created_datetimefield	2022-06-03 22:33:20.933166-03
379	extras	0073_journalentry_tags_custom_fields	2022-06-03 22:33:21.033375-03
380	sessions	0001_initial	2022-06-03 22:33:21.070763-03
381	default	0001_initial	2022-06-03 22:33:21.254732-03
382	social_auth	0001_initial	2022-06-03 22:33:21.261215-03
383	default	0002_add_related_name	2022-06-03 22:33:21.335132-03
384	social_auth	0002_add_related_name	2022-06-03 22:33:21.336124-03
385	default	0003_alter_email_max_length	2022-06-03 22:33:21.344411-03
386	social_auth	0003_alter_email_max_length	2022-06-03 22:33:21.345581-03
387	default	0004_auto_20160423_0400	2022-06-03 22:33:21.35797-03
388	social_auth	0004_auto_20160423_0400	2022-06-03 22:33:21.359089-03
389	social_auth	0005_auto_20160727_2333	2022-06-03 22:33:21.372195-03
390	social_django	0006_partial	2022-06-03 22:33:21.410803-03
391	social_django	0007_code_timestamp	2022-06-03 22:33:21.432558-03
392	social_django	0008_partial_timestamp	2022-06-03 22:33:21.452057-03
393	social_django	0009_auto_20191118_0520	2022-06-03 22:33:21.483765-03
394	social_django	0010_uid_db_index	2022-06-03 22:33:21.506792-03
395	taggit	0001_initial	2022-06-03 22:33:21.768061-03
396	taggit	0002_auto_20150616_2121	2022-06-03 22:33:21.808644-03
397	taggit	0003_taggeditem_add_unique_index	2022-06-03 22:33:21.840214-03
398	taggit	0004_alter_taggeditem_content_type_alter_taggeditem_tag	2022-06-03 22:33:21.959896-03
399	tenancy	0005_standardize_id_fields	2022-06-03 22:33:22.432808-03
400	tenancy	0006_created_datetimefield	2022-06-03 22:33:23.09811-03
401	tenancy	0007_contact_link	2022-06-03 22:33:23.262652-03
402	users	0001_api_tokens	2022-06-03 22:33:23.614936-03
403	users	0002_unicode_literals	2022-06-03 22:33:23.623317-03
404	users	0003_token_permissions	2022-06-03 22:33:23.628111-03
405	users	0004_standardize_description	2022-06-03 22:33:23.632793-03
406	users	0005_userconfig	2022-06-03 22:33:23.637709-03
407	users	0006_create_userconfigs	2022-06-03 22:33:23.64347-03
408	users	0007_proxy_group_user	2022-06-03 22:33:23.649464-03
409	users	0008_objectpermission	2022-06-03 22:33:23.65489-03
410	users	0009_replicate_permissions	2022-06-03 22:33:23.659561-03
411	users	0010_update_jsonfield	2022-06-03 22:33:23.664089-03
412	users	0011_standardize_models	2022-06-03 22:33:23.66868-03
413	users	0002_standardize_id_fields	2022-06-03 22:33:23.750664-03
414	virtualization	0027_standardize_id_fields	2022-06-03 22:33:24.162406-03
415	virtualization	0028_vminterface_vrf	2022-06-03 22:33:24.348748-03
416	virtualization	0029_created_datetimefield	2022-06-03 22:33:24.897121-03
417	wireless	0002_standardize_id_fields	2022-06-03 22:33:25.206459-03
418	wireless	0003_created_datetimefield	2022-06-03 22:33:25.613857-03
419	social_django	0002_add_related_name	2022-06-03 22:33:25.631586-03
420	social_django	0004_auto_20160423_0400	2022-06-03 22:33:25.636477-03
421	social_django	0005_auto_20160727_2333	2022-06-03 22:33:25.639796-03
422	social_django	0003_alter_email_max_length	2022-06-03 22:33:25.64301-03
423	social_django	0001_initial	2022-06-03 22:33:25.646516-03
424	circuits	0002_squashed_0029	2022-06-03 22:33:25.649995-03
425	circuits	0001_squashed	2022-06-03 22:33:25.654095-03
426	dcim	0003_squashed_0130	2022-06-03 22:33:25.658843-03
427	dcim	0001_squashed	2022-06-03 22:33:25.66419-03
428	dcim	0002_squashed	2022-06-03 22:33:25.669532-03
429	ipam	0001_squashed	2022-06-03 22:33:25.674377-03
430	ipam	0002_squashed_0046	2022-06-03 22:33:25.681341-03
431	extras	0002_squashed_0059	2022-06-03 22:33:25.686748-03
432	extras	0001_squashed	2022-06-03 22:33:25.693492-03
433	tenancy	0001_squashed_0012	2022-06-03 22:33:25.698784-03
434	users	0001_squashed_0011	2022-06-03 22:33:25.704151-03
435	virtualization	0001_squashed_0022	2022-06-03 22:33:25.709526-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ak2bp598on6fbgngvzvqvhijijsispf8	.eJxVjEEKwyAQAP_iuQRXo9Ee-4H0B2FXV2JLDUQDhdK_N4Ee2uvMMC8x4dbmaau8TjmKswBx-mWE4c7lEIUbLc_uUFxaDtjyUrqRbhzalddHrnUHl2__N5mxzvshUZAUpddsQCbu1aDBGQLjFHnrjORBgVVGesSAvbY6OQmRGDyjZS3eHypqObM:1nxIhH:CVzS75CnX7Pu81ivKvr4jBa38QyUCvF-cocDmUNHCFM	2022-06-17 22:35:23.346561-03
\.


--
-- Data for Name: extras_configcontext; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext (created, last_updated, id, name, weight, description, is_active, data) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_cluster_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_cluster_groups (id, configcontext_id, clustergroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_cluster_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_cluster_types (id, configcontext_id, clustertype_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_clusters; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_clusters (id, configcontext_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_device_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_device_types (id, configcontext_id, devicetype_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_platforms; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_platforms (id, configcontext_id, platform_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_regions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_regions (id, configcontext_id, region_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_roles; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_roles (id, configcontext_id, devicerole_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_site_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_site_groups (id, configcontext_id, sitegroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_sites; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_sites (id, configcontext_id, site_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tags; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tags (id, configcontext_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenant_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenant_groups (id, configcontext_id, tenantgroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenants; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenants (id, configcontext_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: extras_configrevision; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configrevision (id, created, comment, data) FROM stdin;
\.


--
-- Data for Name: extras_customfield; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield (id, type, name, label, description, required, filter_logic, "default", weight, validation_minimum, validation_maximum, validation_regex, choices, created, last_updated, object_type_id) FROM stdin;
1	integer	port			f	loose	\N	100	1	65535		{}	2022-06-03 23:54:30.402849-03	2022-06-03 23:54:30.402862-03	\N
2	text	sw_version			f	loose	\N	100	\N	\N		{}	2022-06-03 23:55:02.028494-03	2022-06-03 23:55:02.028507-03	\N
4	text	sw_version_parser			f	loose	\N	100	\N	\N		{}	2022-06-04 02:36:41.789171-03	2022-06-04 02:36:41.789184-03	\N
5	text	command_soft_version			f	loose	\N	100	\N	\N		{}	2022-06-05 15:40:00.563303-03	2022-06-05 15:40:00.563316-03	\N
\.


--
-- Data for Name: extras_customfield_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield_content_types (id, customfield_id, contenttype_id) FROM stdin;
1	1	60
2	2	25
4	4	29
5	5	29
\.


--
-- Data for Name: extras_customlink; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customlink (id, name, link_text, link_url, weight, group_name, button_class, new_window, content_type_id, created, last_updated, enabled) FROM stdin;
\.


--
-- Data for Name: extras_exporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_exporttemplate (id, name, description, template_code, mime_type, file_extension, as_attachment, content_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_imageattachment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_imageattachment (id, object_id, image, image_height, image_width, name, created, content_type_id, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_jobresult; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_jobresult (id, name, created, completed, status, data, job_id, obj_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: extras_journalentry; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_journalentry (last_updated, id, assigned_object_id, created, kind, comments, assigned_object_type_id, created_by_id, custom_field_data) FROM stdin;
\.


--
-- Data for Name: extras_objectchange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_objectchange (id, "time", user_name, request_id, action, changed_object_id, related_object_id, object_repr, prechange_data, postchange_data, changed_object_type_id, related_object_type_id, user_id) FROM stdin;
1	2022-06-03 22:36:58.003085-03	netbox	76c6eafc-1dfc-49e1-8d61-dd068d365e7f	create	1	\N	Headquarters Guido Corporation	\N	{"asns": [], "name": "Headquarters Guido Corporation", "slug": "headquarters-guido-corporation", "tags": [], "group": null, "region": null, "status": "active", "tenant": null, "created": "2022-06-04T01:36:57.995Z", "comments": "", "facility": "", "latitude": null, "longitude": null, "time_zone": null, "description": "", "last_updated": "2022-06-04T01:36:57.995Z", "custom_fields": {}, "physical_address": "", "shipping_address": ""}	50	\N	1
2	2022-06-03 22:37:42.823251-03	netbox	1dd140d6-0e22-4617-b679-f6b6d6028c6d	create	1	\N	Noc tenant	\N	{"name": "Noc tenant", "slug": "NOC", "tags": [], "group": null, "created": "2022-06-04T01:37:42.820Z", "comments": "", "description": "", "last_updated": "2022-06-04T01:37:42.820Z", "custom_fields": {}}	89	\N	1
3	2022-06-03 22:39:21.816902-03	netbox	d714d716-bd30-4120-a901-a191a8133616	create	1	\N	L2-L3 Switch	\N	{"name": "L2-L3 Switch", "slug": "l2-l3-switch", "tags": [], "color": "9e9e9e", "created": "2022-06-04T01:39:21.815Z", "vm_role": false, "description": "", "last_updated": "2022-06-04T01:39:21.815Z", "custom_fields": {}}	28	\N	1
4	2022-06-03 22:39:56.229177-03	netbox	88018d08-60d8-47e0-bce9-e6b8883a6aa2	update	1	\N	Lan Core switch	{"name": "L2-L3 Switch", "slug": "l2-l3-switch", "tags": [], "color": "9e9e9e", "created": "2022-06-04T01:39:21.815Z", "vm_role": false, "description": "", "last_updated": "2022-06-04T01:39:21.815Z", "custom_fields": {}}	{"name": "Lan Core switch", "slug": "lan-core-switch", "tags": [], "color": "9e9e9e", "created": "2022-06-04T01:39:21.815Z", "vm_role": false, "description": "", "last_updated": "2022-06-04T01:39:56.227Z", "custom_fields": {}}	28	\N	1
5	2022-06-03 22:41:33.902517-03	netbox	4dfedf3e-6fa4-482f-babf-27eb1996d2c4	create	1	\N	Cisco	\N	{"name": "Cisco", "slug": "cisco", "tags": [], "created": "2022-06-04T01:41:33.900Z", "description": "", "last_updated": "2022-06-04T01:41:33.900Z", "custom_fields": {}}	36	\N	1
6	2022-06-03 22:42:14.259555-03	netbox	05136db5-c35c-42fc-88b0-63ee10a36aa5	create	1	\N	Cisco 9300	\N	{"slug": "cisco-9300", "tags": [], "model": "Cisco 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T01:42:14.257Z", "manufacturer": 1, "custom_fields": {}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
7	2022-06-03 22:42:28.676229-03	netbox	2ac08c15-de12-454b-95f6-89600e3c0f09	update	1	\N	Lan Access switch	{"name": "Lan Core switch", "slug": "lan-core-switch", "tags": [], "color": "9e9e9e", "created": "2022-06-04T01:39:21.815Z", "vm_role": false, "description": "", "last_updated": "2022-06-04T01:39:56.227Z", "custom_fields": {}}	{"name": "Lan Access switch", "slug": "lan-access-switch", "tags": [], "color": "9e9e9e", "created": "2022-06-04T01:39:21.815Z", "vm_role": false, "description": "", "last_updated": "2022-06-04T01:42:28.674Z", "custom_fields": {}}	28	\N	1
8	2022-06-03 22:43:18.641647-03	netbox	70561896-761c-404b-a7cd-e7655607392e	create	1	\N	Head-Lan001	\N	{"face": "", "name": "Head-Lan001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T01:43:18.638Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
9	2022-06-03 23:38:46.39425-03	netbox	bad4efcb-5a4a-4399-b9f1-27e5a7a5a6bd	create	1	\N	127.0.0.1/24	\N	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.1/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T02:38:46.387Z", "custom_fields": {}, "assigned_object_id": null, "assigned_object_type": null}	60	\N	1
10	2022-06-03 23:40:01.477721-03	netbox	12c37f39-657f-4195-a36f-3ab5b44d3560	update	1	\N	127.0.0.1/24	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.1/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T02:38:46.387Z", "custom_fields": {}, "assigned_object_id": null, "assigned_object_type": null}	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.1/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T02:40:01.476Z", "custom_fields": {}, "assigned_object_id": null, "assigned_object_type": null}	60	\N	1
11	2022-06-03 23:41:38.969672-03	netbox	e7093626-a2a5-48a2-81f7-2019fb60567c	update	1	\N	127.0.0.1/24	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.1/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T02:40:01.476Z", "custom_fields": {}, "assigned_object_id": null, "assigned_object_type": null}	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.1/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T02:41:38.967Z", "custom_fields": {}, "assigned_object_id": null, "assigned_object_type": null}	60	\N	1
12	2022-06-03 23:45:54.223581-03	netbox	767c20e1-6e0b-4c5c-8519-a1e0f5aadfcd	update	1	\N	HEAD-LAN001	{"face": "", "name": "Head-Lan001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T01:43:18.638Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T02:45:54.221Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
13	2022-06-03 23:48:45.476427-03	netbox	0fa590ae-f213-4e09-8139-4d14b9e7282d	create	1	1	Gi0/1/0	\N	{"lag": null, "mtu": null, "vrf": null, "wwn": "", "mode": "", "name": "Gi0/1/0", "tags": [], "type": "1000base-t", "cable": null, "label": "", "speed": null, "bridge": null, "device": 1, "duplex": "", "module": null, "parent": null, "created": "2022-06-04T02:48:45.460Z", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": "", "last_updated": "2022-06-04T02:48:45.460Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
14	2022-06-03 23:49:31.902508-03	netbox	24a9bdbb-6125-425e-bf2f-f696b3122739	update	1	1	127.0.0.1/24	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.1/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T02:41:38.967Z", "custom_fields": {}, "assigned_object_id": null, "assigned_object_type": null}	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.1/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T02:49:31.899Z", "custom_fields": {}, "assigned_object_id": 1, "assigned_object_type": 32}	60	32	1
15	2022-06-03 23:49:31.923515-03	netbox	24a9bdbb-6125-425e-bf2f-f696b3122739	update	1	\N	HEAD-LAN001	\N	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T02:49:31.920Z", "custom_fields": {}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
16	2022-06-03 23:54:30.404777-03	netbox	79de9081-56b9-4958-9d5b-1273ff0ecbd5	create	1	\N	Port	\N	{"name": "port", "type": "integer", "label": "", "weight": 100, "choices": "[]", "created": "2022-06-04T02:54:30.402Z", "default": null, "required": false, "description": "", "object_type": null, "filter_logic": "loose", "last_updated": "2022-06-04T02:54:30.402Z", "content_types": [60], "validation_regex": "", "validation_maximum": 65535, "validation_minimum": 1}	86	\N	1
17	2022-06-03 23:55:02.030144-03	netbox	2c5854e0-c264-4e4b-9dc2-c3ceac83d60b	create	2	\N	Sw version	\N	{"name": "sw_version", "type": "text", "label": "", "weight": 100, "choices": "[]", "created": "2022-06-04T02:55:02.028Z", "default": null, "required": false, "description": "", "object_type": null, "filter_logic": "loose", "last_updated": "2022-06-04T02:55:02.028Z", "content_types": [25], "validation_regex": "", "validation_maximum": null, "validation_minimum": null}	86	\N	1
18	2022-06-03 23:55:37.018827-03	netbox	dcd7dc4a-20e4-454f-958f-098254b54605	update	1	1	127.0.0.1/24	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.1/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T02:49:31.899Z", "custom_fields": {"port": null}, "assigned_object_id": 1, "assigned_object_type": 32}	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.1/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T02:55:37.017Z", "custom_fields": {"port": 3000}, "assigned_object_id": 1, "assigned_object_type": 32}	60	32	1
19	2022-06-03 23:55:37.02992-03	netbox	dcd7dc4a-20e4-454f-958f-098254b54605	update	1	\N	HEAD-LAN001	\N	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T02:55:37.028Z", "custom_fields": {"sw_version": null}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
20	2022-06-03 23:56:03.700666-03	netbox	44a0aaf4-71f9-45c7-bf2c-5ea341116a3e	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T02:55:37.028Z", "custom_fields": {"sw_version": null}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T02:56:03.699Z", "custom_fields": {"sw_version": "0.0.0"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
21	2022-06-03 23:57:27.149794-03	netbox	aaa5626a-fd9f-4d60-882c-96f10124318b	update	1	\N	NOC	{"name": "Noc tenant", "slug": "NOC", "tags": [], "group": null, "created": "2022-06-04T01:37:42.820Z", "comments": "", "description": "", "last_updated": "2022-06-04T01:37:42.820Z", "custom_fields": {}}	{"name": "NOC", "slug": "noc", "tags": [], "group": null, "created": "2022-06-04T01:37:42.820Z", "comments": "", "description": "", "last_updated": "2022-06-04T02:57:27.148Z", "custom_fields": {}}	89	\N	1
22	2022-06-04 00:54:58.113438-03	netbox	19552704-adc2-4d88-90ab-9a3c7c1c958d	update	1	1	127.0.0.3/24	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.1/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T02:55:37.017Z", "custom_fields": {"port": 3000}, "assigned_object_id": 1, "assigned_object_type": 32}	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.3/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T03:54:58.111Z", "custom_fields": {"port": 3000}, "assigned_object_id": 1, "assigned_object_type": 32}	60	32	1
23	2022-06-04 00:54:58.123992-03	netbox	19552704-adc2-4d88-90ab-9a3c7c1c958d	update	1	\N	HEAD-LAN001	\N	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T03:54:58.121Z", "custom_fields": {"sw_version": "0.0.0"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
24	2022-06-04 00:55:56.021531-03	netbox	d478f7c1-2545-4046-8ffe-ee348b815506	update	1	1	127.0.0.1/24	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.3/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T03:54:58.111Z", "custom_fields": {"port": 3000}, "assigned_object_id": 1, "assigned_object_type": 32}	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.1/24", "created": "2022-06-04T02:38:46.387Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T03:55:56.019Z", "custom_fields": {"port": 3001}, "assigned_object_id": 1, "assigned_object_type": 32}	60	32	1
25	2022-06-04 00:55:56.032273-03	netbox	d478f7c1-2545-4046-8ffe-ee348b815506	update	1	\N	HEAD-LAN001	\N	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T03:55:56.030Z", "custom_fields": {"sw_version": "0.0.0"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
26	2022-06-04 02:13:31.246456-03	netbox	7adffab1-c07e-4358-a0c2-40f1a61ccaf3	create	2	\N	HEAD-LAN002	\N	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T05:13:31.243Z", "custom_fields": {"sw_version": "0.0.0"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
27	2022-06-04 02:14:14.920417-03	netbox	fc604af7-4270-491c-897c-e8de220200dc	create	2	1	Gi1/2/1	\N	{"lag": null, "mtu": null, "vrf": null, "wwn": "", "mode": "", "name": "Gi1/2/1", "tags": [], "type": "1000base-t", "cable": null, "label": "", "speed": null, "bridge": null, "device": 1, "duplex": null, "module": null, "parent": null, "created": "2022-06-04T05:14:14.916Z", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-06-04T05:14:14.916Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
28	2022-06-04 02:14:45.729818-03	netbox	2983a254-bc63-4e96-9261-a967feb9ebcb	delete	2	1	Gi1/2/1	{"lag": null, "mtu": null, "vrf": null, "wwn": null, "mode": "", "name": "Gi1/2/1", "tags": [], "type": "1000base-t", "cable": null, "label": "", "speed": null, "bridge": null, "device": 1, "duplex": null, "module": null, "parent": null, "created": "2022-06-04T05:14:14.916Z", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-06-04T05:14:14.916Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	\N	32	25	1
29	2022-06-04 02:15:31.963659-03	netbox	f0d1aa85-ebce-4e31-b273-4805f93cc96c	create	3	1	Gi1/2/1	\N	{"lag": null, "mtu": null, "vrf": null, "wwn": "", "mode": "", "name": "Gi1/2/1", "tags": [], "type": "1000base-t", "cable": null, "label": "", "speed": null, "bridge": null, "device": 1, "duplex": null, "module": null, "parent": null, "created": "2022-06-04T05:15:31.960Z", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-06-04T05:15:31.960Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
30	2022-06-04 02:15:38.636803-03	netbox	6ab9a03b-e7f3-4bfe-aa4a-367c75b7061e	delete	3	1	Gi1/2/1	{"lag": null, "mtu": null, "vrf": null, "wwn": null, "mode": "", "name": "Gi1/2/1", "tags": [], "type": "1000base-t", "cable": null, "label": "", "speed": null, "bridge": null, "device": 1, "duplex": null, "module": null, "parent": null, "created": "2022-06-04T05:15:31.960Z", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": null, "last_updated": "2022-06-04T05:15:31.960Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	\N	32	25	1
31	2022-06-04 02:16:46.502596-03	netbox	3a8b11b7-701d-4773-9f78-20851a64def0	create	4	2	Gi1/2/1	\N	{"lag": null, "mtu": null, "vrf": null, "wwn": "", "mode": "", "name": "Gi1/2/1", "tags": [], "type": "1000base-t", "cable": null, "label": "", "speed": null, "bridge": null, "device": 2, "duplex": "", "module": null, "parent": null, "created": "2022-06-04T05:16:46.498Z", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": "", "last_updated": "2022-06-04T05:16:46.498Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
32	2022-06-04 02:17:26.522882-03	netbox	ff5c1aac-43ea-4808-9f24-3e93f260e544	create	2	4	127.0.0.2/24	\N	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.2/24", "created": "2022-06-04T05:17:26.521Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-04T05:17:26.521Z", "custom_fields": {"port": 3002}, "assigned_object_id": 4, "assigned_object_type": 32}	60	32	1
33	2022-06-04 02:17:26.534364-03	netbox	ff5c1aac-43ea-4808-9f24-3e93f260e544	update	2	\N	HEAD-LAN002	\N	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T05:17:26.532Z", "custom_fields": {"sw_version": "0.0.0"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
34	2022-06-04 02:28:08.528145-03	netbox	79a2dd2e-fcc3-44a6-9f5e-c33008fc4591	update	1	\N	Cisco Switch 9300	{"slug": "cisco-9300", "tags": [], "model": "Cisco 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T01:42:14.257Z", "manufacturer": 1, "custom_fields": {}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "cisco-switch-9300", "tags": [], "model": "Cisco Switch 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T05:28:08.526Z", "manufacturer": 1, "custom_fields": {}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
35	2022-06-04 02:28:57.88682-03	netbox	2160b2d7-b230-4e48-9dab-0586a0c3d16c	create	3	\N	Parser	\N	{"name": "parser", "type": "text", "label": "", "weight": 100, "choices": "[]", "created": "2022-06-04T05:28:57.885Z", "default": null, "required": false, "description": "", "object_type": null, "filter_logic": "loose", "last_updated": "2022-06-04T05:28:57.885Z", "content_types": [29], "validation_regex": "", "validation_maximum": null, "validation_minimum": null}	86	\N	1
36	2022-06-04 02:29:37.006442-03	netbox	9ce0e55d-b1fe-4f1b-a4c7-7b2c6c281b08	update	3	\N	Sw version printout parser	{"name": "parser", "type": "text", "label": "", "weight": 100, "choices": "[]", "created": "2022-06-04T05:28:57.885Z", "default": null, "required": false, "description": "", "object_type": null, "filter_logic": "loose", "last_updated": "2022-06-04T05:28:57.885Z", "content_types": [29], "validation_regex": "", "validation_maximum": null, "validation_minimum": null}	{"name": "sw_version_printout_parser", "type": "text", "label": "", "weight": 100, "choices": "[]", "created": "2022-06-04T05:28:57.885Z", "default": null, "required": false, "description": "", "object_type": null, "filter_logic": "loose", "last_updated": "2022-06-04T05:29:37.003Z", "content_types": [29], "validation_regex": "", "validation_maximum": null, "validation_minimum": null}	86	\N	1
37	2022-06-04 02:32:03.458458-03	netbox	0eb7313f-53bc-4032-89f6-e87ae58963a7	delete	3	\N	Sw version printout parser	{"name": "sw_version_printout_parser", "type": "text", "label": "", "weight": 100, "choices": "[]", "created": "2022-06-04T05:28:57.885Z", "default": null, "required": false, "description": "", "object_type": null, "filter_logic": "loose", "last_updated": "2022-06-04T05:29:37.003Z", "content_types": [29], "validation_regex": "", "validation_maximum": null, "validation_minimum": null}	\N	86	\N	1
38	2022-06-04 02:36:41.790697-03	netbox	62f0e421-bf02-409c-8012-97cce1b7b73c	create	4	\N	Sw version parser	\N	{"name": "sw_version_parser", "type": "text", "label": "", "weight": 100, "choices": "[]", "created": "2022-06-04T05:36:41.789Z", "default": null, "required": false, "description": "", "object_type": null, "filter_logic": "loose", "last_updated": "2022-06-04T05:36:41.789Z", "content_types": [29], "validation_regex": "", "validation_maximum": null, "validation_minimum": null}	86	\N	1
39	2022-06-04 02:37:13.971122-03	netbox	4d2a5ebc-1ace-4ca4-8fe6-7a1338d0d7a6	update	1	\N	Cisco Switch 9300	{"slug": "cisco-switch-9300", "tags": [], "model": "Cisco Switch 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T05:28:08.526Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": null}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "cisco-switch-9300", "tags": [], "model": "Cisco Switch 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T05:37:13.968Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "9k_cisco_sw_version_parser"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
40	2022-06-04 02:44:54.48956-03	netbox	6d9f3603-d084-4059-8f51-74ad9e95909a	update	1	\N	Cisco Switch 9300	{"slug": "cisco-switch-9300", "tags": [], "model": "Cisco Switch 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T05:37:13.968Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "9k_cisco_sw_version_parser"}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "cisco-switch-9300", "tags": [], "model": "Cisco Switch 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T05:44:54.487Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_9k_sw_version_parser"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
41	2022-06-04 03:20:58.395804-03	netbox	c4c4b319-7a67-424e-ac41-92f80935451d	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T03:55:56.030Z", "custom_fields": {"sw_version": "0.0.0"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T06:20:58.394Z", "custom_fields": {"sw_version": "1.1.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
42	2022-06-04 03:27:24.557512-03	netbox	682b0b49-ec6c-4df5-94e6-8999afdcbddd	update	1	\N	Cisco Switch 9300	{"slug": "cisco-switch-9300", "tags": [], "model": "Cisco Switch 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T05:44:54.487Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_9k_sw_version_parser"}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "cisco-switch-9300", "tags": [], "model": "Cisco Switch 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T06:27:24.556Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_9k_sw_version_parser"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
43	2022-06-04 03:27:24.826961-03	netbox	db863228-4523-40e2-b70d-e6fc9c7e4d59	update	1	\N	Cisco Switch 9300	{"slug": "cisco-switch-9300", "tags": [], "model": "Cisco Switch 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T06:27:24.556Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_9k_sw_version_parser"}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "cisco-switch-9300", "tags": [], "model": "Cisco Switch 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T06:27:24.826Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_9k_sw_version_parser"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
44	2022-06-04 03:28:42.233781-03	netbox	cae13bfc-3447-4108-a8e1-1a225d8e2faf	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T06:20:58.394Z", "custom_fields": {"sw_version": "1.1.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T06:28:42.232Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
45	2022-06-04 03:28:42.650532-03	netbox	3ce360c8-07f7-4c1d-a140-ddb243c7b4ab	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T05:17:26.532Z", "custom_fields": {"sw_version": "0.0.0"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T06:28:42.649Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
46	2022-06-04 13:09:19.069804-03	netbox	1a9caf40-192d-4624-afe8-5fa942c8b9dc	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T06:28:42.232Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:09:19.067Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
47	2022-06-04 13:09:19.361431-03	netbox	0950a869-f50c-4d4e-8c05-80f2869f7c4a	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T06:28:42.649Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:09:19.360Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
84	2022-06-05 01:10:55.910318-03	netbox	fe6cf788-03e4-4460-bc1d-90ff52aa8770	update	3	\N	HEAD-NEX001	\N	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:10:55.908Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
48	2022-06-04 13:10:06.261035-03	netbox	39f658b4-a297-4ff3-a1c8-a30f4859f1e3	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:09:19.067Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:10:06.260Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
49	2022-06-04 13:10:06.549946-03	netbox	8d903b52-f8d0-4971-b1dd-406d04880dd1	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:09:19.360Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:10:06.548Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
50	2022-06-04 13:10:24.802847-03	netbox	4cc50a1c-718f-4c6d-80be-8984431c0fb1	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:10:06.260Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:10:24.801Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
51	2022-06-04 13:10:25.10767-03	netbox	d47fdd7a-bcb1-4042-a98c-8d2531ed1828	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:10:06.548Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:10:25.106Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
52	2022-06-04 13:10:59.126866-03	netbox	eaead0da-34a4-45aa-8492-518aeb1fb3e3	create	2	\N	Office	\N	{"name": "Office", "slug": "office", "tags": [], "group": null, "created": "2022-06-04T16:10:59.124Z", "comments": "", "description": "", "last_updated": "2022-06-04T16:10:59.124Z", "custom_fields": {}}	89	\N	1
53	2022-06-04 13:11:24.636246-03	netbox	d6f56f6f-d66d-4e0e-8af8-1b38760db902	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:10:24.801Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 2, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:11:24.634Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
54	2022-06-04 13:11:32.990085-03	netbox	a6a182a1-272f-4842-8da7-3198ea5a1a76	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:10:25.106Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:11:32.989Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
55	2022-06-04 13:11:48.653677-03	netbox	bdec9a47-f9d0-4c5d-a9a9-ec9f0cab8fca	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 2, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:11:24.634Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:11:48.652Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
56	2022-06-04 13:12:12.373086-03	netbox	6c30fd75-6dd2-4245-ac50-144f699ebc76	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:11:48.652Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "offline", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:12:12.371Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
57	2022-06-04 13:13:05.625733-03	netbox	9717690a-476c-403c-805d-323df395c11c	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:11:32.989Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:13:05.624Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
58	2022-06-04 13:13:35.680396-03	netbox	d5bfe10f-f712-410d-99e6-76e86ac2b62b	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "offline", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:12:12.371Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:13:35.678Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
59	2022-06-04 13:13:41.612671-03	netbox	a002910a-ca96-4c4c-a948-8343423b5b3c	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:13:35.678Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:13:41.611Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
60	2022-06-04 13:13:41.913258-03	netbox	c567cc96-8515-4f26-be50-4ef66c17f2ac	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:13:05.624Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:13:41.912Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
61	2022-06-04 13:37:14.94049-03	netbox	fccc4b27-2d7b-4da5-b1c0-c3e7ef24b0a6	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:13:41.611Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:14.939Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
62	2022-06-04 13:37:15.227408-03	netbox	0d80d476-29b6-4ca8-a44f-a9ec4a6e9146	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:13:41.912Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:15.226Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
63	2022-06-04 13:37:35.871106-03	netbox	75e7691f-1f4a-443d-be22-ca524f9678dd	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:14.939Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:35.869Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
64	2022-06-04 13:37:36.159841-03	netbox	32ed0c9d-80ef-4d4a-8559-d3d207ff0cb5	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:15.226Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:36.158Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
65	2022-06-04 13:37:55.116396-03	netbox	3737d662-85cc-4ff6-ab22-ce81026a8d38	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:35.869Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:55.115Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
66	2022-06-04 13:37:55.411655-03	netbox	8d187a77-ae3f-4bed-9d6e-039f3894dda4	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:36.158Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:55.410Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
67	2022-06-04 13:38:11.868405-03	netbox	8075e748-b998-4d4d-8349-d55002a895e4	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:55.115Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "offline", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:38:11.865Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
68	2022-06-04 13:38:15.724753-03	netbox	6a2fe91c-4a18-453d-af8d-78d00c36ab6d	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:37:55.410Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:38:15.723Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
69	2022-06-05 00:45:55.079986-03	netbox	552a64e7-b62d-4ae5-9b7d-571e3f708fe3	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "offline", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:38:11.865Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T03:45:55.077Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
70	2022-06-05 00:46:33.673227-03	netbox	f498497a-511b-4507-8280-4b774468a280	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T03:45:55.077Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T03:46:33.671Z", "custom_fields": {"sw_version": "1.1.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
71	2022-06-05 00:46:48.222599-03	netbox	72afcdc8-c5d4-4221-9827-9c79d66d6850	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-04T16:38:15.723Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T03:46:48.220Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
72	2022-06-05 00:48:21.561071-03	netbox	68a65148-9cb5-4007-a671-7f772f266a20	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T03:46:33.671Z", "custom_fields": {"sw_version": "1.1.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T03:48:21.560Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
73	2022-06-05 00:48:21.880274-03	netbox	bc902d3f-631f-44cb-a41f-095a98cea475	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T03:46:48.220Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T03:48:21.879Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
74	2022-06-05 01:00:47.43923-03	netbox	731e1267-d7ee-4b07-9501-64618a5a4037	create	2	\N	NEXUS	\N	{"name": "NEXUS", "slug": "nexus", "tags": [], "color": "9e9e9e", "created": "2022-06-05T04:00:47.436Z", "vm_role": false, "description": "", "last_updated": "2022-06-05T04:00:47.436Z", "custom_fields": {}}	28	\N	1
75	2022-06-05 01:01:10.679624-03	netbox	d180cd40-d297-4a74-9743-cccd2d1c83c2	create	2	\N	NEXUS	\N	{"slug": "nexus", "tags": [], "model": "NEXUS", "airflow": "", "created": "2022-06-05T04:01:10.677Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T04:01:10.677Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": null}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
76	2022-06-05 01:01:49.74725-03	netbox	357e7daf-b257-451b-b80f-7355ab210229	create	3	\N	HEAD-NEX001	\N	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:01:49.743Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
77	2022-06-05 01:02:32.064624-03	netbox	708ab7ea-0f99-4477-b0a7-19af9d170c16	create	5	3	Gi0/0/1	\N	{"lag": null, "mtu": null, "vrf": null, "wwn": "", "mode": "", "name": "Gi0/0/1", "tags": [], "type": "1000base-t", "cable": null, "label": "", "speed": null, "bridge": null, "device": 3, "duplex": "", "module": null, "parent": null, "created": "2022-06-05T04:02:32.056Z", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": "", "last_updated": "2022-06-05T04:02:32.056Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
78	2022-06-05 01:03:02.934734-03	netbox	d1e1ff28-15bd-463c-9f04-d0a185bc3135	create	3	\N	127.0.0.3/24	\N	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.3/24", "created": "2022-06-05T04:03:02.918Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-05T04:03:02.918Z", "custom_fields": {"port": 3003}, "assigned_object_id": null, "assigned_object_type": null}	60	\N	1
79	2022-06-05 01:03:16.06282-03	netbox	8e8675f4-4f85-4390-b5ca-abe2e8d14622	update	3	5	127.0.0.3/24	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.3/24", "created": "2022-06-05T04:03:02.918Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-05T04:03:02.918Z", "custom_fields": {"port": 3003}, "assigned_object_id": null, "assigned_object_type": null}	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.3/24", "created": "2022-06-05T04:03:02.918Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-05T04:03:16.061Z", "custom_fields": {"port": 3003}, "assigned_object_id": 5, "assigned_object_type": 32}	60	32	1
80	2022-06-05 01:09:38.928269-03	netbox	890d5323-5146-4691-8dd8-be6145b9da1f	update	2	\N	NEXUS	{"slug": "nexus", "tags": [], "model": "NEXUS", "airflow": "", "created": "2022-06-05T04:01:10.677Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T04:01:10.677Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": null}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "nexus", "tags": [], "model": "NEXUS", "airflow": "", "created": "2022-06-05T04:01:10.677Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T04:09:38.926Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_NEXUS_sw_version_parser"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
81	2022-06-05 01:10:14.099758-03	netbox	a53b5d8e-1447-42bd-8b7f-365249639965	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T03:48:21.560Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:10:14.098Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
83	2022-06-05 01:10:55.900935-03	netbox	fe6cf788-03e4-4460-bc1d-90ff52aa8770	update	3	5	127.0.0.3/24	{"vrf": null, "role": "", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.3/24", "created": "2022-06-05T04:03:02.918Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-05T04:03:16.061Z", "custom_fields": {"port": 3003}, "assigned_object_id": 5, "assigned_object_type": 32}	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.3/24", "created": "2022-06-05T04:03:02.918Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-05T04:10:55.899Z", "custom_fields": {"port": 3003}, "assigned_object_id": 5, "assigned_object_type": 32}	60	32	1
82	2022-06-05 01:10:14.398389-03	netbox	873436c1-341c-49d8-baa5-1827fde88884	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T03:48:21.879Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:10:14.397Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
85	2022-06-05 01:11:13.047182-03	netbox	414bfa4d-8589-4c20-b50c-5b48a2b7926d	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:10:14.098Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:11:13.046Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
86	2022-06-05 01:11:13.366671-03	netbox	cc1b7db8-b9b3-42be-8e08-2e0ed21fa734	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:10:14.397Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:11:13.365Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
87	2022-06-05 01:11:13.669747-03	netbox	06cd3f8d-b70c-476b-a6c7-ee26e1b4961a	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:10:55.908Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:11:13.668Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
88	2022-06-05 01:12:06.311497-03	netbox	39ad2d09-1756-4f9a-a71e-b585f107feb8	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:11:13.668Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:12:06.309Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
89	2022-06-05 01:12:15.468492-03	netbox	ce3690d6-4460-487d-a7c6-c1d2cde9fa9f	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:11:13.046Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:12:15.467Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
90	2022-06-05 01:12:15.755989-03	netbox	12ce6252-4391-417b-b8dc-1ae64984ce2e	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:11:13.365Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:12:15.755Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
91	2022-06-05 01:12:16.046738-03	netbox	78eb3b92-9d1b-46c8-89b6-cf2256802095	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:12:06.309Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:12:16.045Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
92	2022-06-05 15:12:49.374428-03	netbox	a76f88ed-4f47-4dc2-a72e-585c3eb305ca	create	3	\N	Firewall	\N	{"name": "Firewall", "slug": "firewall", "tags": [], "color": "ff9800", "created": "2022-06-05T18:12:49.369Z", "vm_role": true, "description": "", "last_updated": "2022-06-05T18:12:49.369Z", "custom_fields": {}}	28	\N	1
93	2022-06-05 15:13:17.260049-03	netbox	6baba9a3-1878-4eae-9586-12e2c436c24d	create	3	\N	Cisco ASA	\N	{"slug": "cisco-asa", "tags": [], "model": "Cisco ASA", "airflow": "", "created": "2022-06-05T18:13:17.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:13:17.257Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_ASA_sw_version_parser"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
94	2022-06-05 15:13:58.252847-03	netbox	1f6d3bbd-683f-4259-81c8-670474949c20	create	4	\N	HEAD-SEC001	\N	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:13:58.251Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
95	2022-06-05 15:14:32.386458-03	netbox	d4fd14a0-39aa-429d-9ff6-308cf2b844c6	create	6	4	Gi0/1/2	\N	{"lag": null, "mtu": null, "vrf": null, "wwn": "", "mode": "", "name": "Gi0/1/2", "tags": [], "type": "1000base-t", "cable": null, "label": "", "speed": null, "bridge": null, "device": 4, "duplex": "", "module": null, "parent": null, "created": "2022-06-05T18:14:32.370Z", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": "", "last_updated": "2022-06-05T18:14:32.370Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
96	2022-06-05 15:15:22.607239-03	netbox	73e59a40-c1fa-4172-acd1-d1106eedb0b1	create	4	6	127.0.0.4/24	\N	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.4/24", "created": "2022-06-05T18:15:22.605Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-05T18:15:22.605Z", "custom_fields": {"port": 3004}, "assigned_object_id": 6, "assigned_object_type": 32}	60	32	1
97	2022-06-05 15:15:22.618845-03	netbox	73e59a40-c1fa-4172-acd1-d1106eedb0b1	update	4	\N	HEAD-SEC001	\N	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:15:22.616Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
98	2022-06-05 15:16:21.208519-03	netbox	9b6e887c-1853-4d5a-9b0a-d59dcf81c7a6	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:12:15.467Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:16:21.207Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
99	2022-06-05 15:16:21.49507-03	netbox	7a2af600-97e9-4637-8d95-fd0f730c88e7	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:12:15.755Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:16:21.494Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
100	2022-06-05 15:16:21.790017-03	netbox	1097db2b-147d-44d4-a8a6-fd706fe2ebc4	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T04:12:16.045Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:16:21.788Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
101	2022-06-05 15:16:52.059784-03	netbox	2fb41d23-7c71-4ed4-9243-631bb7745d04	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": null, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:15:22.616Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:16:52.057Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
102	2022-06-05 15:17:00.116815-03	netbox	4081683b-6709-4351-8c52-3f356ea815fd	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:16:21.207Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:17:00.115Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
113	2022-06-05 15:28:19.277636-03	netbox	ed3988b5-6362-4596-8c6a-a0f977354046	create	5	7	127.0.0.5/24	\N	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.5/24", "created": "2022-06-05T18:28:19.275Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-05T18:28:19.275Z", "custom_fields": {"port": 3005}, "assigned_object_id": 7, "assigned_object_type": 32}	60	32	1
103	2022-06-05 15:17:00.440025-03	netbox	35f7e3cc-9075-4636-9550-28620263c247	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:16:21.494Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:17:00.439Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
104	2022-06-05 15:17:00.707478-03	netbox	82442ca7-76b3-430b-a008-552a367ad9e8	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:16:21.788Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:17:00.706Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
105	2022-06-05 15:17:01.006075-03	netbox	fd5f868c-1f65-4728-9746-cb281eaa524f	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:16:52.057Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:17:01.005Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
106	2022-06-05 15:23:56.860967-03	netbox	6943be3c-65f4-4167-b1a5-c9a05b89dbf3	create	2	\N	Aruba	\N	{"name": "Aruba", "slug": "aruba", "tags": [], "created": "2022-06-05T18:23:56.858Z", "description": "", "last_updated": "2022-06-05T18:23:56.858Z", "custom_fields": {}}	36	\N	1
107	2022-06-05 15:24:18.261153-03	netbox	9b829a36-75d7-4903-8a4f-4ba13bf5ef52	create	4	\N	Wireless Lan Controller	\N	{"name": "Wireless Lan Controller", "slug": "wireless-lan-controller", "tags": [], "color": "9e9e9e", "created": "2022-06-05T18:24:18.259Z", "vm_role": true, "description": "", "last_updated": "2022-06-05T18:24:18.259Z", "custom_fields": {}}	28	\N	1
108	2022-06-05 15:24:32.422858-03	netbox	2c469f3c-4ceb-4830-a1c9-0ad5f6c92564	update	4	\N	Wireless Lan Controller	{"name": "Wireless Lan Controller", "slug": "wireless-lan-controller", "tags": [], "color": "9e9e9e", "created": "2022-06-05T18:24:18.259Z", "vm_role": true, "description": "", "last_updated": "2022-06-05T18:24:18.259Z", "custom_fields": {}}	{"name": "Wireless Lan Controller", "slug": "wireless-lan-controller", "tags": [], "color": "00bcd4", "created": "2022-06-05T18:24:18.259Z", "vm_role": false, "description": "", "last_updated": "2022-06-05T18:24:32.421Z", "custom_fields": {}}	28	\N	1
109	2022-06-05 15:24:55.739966-03	netbox	271f5679-3a45-4295-836d-dd542a89ee62	create	4	\N	7205	\N	{"slug": "7205", "tags": [], "model": "7205", "airflow": "", "created": "2022-06-05T18:24:55.738Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:24:55.738Z", "manufacturer": 2, "custom_fields": {"sw_version_parser": null}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
110	2022-06-05 15:25:40.053511-03	netbox	aa1cf5b3-e69d-45f4-a20c-46b2768721d3	update	4	\N	Controller 7205	{"slug": "7205", "tags": [], "model": "7205", "airflow": "", "created": "2022-06-05T18:24:55.738Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:24:55.738Z", "manufacturer": 2, "custom_fields": {"sw_version_parser": null}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "controller-7205", "tags": [], "model": "Controller 7205", "airflow": "", "created": "2022-06-05T18:24:55.738Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:25:40.051Z", "manufacturer": 2, "custom_fields": {"sw_version_parser": "Aruba_7205_sw_version_parser"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
111	2022-06-05 15:26:19.776927-03	netbox	73df71cf-7a4e-4c19-ab69-547c65be04a9	create	5	\N	HEAD-WLC001	\N	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:26:19.774Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
112	2022-06-05 15:27:40.188822-03	netbox	9bd9dd09-ad84-4151-8a29-1f916fd28eb2	create	7	5	INT0/7	\N	{"lag": null, "mtu": null, "vrf": null, "wwn": "", "mode": "", "name": "INT0/7", "tags": [], "type": "1000base-t", "cable": null, "label": "", "speed": null, "bridge": null, "device": 5, "duplex": "", "module": null, "parent": null, "created": "2022-06-05T18:27:40.184Z", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": "", "last_updated": "2022-06-05T18:27:40.184Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
114	2022-06-05 15:28:19.288074-03	netbox	ed3988b5-6362-4596-8c6a-a0f977354046	update	5	\N	HEAD-WLC001	\N	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:28:19.286Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
115	2022-06-05 15:37:06.532718-03	netbox	add5537e-72f7-47d2-ab7e-b15c0fa2be45	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:17:00.115Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:37:06.531Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
116	2022-06-05 15:37:06.81898-03	netbox	7c1407f1-5e92-4a44-95c3-4c4c1fc6e24a	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:17:00.439Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:37:06.817Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
117	2022-06-05 15:37:07.113823-03	netbox	b00e4abd-f944-4641-b412-2ae5e043516b	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:17:00.706Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:37:07.112Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
118	2022-06-05 15:37:07.38142-03	netbox	e8877fd3-7b42-487d-a12a-6697e8fb098f	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:17:01.005Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:37:07.380Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
119	2022-06-05 15:37:07.651791-03	netbox	48d09158-073d-426c-8731-84cba792b317	update	5	\N	HEAD-WLC001	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:28:19.286Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:37:07.650Z", "custom_fields": {"sw_version": "0.0.0"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
120	2022-06-05 15:40:00.564909-03	netbox	22c86fef-593b-4f5e-bb5d-3284db1d61ed	create	5	\N	Command soft version	\N	{"name": "command_soft_version", "type": "text", "label": "", "weight": 100, "choices": "[]", "created": "2022-06-05T18:40:00.563Z", "default": null, "required": false, "description": "", "object_type": null, "filter_logic": "loose", "last_updated": "2022-06-05T18:40:00.563Z", "content_types": [29], "validation_regex": "", "validation_maximum": null, "validation_minimum": null}	86	\N	1
121	2022-06-05 15:40:48.909974-03	netbox	9331da4c-e8b6-4143-b9ec-553a863ca518	update	4	\N	Controller 7205	{"slug": "controller-7205", "tags": [], "model": "Controller 7205", "airflow": "", "created": "2022-06-05T18:24:55.738Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:25:40.051Z", "manufacturer": 2, "custom_fields": {"sw_version_parser": "Aruba_7205_sw_version_parser", "command_soft_version": null}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "controller-7205", "tags": [], "model": "Controller 7205", "airflow": "", "created": "2022-06-05T18:24:55.738Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:40:48.908Z", "manufacturer": 2, "custom_fields": {"sw_version_parser": "Aruba_7205_sw_version_parser", "command_soft_version": "show version"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
122	2022-06-05 15:40:48.921566-03	netbox	9331da4c-e8b6-4143-b9ec-553a863ca518	update	3	\N	Cisco ASA	{"slug": "cisco-asa", "tags": [], "model": "Cisco ASA", "airflow": "", "created": "2022-06-05T18:13:17.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:13:17.257Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_ASA_sw_version_parser", "command_soft_version": null}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "cisco-asa", "tags": [], "model": "Cisco ASA", "airflow": "", "created": "2022-06-05T18:13:17.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:40:48.920Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_ASA_sw_version_parser", "command_soft_version": "show version"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
123	2022-06-05 15:40:48.933101-03	netbox	9331da4c-e8b6-4143-b9ec-553a863ca518	update	1	\N	Cisco Switch 9300	{"slug": "cisco-switch-9300", "tags": [], "model": "Cisco Switch 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-04T06:27:24.826Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_9k_sw_version_parser", "command_soft_version": null}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "cisco-switch-9300", "tags": [], "model": "Cisco Switch 9300", "airflow": "", "created": "2022-06-04T01:42:14.257Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:40:48.931Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_9k_sw_version_parser", "command_soft_version": "show version"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
124	2022-06-05 15:40:48.942706-03	netbox	9331da4c-e8b6-4143-b9ec-553a863ca518	update	2	\N	NEXUS	{"slug": "nexus", "tags": [], "model": "NEXUS", "airflow": "", "created": "2022-06-05T04:01:10.677Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T04:09:38.926Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_NEXUS_sw_version_parser", "command_soft_version": null}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "nexus", "tags": [], "model": "NEXUS", "airflow": "", "created": "2022-06-05T04:01:10.677Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:40:48.941Z", "manufacturer": 1, "custom_fields": {"sw_version_parser": "Cisco_NEXUS_sw_version_parser", "command_soft_version": "show version"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
125	2022-06-05 15:41:04.862576-03	netbox	6ca30075-c995-48f7-b860-934d05c3a7c1	update	4	\N	Controller 7205	{"slug": "controller-7205", "tags": [], "model": "Controller 7205", "airflow": "", "created": "2022-06-05T18:24:55.738Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:40:48.908Z", "manufacturer": 2, "custom_fields": {"sw_version_parser": "Aruba_7205_sw_version_parser", "command_soft_version": "show version"}, "is_full_depth": true, "subdevice_role": ""}	{"slug": "controller-7205", "tags": [], "model": "Controller 7205", "airflow": "", "created": "2022-06-05T18:24:55.738Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T18:41:04.860Z", "manufacturer": 2, "custom_fields": {"sw_version_parser": "Aruba_7205_sw_version_parser", "command_soft_version": "show image version"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
126	2022-06-05 15:42:27.62355-03	netbox	25723e27-f5bc-4ebb-a367-98fdb068015a	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:37:06.531Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:42:27.622Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
127	2022-06-05 15:42:27.918303-03	netbox	f93a1711-1b34-4569-a282-671be3707a71	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:37:06.817Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:42:27.917Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
128	2022-06-05 15:42:28.219492-03	netbox	83f9215d-9750-47fc-88f8-94164ca87a33	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:37:07.112Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:42:28.218Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
129	2022-06-05 15:42:28.494232-03	netbox	daa588a6-1728-4798-aed4-d410d3528672	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:37:07.380Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:42:28.493Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
130	2022-06-05 15:42:28.766556-03	netbox	4bcc077f-8ee2-46f4-95c8-45c24423f8d9	update	5	\N	HEAD-WLC001	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:37:07.650Z", "custom_fields": {"sw_version": "0.0.0"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:42:28.765Z", "custom_fields": {"sw_version": "8.0.0.0-svcs-ctrl"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
131	2022-06-05 15:43:03.857825-03	netbox	1632a069-2c4d-4779-ad2b-9d6e5b46584d	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:42:27.622Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:03.856Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
132	2022-06-05 15:43:03.876105-03	netbox	1632a069-2c4d-4779-ad2b-9d6e5b46584d	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:42:27.917Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:03.874Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
133	2022-06-05 15:43:03.892937-03	netbox	1632a069-2c4d-4779-ad2b-9d6e5b46584d	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:42:28.218Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:03.891Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
134	2022-06-05 15:43:03.910281-03	netbox	1632a069-2c4d-4779-ad2b-9d6e5b46584d	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:42:28.493Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:03.908Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
135	2022-06-05 15:43:03.927204-03	netbox	1632a069-2c4d-4779-ad2b-9d6e5b46584d	update	5	\N	HEAD-WLC001	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:42:28.765Z", "custom_fields": {"sw_version": "8.0.0.0-svcs-ctrl"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:03.925Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
136	2022-06-05 15:43:10.704243-03	netbox	3a75db9e-3806-400d-a4c7-8b14cb306787	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:03.856Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:10.703Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
137	2022-06-05 15:43:10.991721-03	netbox	5454482d-8fb8-4a7a-b78b-2ee3e9854c08	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:03.874Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:10.990Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
138	2022-06-05 15:43:11.398719-03	netbox	b3ebe54f-3945-4b72-bf2c-39421658ff25	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:03.891Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:11.397Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
139	2022-06-05 15:43:11.702834-03	netbox	63fb6638-f244-4e21-9953-7ba1e4786142	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:03.908Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:11.701Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
140	2022-06-05 15:43:11.973849-03	netbox	339a2b6f-3a8d-451b-9c92-d4b96cdb14f8	update	5	\N	HEAD-WLC001	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:03.925Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:11.972Z", "custom_fields": {"sw_version": "8.0.0.0-svcs-ctrl"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
141	2022-06-05 16:39:59.850344-03	netbox	797915e8-7c05-4417-9bc2-3358b9b5970f	create	3	\N	Palo Alto	\N	{"name": "Palo Alto", "slug": "palo-alto", "tags": [], "created": "2022-06-05T19:39:59.840Z", "description": "", "last_updated": "2022-06-05T19:39:59.840Z", "custom_fields": {}}	36	\N	1
142	2022-06-05 16:41:48.075162-03	netbox	8f023624-03f8-448a-a1a4-2488346278b7	create	5	\N	PA-5420	\N	{"slug": "pa-5420", "tags": [], "model": "PA-5420", "airflow": "", "created": "2022-06-05T19:41:48.073Z", "comments": "", "u_height": 1, "rear_image": "", "front_image": "", "part_number": "", "last_updated": "2022-06-05T19:41:48.073Z", "manufacturer": 3, "custom_fields": {"sw_version_parser": "PaloAlto_sw_version_parser", "command_soft_version": "show system info"}, "is_full_depth": true, "subdevice_role": ""}	29	\N	1
143	2022-06-05 16:42:27.984628-03	netbox	223d4a43-0b82-4b6a-acf9-e0bde68ffbe9	create	6	\N	HEAD-SEC002	\N	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:42:27.980Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
144	2022-06-05 16:43:07.212449-03	netbox	410e4a36-b5e6-4adf-925e-574636cb2586	create	8	6	INT-1	\N	{"lag": null, "mtu": null, "vrf": null, "wwn": "", "mode": "", "name": "INT-1", "tags": [], "type": "1000base-t", "cable": null, "label": "", "speed": null, "bridge": null, "device": 6, "duplex": "", "module": null, "parent": null, "created": "2022-06-05T19:43:07.203Z", "enabled": true, "rf_role": "", "tx_power": null, "mgmt_only": false, "rf_channel": "", "description": "", "mac_address": "", "last_updated": "2022-06-05T19:43:07.203Z", "tagged_vlans": [], "custom_fields": {}, "untagged_vlan": null, "wireless_lans": [], "wireless_link": null, "mark_connected": false, "rf_channel_width": null, "rf_channel_frequency": null}	32	25	1
145	2022-06-05 16:43:42.37021-03	netbox	00eff553-395b-4b4e-97dc-86ef8f744c78	create	6	8	127.0.0.6/24	\N	{"vrf": null, "role": "loopback", "tags": [], "status": "active", "tenant": 1, "address": "127.0.0.6/24", "created": "2022-06-05T19:43:42.368Z", "dns_name": "", "nat_inside": null, "description": "", "last_updated": "2022-06-05T19:43:42.368Z", "custom_fields": {"port": 3006}, "assigned_object_id": 8, "assigned_object_type": 32}	60	32	1
146	2022-06-05 16:43:42.384455-03	netbox	00eff553-395b-4b4e-97dc-86ef8f744c78	update	6	\N	HEAD-SEC002	\N	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:43:42.382Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
147	2022-06-05 16:44:30.119167-03	netbox	9d335faf-8275-4df5-ab95-88f147671bb3	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:10.703Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.117Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
148	2022-06-05 16:44:30.137872-03	netbox	9d335faf-8275-4df5-ab95-88f147671bb3	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:10.990Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.136Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
149	2022-06-05 16:44:30.155731-03	netbox	9d335faf-8275-4df5-ab95-88f147671bb3	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:11.397Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.154Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
150	2022-06-05 16:44:30.173942-03	netbox	9d335faf-8275-4df5-ab95-88f147671bb3	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:11.701Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.172Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
151	2022-06-05 16:44:30.191732-03	netbox	9d335faf-8275-4df5-ab95-88f147671bb3	update	6	\N	HEAD-SEC002	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:43:42.382Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.190Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
152	2022-06-05 16:44:30.208376-03	netbox	9d335faf-8275-4df5-ab95-88f147671bb3	update	5	\N	HEAD-WLC001	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T18:43:11.972Z", "custom_fields": {"sw_version": "8.0.0.0-svcs-ctrl"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.206Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
153	2022-06-05 16:45:30.878534-03	netbox	0a6e1269-2f4e-485c-86a9-0aba94ba01c6	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.117Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:30.877Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
154	2022-06-05 16:45:31.167689-03	netbox	7a3e0e09-b34f-460b-bc14-4e575127774d	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.136Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:31.166Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
155	2022-06-05 16:45:31.45292-03	netbox	edfb4c41-410c-42d7-9196-550acf32ec79	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.154Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:31.451Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
156	2022-06-05 16:45:31.719835-03	netbox	6bbbcc6f-c760-4fb8-8d5a-5ba8c1632418	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.172Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:31.718Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
157	2022-06-05 16:45:32.015783-03	netbox	61c50250-ad26-4e9d-8458-18a03a27730e	update	6	\N	HEAD-SEC002	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.190Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:32.014Z", "custom_fields": {"sw_version": "8.0.4"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
158	2022-06-05 16:45:32.295325-03	netbox	95b3b40d-bf81-4bf5-b37b-e3df1ce16403	update	5	\N	HEAD-WLC001	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:44:30.206Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:32.294Z", "custom_fields": {"sw_version": "8.0.0.0-svcs-ctrl"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
159	2022-06-05 16:58:39.665144-03	netbox	36499938-5265-449b-b06b-0bca48d82bb8	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:30.877Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:39.664Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
160	2022-06-05 16:58:39.961779-03	netbox	bea02bfe-da08-43e7-a8f7-107d80d1fc7a	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:31.166Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:39.960Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
161	2022-06-05 16:58:40.234498-03	netbox	0a035e97-49c4-410c-8edf-86389cde39b0	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:31.451Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:40.233Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
162	2022-06-05 16:58:40.50844-03	netbox	33f37ca7-8011-4195-980a-3c2e4840d978	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:31.718Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:40.507Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
163	2022-06-05 16:58:40.912419-03	netbox	3865a146-a2b3-4817-8d0e-770bbe4c1613	update	6	\N	HEAD-SEC002	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:32.014Z", "custom_fields": {"sw_version": "8.0.4"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:40.911Z", "custom_fields": {"sw_version": "8.0.4"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
164	2022-06-05 16:58:41.190172-03	netbox	68bb34db-60c2-45f6-9516-c7d1d8f38737	update	5	\N	HEAD-WLC001	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:45:32.294Z", "custom_fields": {"sw_version": "8.0.0.0-svcs-ctrl"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:41.189Z", "custom_fields": {"sw_version": "8.0.0.0-svcs-ctrl"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
165	2022-06-05 17:36:38.935872-03	netbox	9dad034d-71e8-4855-85b7-b5d0d97247f4	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:39.664Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:36:38.932Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
166	2022-06-05 17:36:47.590852-03	netbox	4d72ba5e-626b-4f57-a941-e6524be0362e	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:36:38.932Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:36:47.589Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
167	2022-06-05 17:36:48.346461-03	netbox	ee9b86e2-105e-4128-8be9-fac35e5fd475	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:40.507Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:36:48.345Z", "custom_fields": {"sw_version": "0.0.0"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
168	2022-06-05 17:38:11.480366-03	netbox	43e19bef-bef7-4757-ab39-ae93ca264c28	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:36:47.589Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:38:11.478Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
169	2022-06-05 17:38:19.203431-03	netbox	c8ba06a4-5160-4157-a492-b358d9889a9f	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:38:11.478Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:38:19.202Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
170	2022-06-05 17:41:21.593885-03	netbox	e06a5d69-90d9-4c14-969e-6b314831bac7	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:38:19.202Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:41:21.590Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
171	2022-06-05 17:41:33.776965-03	netbox	93e6c5e0-a48a-494d-952f-724ba23a044b	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:41:21.590Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:41:33.775Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
172	2022-06-05 17:41:34.49863-03	netbox	d8d72b32-6fa2-4d6d-86f6-875f09703087	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:36:48.345Z", "custom_fields": {"sw_version": "0.0.0"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:41:34.497Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
173	2022-06-05 17:43:43.079494-03	netbox	050d3e52-49b9-423a-8a86-1bd9bb136052	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:41:33.775Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:43:43.076Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
174	2022-06-05 17:43:51.123206-03	netbox	64d878cc-f65f-4e64-95a6-a31fcd00e409	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:43:43.076Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:43:51.122Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
175	2022-06-05 17:45:08.615556-03	netbox	ff064640-c424-4e52-abcb-f1acd279e473	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:43:51.122Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:45:08.614Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
176	2022-06-05 17:45:14.088114-03	netbox	fdaad2f3-a633-4f91-b4f9-52849603e0e0	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:45:08.614Z", "custom_fields": {"sw_version": "1.2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:45:14.087Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
177	2022-06-05 17:47:07.74478-03	netbox	fc21aa6f-596d-4ce1-8ffa-41b136457720	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:45:14.087Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:47:07.742Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
178	2022-06-05 17:47:44.331688-03	netbox	903d8cf2-342e-41a7-a130-7e82b51a913f	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:47:07.742Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:47:44.330Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
179	2022-06-05 17:48:44.311034-03	netbox	df285851-50f3-440d-893f-9e9dd2fe66d9	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:47:44.330Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:48:44.309Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
180	2022-06-05 17:48:53.614503-03	netbox	3e68ddc2-c393-4527-8f6f-c224f420f4a5	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:48:44.309Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:48:53.613Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
181	2022-06-05 17:50:22.987755-03	netbox	2dde3dea-3075-48f2-a0b0-861ca49150c7	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:48:53.613Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:22.985Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
182	2022-06-05 17:50:23.006847-03	netbox	2dde3dea-3075-48f2-a0b0-861ca49150c7	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:39.960Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:23.005Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
183	2022-06-05 17:50:23.024559-03	netbox	2dde3dea-3075-48f2-a0b0-861ca49150c7	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:40.233Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:23.022Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
184	2022-06-05 17:50:47.527983-03	netbox	050535fa-98e5-4c0e-9f8c-7b97ddf2948b	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:22.985Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:47.527Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
185	2022-06-05 17:50:47.84581-03	netbox	8b45f99d-9b5e-4fb2-9cd7-0db4e0bc3e6d	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:23.005Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:47.844Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
186	2022-06-05 17:50:48.135532-03	netbox	d6ff3b9f-0038-4088-be3d-c1a48e806ae6	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:23.022Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:48.134Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
187	2022-06-05 17:53:07.037231-03	netbox	283f38da-aac7-45f4-825f-c4e65ebad2c8	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:47.527Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.035Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
188	2022-06-05 17:53:07.05701-03	netbox	283f38da-aac7-45f4-825f-c4e65ebad2c8	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:47.844Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.055Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
189	2022-06-05 17:53:07.077891-03	netbox	283f38da-aac7-45f4-825f-c4e65ebad2c8	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:50:48.134Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.074Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
190	2022-06-05 17:53:07.094963-03	netbox	283f38da-aac7-45f4-825f-c4e65ebad2c8	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:41:34.497Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.092Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
191	2022-06-05 17:53:07.112623-03	netbox	283f38da-aac7-45f4-825f-c4e65ebad2c8	update	6	\N	HEAD-SEC002	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:40.911Z", "custom_fields": {"sw_version": "8.0.4"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.111Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
192	2022-06-05 17:53:07.129684-03	netbox	283f38da-aac7-45f4-825f-c4e65ebad2c8	update	5	\N	HEAD-WLC001	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T19:58:41.189Z", "custom_fields": {"sw_version": "8.0.0.0-svcs-ctrl"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.128Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
193	2022-06-05 17:53:12.973503-03	netbox	42c68136-b6b7-4221-9a8b-ecc0628ddda5	update	1	\N	HEAD-LAN001	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.035Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T01:43:18.638Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 1, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:12.969Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
194	2022-06-05 17:53:13.275666-03	netbox	97dafbd0-900e-491a-b68c-c47632ec6d61	update	2	\N	HEAD-LAN002	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.055Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-LAN002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-04T05:13:31.243Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": 2, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:13.274Z", "custom_fields": {"sw_version": "16.10.1"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
195	2022-06-05 17:53:13.591735-03	netbox	2b22edf1-d11d-4b41-a3c4-d8e429d44ca9	update	3	\N	HEAD-NEX001	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.074Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-NEX001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T04:01:49.742Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 2, "primary_ip4": 3, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:13.590Z", "custom_fields": {"sw_version": "5.0(2)N2(1)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
196	2022-06-05 17:53:13.869479-03	netbox	a79eac13-b565-490d-a69d-755ce42ca5da	update	4	\N	HEAD-SEC001	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.092Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:13:58.251Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": 4, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:13.868Z", "custom_fields": {"sw_version": "9.8(2)"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
197	2022-06-05 17:53:14.17482-03	netbox	bcf37f70-c1ba-457a-a24e-aa06c1ce22bc	update	6	\N	HEAD-SEC002	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.111Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-SEC002", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T19:42:27.980Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 5, "primary_ip4": 6, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:14.173Z", "custom_fields": {"sw_version": "8.0.4"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
198	2022-06-05 17:53:14.451485-03	netbox	1d1bd534-494b-433e-9dd7-82dc92e4881e	update	5	\N	HEAD-WLC001	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:07.128Z", "custom_fields": {"sw_version": "1,2n"}, "virtual_chassis": null, "local_context_data": null}	{"face": "", "name": "HEAD-WLC001", "rack": null, "site": 1, "tags": [], "serial": "", "status": "active", "tenant": 1, "airflow": "", "cluster": null, "created": "2022-06-05T18:26:19.774Z", "comments": "", "location": null, "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 4, "primary_ip4": 5, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2022-06-05T20:53:14.450Z", "custom_fields": {"sw_version": "8.0.0.0-svcs-ctrl"}, "virtual_chassis": null, "local_context_data": null}	25	\N	1
\.


--
-- Data for Name: extras_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_tag (name, slug, created, last_updated, id, color, description) FROM stdin;
\.


--
-- Data for Name: extras_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_taggeditem (object_id, id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_webhook; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook (id, name, type_create, type_update, type_delete, payload_url, enabled, http_method, http_content_type, additional_headers, body_template, secret, ssl_verification, ca_file_path, created, last_updated, conditions) FROM stdin;
\.


--
-- Data for Name: extras_webhook_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook_content_types (id, webhook_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: ipam_aggregate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_aggregate (created, last_updated, custom_field_data, id, prefix, date_added, description, rir_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_asn; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_asn (created, last_updated, custom_field_data, id, asn, description, rir_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_fhrpgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_fhrpgroup (created, last_updated, custom_field_data, id, group_id, protocol, auth_type, auth_key, description) FROM stdin;
\.


--
-- Data for Name: ipam_fhrpgroupassignment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_fhrpgroupassignment (created, last_updated, id, interface_id, priority, group_id, interface_type_id) FROM stdin;
\.


--
-- Data for Name: ipam_ipaddress; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_ipaddress (created, last_updated, custom_field_data, id, address, status, role, assigned_object_id, dns_name, description, assigned_object_type_id, nat_inside_id, tenant_id, vrf_id) FROM stdin;
2022-06-03 23:38:46.387042-03	2022-06-04 00:55:56.019878-03	{"port": 3001}	1	127.0.0.1/24	active	loopback	1			32	\N	1	\N
2022-06-04 02:17:26.521276-03	2022-06-04 02:17:26.521287-03	{"port": 3002}	2	127.0.0.2/24	active	loopback	4			32	\N	1	\N
2022-06-05 01:03:02.918026-03	2022-06-05 01:10:55.899351-03	{"port": 3003}	3	127.0.0.3/24	active	loopback	5			32	\N	1	\N
2022-06-05 15:15:22.605533-03	2022-06-05 15:15:22.605544-03	{"port": 3004}	4	127.0.0.4/24	active	loopback	6			32	\N	1	\N
2022-06-05 15:28:19.275746-03	2022-06-05 15:28:19.275769-03	{"port": 3005}	5	127.0.0.5/24	active	loopback	7			32	\N	1	\N
2022-06-05 16:43:42.368199-03	2022-06-05 16:43:42.368212-03	{"port": 3006}	6	127.0.0.6/24	active	loopback	8			32	\N	1	\N
\.


--
-- Data for Name: ipam_iprange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_iprange (created, last_updated, custom_field_data, id, start_address, end_address, size, status, description, role_id, tenant_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: ipam_prefix; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_prefix (created, last_updated, custom_field_data, id, prefix, status, is_pool, description, role_id, site_id, tenant_id, vlan_id, vrf_id, _children, _depth, mark_utilized) FROM stdin;
\.


--
-- Data for Name: ipam_rir; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_rir (created, last_updated, custom_field_data, id, name, slug, is_private, description) FROM stdin;
\.


--
-- Data for Name: ipam_role; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_role (created, last_updated, custom_field_data, id, name, slug, weight, description) FROM stdin;
\.


--
-- Data for Name: ipam_routetarget; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_routetarget (created, last_updated, custom_field_data, id, name, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_service; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service (created, last_updated, custom_field_data, id, name, protocol, ports, description, device_id, virtual_machine_id) FROM stdin;
\.


--
-- Data for Name: ipam_service_ipaddresses; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service_ipaddresses (id, service_id, ipaddress_id) FROM stdin;
\.


--
-- Data for Name: ipam_servicetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_servicetemplate (created, last_updated, custom_field_data, id, protocol, ports, description, name) FROM stdin;
\.


--
-- Data for Name: ipam_vlan; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlan (created, last_updated, custom_field_data, id, vid, name, status, description, group_id, role_id, site_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlangroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlangroup (created, last_updated, custom_field_data, id, name, slug, scope_id, description, scope_type_id, max_vid, min_vid) FROM stdin;
\.


--
-- Data for Name: ipam_vrf; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf (created, last_updated, custom_field_data, id, name, rd, enforce_unique, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_export_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_export_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_import_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_import_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: tenancy_contact; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contact (created, last_updated, custom_field_data, id, name, title, phone, email, address, comments, group_id, link) FROM stdin;
\.


--
-- Data for Name: tenancy_contactassignment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contactassignment (created, last_updated, id, object_id, priority, contact_id, content_type_id, role_id) FROM stdin;
\.


--
-- Data for Name: tenancy_contactgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contactgroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: tenancy_contactrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_contactrole (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: tenancy_tenant; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenant (created, last_updated, custom_field_data, id, name, slug, description, comments, group_id) FROM stdin;
2022-06-03 22:37:42.820804-03	2022-06-03 23:57:27.148273-03	{}	1	NOC	noc			\N
2022-06-04 13:10:59.12401-03	2022-06-04 13:10:59.124021-03	{}	2	Office	office			\N
\.


--
-- Data for Name: tenancy_tenantgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenantgroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission (id, name, description, enabled, actions, constraints) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_groups (id, objectpermission_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_object_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_object_types (id, objectpermission_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_users; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_users (id, objectpermission_id, user_id) FROM stdin;
\.


--
-- Data for Name: users_token; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_token (id, created, expires, key, write_enabled, description, user_id) FROM stdin;
1	2022-06-04 00:09:40.530403-03	\N	8b791360c82343ab0aa3dbf9b66229a2df79ee3e	t	token_netbox	1
\.


--
-- Data for Name: users_userconfig; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_userconfig (id, data, user_id) FROM stdin;
1	{"tables": {"DeviceTable": {"columns": ["name", "status", "tenant", "site", "device_role", "manufacturer", "device_type", "primary_ip", "cf_sw_version"]}, "IPAddressTable": {"columns": ["address", "vrf", "status", "role", "tenant", "assigned", "cf_port"]}, "DeviceTypeTable": {"columns": ["model", "manufacturer", "cf_command_soft_version", "cf_sw_version_parser"], "ordering": ["-cf_command_soft_version"]}}}	1
\.


--
-- Data for Name: virtualization_cluster; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_cluster (created, last_updated, custom_field_data, id, name, comments, group_id, site_id, tenant_id, type_id) FROM stdin;
\.


--
-- Data for Name: virtualization_clustergroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustergroup (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: virtualization_clustertype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustertype (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
\.


--
-- Data for Name: virtualization_virtualmachine; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_virtualmachine (created, last_updated, custom_field_data, id, local_context_data, name, status, vcpus, memory, disk, comments, cluster_id, platform_id, primary_ip4_id, primary_ip6_id, role_id, tenant_id, _name) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface (created, last_updated, custom_field_data, id, enabled, mac_address, mtu, mode, name, _name, description, parent_id, untagged_vlan_id, virtual_machine_id, bridge_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface_tagged_vlans (id, vminterface_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: wireless_wirelesslan; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.wireless_wirelesslan (created, last_updated, custom_field_data, id, ssid, group_id, description, auth_cipher, auth_psk, auth_type, vlan_id) FROM stdin;
\.


--
-- Data for Name: wireless_wirelesslangroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.wireless_wirelesslangroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: wireless_wirelesslink; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.wireless_wirelesslink (created, last_updated, custom_field_data, id, ssid, status, description, auth_cipher, auth_psk, auth_type, _interface_a_device_id, _interface_b_device_id, interface_a_id, interface_b_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 425, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuit_id_seq', 1, false);


--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittermination_id_seq', 1, false);


--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittype_id_seq', 1, false);


--
-- Name: circuits_provider_asns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_provider_asns_id_seq', 1, false);


--
-- Name: circuits_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_provider_id_seq', 1, false);


--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_providernetwork_id_seq', 1, false);


--
-- Name: dcim_cable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cable_id_seq', 1, false);


--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cablepath_id_seq', 1, false);


--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleport_id_seq', 1, false);


--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleporttemplate_id_seq', 1, false);


--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverport_id_seq', 1, false);


--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverporttemplate_id_seq', 1, false);


--
-- Name: dcim_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_device_id_seq', 6, true);


--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebay_id_seq', 1, false);


--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebaytemplate_id_seq', 1, false);


--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicerole_id_seq', 4, true);


--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicetype_id_seq', 5, true);


--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontport_id_seq', 1, false);


--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontporttemplate_id_seq', 1, false);


--
-- Name: dcim_interface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_id_seq', 8, true);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 1, false);


--
-- Name: dcim_interface_wireless_lans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_wireless_lans_id_seq', 1, false);


--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interfacetemplate_id_seq', 1, false);


--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_inventoryitem_id_seq', 1, false);


--
-- Name: dcim_inventoryitemrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_inventoryitemrole_id_seq', 1, false);


--
-- Name: dcim_inventoryitemtemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_inventoryitemtemplate_id_seq', 1, false);


--
-- Name: dcim_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_location_id_seq', 1, false);


--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_manufacturer_id_seq', 3, true);


--
-- Name: dcim_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_module_id_seq', 1, false);


--
-- Name: dcim_modulebay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_modulebay_id_seq', 1, false);


--
-- Name: dcim_modulebaytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_modulebaytemplate_id_seq', 1, false);


--
-- Name: dcim_moduletype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_moduletype_id_seq', 1, false);


--
-- Name: dcim_platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_platform_id_seq', 1, false);


--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerfeed_id_seq', 1, false);


--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlet_id_seq', 1, false);


--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlettemplate_id_seq', 1, false);


--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerpanel_id_seq', 1, false);


--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerport_id_seq', 1, false);


--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerporttemplate_id_seq', 1, false);


--
-- Name: dcim_rack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rack_id_seq', 1, false);


--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackreservation_id_seq', 1, false);


--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackrole_id_seq', 1, false);


--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearport_id_seq', 1, false);


--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearporttemplate_id_seq', 1, false);


--
-- Name: dcim_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_region_id_seq', 1, false);


--
-- Name: dcim_site_asns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_site_asns_id_seq', 1, false);


--
-- Name: dcim_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_site_id_seq', 1, true);


--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_sitegroup_id_seq', 1, false);


--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_virtualchassis_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 107, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 435, true);


--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_cluster_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_cluster_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_cluster_types_id_seq', 1, false);


--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_clusters_id_seq', 1, false);


--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_device_types_id_seq', 1, false);


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_id_seq', 1, false);


--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_platforms_id_seq', 1, false);


--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_regions_id_seq', 1, false);


--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_roles_id_seq', 1, false);


--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_site_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_sites_id_seq', 1, false);


--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tags_id_seq', 1, false);


--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenant_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenants_id_seq', 1, false);


--
-- Name: extras_configrevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configrevision_id_seq', 1, false);


--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_content_types_id_seq', 5, true);


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_id_seq', 5, true);


--
-- Name: extras_customlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customlink_id_seq', 1, false);


--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_exporttemplate_id_seq', 1, false);


--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_imageattachment_id_seq', 1, false);


--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_jobresult_id_seq', 1, false);


--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_journalentry_id_seq', 1, false);


--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_objectchange_id_seq', 198, true);


--
-- Name: extras_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_tag_id_seq', 1, false);


--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_taggeditem_id_seq', 1, false);


--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_content_types_id_seq', 1, false);


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_id_seq', 1, false);


--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_aggregate_id_seq', 1, false);


--
-- Name: ipam_asn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_asn_id_seq', 1, false);


--
-- Name: ipam_fhrpgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_fhrpgroup_id_seq', 1, false);


--
-- Name: ipam_fhrpgroupassignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_fhrpgroupassignment_id_seq', 1, false);


--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_ipaddress_id_seq', 6, true);


--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_iprange_id_seq', 1, false);


--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_prefix_id_seq', 1, false);


--
-- Name: ipam_rir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_rir_id_seq', 1, false);


--
-- Name: ipam_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_role_id_seq', 1, false);


--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_routetarget_id_seq', 1, false);


--
-- Name: ipam_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_id_seq', 1, false);


--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_ipaddresses_id_seq', 1, false);


--
-- Name: ipam_servicetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_servicetemplate_id_seq', 1, false);


--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlan_id_seq', 1, false);


--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlangroup_id_seq', 1, false);


--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_export_targets_id_seq', 1, false);


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_id_seq', 1, false);


--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_import_targets_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: tenancy_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contact_id_seq', 1, false);


--
-- Name: tenancy_contactassignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contactassignment_id_seq', 1, false);


--
-- Name: tenancy_contactgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contactgroup_id_seq', 1, false);


--
-- Name: tenancy_contactrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_contactrole_id_seq', 1, false);


--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenant_id_seq', 2, true);


--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenantgroup_id_seq', 1, false);


--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_groups_id_seq', 1, false);


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_id_seq', 1, false);


--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_object_types_id_seq', 1, false);


--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_users_id_seq', 1, false);


--
-- Name: users_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_token_id_seq', 1, true);


--
-- Name: users_userconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_userconfig_id_seq', 1, true);


--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_cluster_id_seq', 1, false);


--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustergroup_id_seq', 1, false);


--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustertype_id_seq', 1, false);


--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_virtualmachine_id_seq', 1, false);


--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_id_seq', 1, false);


--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_tagged_vlans_id_seq', 1, false);


--
-- Name: wireless_wirelesslan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.wireless_wirelesslan_id_seq', 1, false);


--
-- Name: wireless_wirelesslangroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.wireless_wirelesslangroup_id_seq', 1, false);


--
-- Name: wireless_wirelesslink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.wireless_wirelesslink_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: circuits_circuit circuits_circuit_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuit circuits_circuit_provider_id_cid_b6f29862_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_cid_b6f29862_uniq UNIQUE (provider_id, cid);


--
-- Name: circuits_circuittermination circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq UNIQUE (circuit_id, term_side);


--
-- Name: circuits_circuittermination circuits_circuittermination_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_name_key UNIQUE (name);


--
-- Name: circuits_circuittype circuits_circuittype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_slug_key UNIQUE (slug);


--
-- Name: circuits_provider_asns circuits_provider_asns_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_asns_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider_asns circuits_provider_asns_provider_id_asn_id_6e573798_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_asns_provider_id_asn_id_6e573798_uniq UNIQUE (provider_id, asn_id);


--
-- Name: circuits_provider circuits_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_name_key UNIQUE (name);


--
-- Name: circuits_provider circuits_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider circuits_provider_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_slug_key UNIQUE (slug);


--
-- Name: circuits_providernetwork circuits_providernetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_pkey PRIMARY KEY (id);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_id_name_6f6610a0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_id_name_6f6610a0_uniq UNIQUE (provider_id, name);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_name UNIQUE (provider_id, name);


--
-- Name: dcim_cable dcim_cable_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_pkey PRIMARY KEY (id);


--
-- Name: dcim_cable dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq UNIQUE (termination_a_type_id, termination_a_id);


--
-- Name: dcim_cable dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq UNIQUE (termination_b_type_id, termination_b_id);


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq UNIQUE (origin_type_id, origin_id);


--
-- Name: dcim_cablepath dcim_cablepath_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleport dcim_consoleport_device_id_name_293786b6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_name_293786b6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleport dcim_consoleport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_module_type_id_name_18a13ab8_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_module_type_id_name_18a13ab8_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_name_fb1c5999_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_name_fb1c5999_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverportte_device_type_id_name_a05c974d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverportte_device_type_id_name_a05c974d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverportte_module_type_id_name_28b4f967_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverportte_module_type_id_name_28b4f967_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_device dcim_device_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: dcim_device dcim_device_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: dcim_device dcim_device_rack_id_position_face_43208a79_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_position_face_43208a79_uniq UNIQUE (rack_id, "position", face);


--
-- Name: dcim_device dcim_device_site_id_tenant_id_name_93f4f962_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_tenant_id_name_93f4f962_uniq UNIQUE (site_id, tenant_id, name);


--
-- Name: dcim_device dcim_device_virtual_chassis_id_vc_position_efea7133_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_vc_position_efea7133_uniq UNIQUE (virtual_chassis_id, vc_position);


--
-- Name: dcim_devicebay dcim_devicebay_device_id_name_2475a67b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_name_2475a67b_uniq UNIQUE (device_id, name);


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_key UNIQUE (installed_device_id);


--
-- Name: dcim_devicebay dcim_devicebay_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_name_key UNIQUE (name);


--
-- Name: dcim_devicerole dcim_devicerole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_slug_key UNIQUE (slug);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_model_17948c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_model_17948c0c_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq UNIQUE (manufacturer_id, slug);


--
-- Name: dcim_devicetype dcim_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_device_id_name_235b7af2_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_name_235b7af2_uniq UNIQUE (device_id, name);


--
-- Name: dcim_frontport dcim_frontport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_module_type_id_name_30ed12b9_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_module_type_id_name_30ed12b9_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_interface dcim_interface_device_id_name_bffc4ec4_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_name_bffc4ec4_uniq UNIQUE (device_id, name);


--
-- Name: dcim_interface dcim_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq UNIQUE (interface_id, vlan_id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_wireless_lans dcim_interface_wireless__interface_id_wirelesslan_b52fb3d8_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wireless__interface_id_wirelesslan_b52fb3d8_uniq UNIQUE (interface_id, wirelesslan_id);


--
-- Name: dcim_interface_wireless_lans dcim_interface_wireless_lans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wireless_lans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_device_type_id_name_3a847237_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_device_type_id_name_3a847237_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_module_type_id_name_c4d562a5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_module_type_id_name_c4d562a5_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq UNIQUE (device_id, parent_id, name);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitemrole dcim_inventoryitemrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole
    ADD CONSTRAINT dcim_inventoryitemrole_name_key UNIQUE (name);


--
-- Name: dcim_inventoryitemrole dcim_inventoryitemrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole
    ADD CONSTRAINT dcim_inventoryitemrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitemrole dcim_inventoryitemrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemrole
    ADD CONSTRAINT dcim_inventoryitemrole_slug_key UNIQUE (slug);


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemtempla_device_type_id_parent_id_edaaf836_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemtempla_device_type_id_parent_id_edaaf836_uniq UNIQUE (device_type_id, parent_id, name);


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemtemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_location dcim_location_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_name UNIQUE (site_id, parent_id, name);


--
-- Name: dcim_location dcim_location_parent_slug; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_slug UNIQUE (site_id, parent_id, slug);


--
-- Name: dcim_location dcim_location_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_name_key UNIQUE (name);


--
-- Name: dcim_manufacturer dcim_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_slug_key UNIQUE (slug);


--
-- Name: dcim_module dcim_module_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_module dcim_module_module_bay_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_module_bay_id_key UNIQUE (module_bay_id);


--
-- Name: dcim_module dcim_module_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_pkey PRIMARY KEY (id);


--
-- Name: dcim_modulebay dcim_modulebay_device_id_name_c05905b8_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay
    ADD CONSTRAINT dcim_modulebay_device_id_name_c05905b8_uniq UNIQUE (device_id, name);


--
-- Name: dcim_modulebay dcim_modulebay_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay
    ADD CONSTRAINT dcim_modulebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_modulebaytemplate dcim_modulebaytemplate_device_type_id_name_8ba454cc_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate
    ADD CONSTRAINT dcim_modulebaytemplate_device_type_id_name_8ba454cc_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_modulebaytemplate dcim_modulebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate
    ADD CONSTRAINT dcim_modulebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_moduletype dcim_moduletype_manufacturer_id_model_bd40def7_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype
    ADD CONSTRAINT dcim_moduletype_manufacturer_id_model_bd40def7_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_moduletype dcim_moduletype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype
    ADD CONSTRAINT dcim_moduletype_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_name_key UNIQUE (name);


--
-- Name: dcim_platform dcim_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_slug_key UNIQUE (slug);


--
-- Name: dcim_powerfeed dcim_powerfeed_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq UNIQUE (power_panel_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_name_981b00c1_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_name_981b00c1_uniq UNIQUE (device_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_pkey PRIMARY KEY (id);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_module_type_id_name_e908a87e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_module_type_id_name_e908a87e_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_name_804df4c0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_name_804df4c0_uniq UNIQUE (site_id, name);


--
-- Name: dcim_powerport dcim_powerport_device_id_name_948af82c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_name_948af82c_uniq UNIQUE (device_id, name);


--
-- Name: dcim_powerport dcim_powerport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_module_type_id_name_17b0ffd1_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_module_type_id_name_17b0ffd1_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_rack dcim_rack_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_rack dcim_rack_location_id_facility_id_59f80bca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_facility_id_59f80bca_uniq UNIQUE (location_id, facility_id);


--
-- Name: dcim_rack dcim_rack_location_id_name_283dd15d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_name_283dd15d_uniq UNIQUE (location_id, name);


--
-- Name: dcim_rack dcim_rack_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackreservation dcim_rackreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_name_key UNIQUE (name);


--
-- Name: dcim_rackrole dcim_rackrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_slug_key UNIQUE (slug);


--
-- Name: dcim_rearport dcim_rearport_device_id_name_4b14dde6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_name_4b14dde6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_rearport dcim_rearport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_pkey PRIMARY KEY (id);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_module_type_id_name_785a9c4c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_module_type_id_name_785a9c4c_uniq UNIQUE (module_type_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_name UNIQUE (parent_id, name);


--
-- Name: dcim_region dcim_region_parent_slug; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_slug UNIQUE (parent_id, slug);


--
-- Name: dcim_region dcim_region_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_pkey PRIMARY KEY (id);


--
-- Name: dcim_site_asns dcim_site_asns_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_pkey PRIMARY KEY (id);


--
-- Name: dcim_site_asns dcim_site_asns_site_id_asn_id_1a5a6f23_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_site_id_asn_id_1a5a6f23_uniq UNIQUE (site_id, asn_id);


--
-- Name: dcim_site dcim_site_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_name_key UNIQUE (name);


--
-- Name: dcim_site dcim_site_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_pkey PRIMARY KEY (id);


--
-- Name: dcim_site dcim_site_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_slug_key UNIQUE (slug);


--
-- Name: dcim_sitegroup dcim_sitegroup_parent_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_parent_name UNIQUE (parent_id, name);


--
-- Name: dcim_sitegroup dcim_sitegroup_parent_slug; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_parent_slug UNIQUE (parent_id, slug);


--
-- Name: dcim_sitegroup dcim_sitegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_key UNIQUE (master_id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: extras_configcontext_clusters extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq UNIQUE (configcontext_id, cluster_id);


--
-- Name: extras_configcontext_cluster_types extras_configcontext_clu_configcontext_id_cluster_4a2d5e56_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_4a2d5e56_uniq UNIQUE (configcontext_id, clustertype_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq UNIQUE (configcontext_id, clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_cluster_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_cluster_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_cluster_types extras_configcontext_cluster_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_cluster_types_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_clusters extras_configcontext_clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clusters_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_device_types extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq UNIQUE (configcontext_id, devicetype_id);


--
-- Name: extras_configcontext_device_types extras_configcontext_device_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_device_types_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext extras_configcontext_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_name_key UNIQUE (name);


--
-- Name: extras_configcontext extras_configcontext_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_platforms extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq UNIQUE (configcontext_id, platform_id);


--
-- Name: extras_configcontext_platforms extras_configcontext_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platforms_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_regions extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq UNIQUE (configcontext_id, region_id);


--
-- Name: extras_configcontext_regions extras_configcontext_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_regions_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_roles extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq UNIQUE (configcontext_id, devicerole_id);


--
-- Name: extras_configcontext_roles extras_configcontext_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_roles_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq UNIQUE (configcontext_id, site_id);


--
-- Name: extras_configcontext_site_groups extras_configcontext_sit_configcontext_id_sitegro_4caa52ec_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_sitegro_4caa52ec_uniq UNIQUE (configcontext_id, sitegroup_id);


--
-- Name: extras_configcontext_site_groups extras_configcontext_site_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_site_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq UNIQUE (configcontext_id, tag_id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq UNIQUE (configcontext_id, tenant_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq UNIQUE (configcontext_id, tenantgroup_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenant_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenant_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenants_pkey PRIMARY KEY (id);


--
-- Name: extras_configrevision extras_configrevision_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configrevision
    ADD CONSTRAINT extras_configrevision_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield_content_types extras_customfield_conte_customfield_id_contentty_51136c2b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_conte_customfield_id_contentty_51136c2b_uniq UNIQUE (customfield_id, contenttype_id);


--
-- Name: extras_customfield_content_types extras_customfield_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_name_key UNIQUE (name);


--
-- Name: extras_customfield extras_customfield_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_pkey PRIMARY KEY (id);


--
-- Name: extras_customlink extras_customlink_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_name_key UNIQUE (name);


--
-- Name: extras_customlink extras_customlink_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_pkey PRIMARY KEY (id);


--
-- Name: extras_exporttemplate extras_exporttemplate_content_type_id_name_edca9b9b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_content_type_id_name_edca9b9b_uniq UNIQUE (content_type_id, name);


--
-- Name: extras_exporttemplate extras_exporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_pkey PRIMARY KEY (id);


--
-- Name: extras_imageattachment extras_imageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_jobresult extras_jobresult_job_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_job_id_key UNIQUE (job_id);


--
-- Name: extras_jobresult extras_jobresult_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_pkey PRIMARY KEY (id);


--
-- Name: extras_journalentry extras_journalentry_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_pkey PRIMARY KEY (id);


--
-- Name: extras_objectchange extras_objectchange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_name_key UNIQUE (name);


--
-- Name: extras_tag extras_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_slug_key UNIQUE (slug);


--
-- Name: extras_taggeditem extras_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook_content_types extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq UNIQUE (webhook_id, contenttype_id);


--
-- Name: extras_webhook_content_types extras_webhook_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook extras_webhook_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_name_key UNIQUE (name);


--
-- Name: extras_webhook extras_webhook_payload_url_type_create__dd332134_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_payload_url_type_create__dd332134_uniq UNIQUE (payload_url, type_create, type_update, type_delete);


--
-- Name: extras_webhook extras_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_pkey PRIMARY KEY (id);


--
-- Name: ipam_aggregate ipam_aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_pkey PRIMARY KEY (id);


--
-- Name: ipam_asn ipam_asn_asn_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_asn_key UNIQUE (asn);


--
-- Name: ipam_asn ipam_asn_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_pkey PRIMARY KEY (id);


--
-- Name: ipam_fhrpgroup ipam_fhrpgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroup
    ADD CONSTRAINT ipam_fhrpgroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassignment_interface_type_id_interf_c4a295da_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassignment_interface_type_id_interf_c4a295da_uniq UNIQUE (interface_type_id, interface_id, group_id);


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassignment_pkey PRIMARY KEY (id);


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_key UNIQUE (nat_inside_id);


--
-- Name: ipam_ipaddress ipam_ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_pkey PRIMARY KEY (id);


--
-- Name: ipam_iprange ipam_iprange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefix ipam_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_name_key UNIQUE (name);


--
-- Name: ipam_rir ipam_rir_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_slug_key UNIQUE (slug);


--
-- Name: ipam_role ipam_role_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_name_key UNIQUE (name);


--
-- Name: ipam_role ipam_role_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_pkey PRIMARY KEY (id);


--
-- Name: ipam_role ipam_role_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_slug_key UNIQUE (slug);


--
-- Name: ipam_routetarget ipam_routetarget_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_name_key UNIQUE (name);


--
-- Name: ipam_routetarget ipam_routetarget_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq UNIQUE (service_id, ipaddress_id);


--
-- Name: ipam_service ipam_service_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_pkey PRIMARY KEY (id);


--
-- Name: ipam_servicetemplate ipam_servicetemplate_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_servicetemplate
    ADD CONSTRAINT ipam_servicetemplate_name_key UNIQUE (name);


--
-- Name: ipam_servicetemplate ipam_servicetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_servicetemplate
    ADD CONSTRAINT ipam_servicetemplate_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlan ipam_vlan_group_id_name_e53919df_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_name_e53919df_uniq UNIQUE (group_id, name);


--
-- Name: ipam_vlan ipam_vlan_group_id_vid_5ca4cc47_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_vid_5ca4cc47_uniq UNIQUE (group_id, vid);


--
-- Name: ipam_vlan ipam_vlan_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_scope_id_name_66199b4b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_scope_id_name_66199b4b_uniq UNIQUE (scope_type_id, scope_id, name);


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_scope_id_slug_6ae7ef85_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_scope_id_slug_6ae7ef85_uniq UNIQUE (scope_type_id, scope_id, slug);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf ipam_vrf_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf ipam_vrf_rd_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_rd_key UNIQUE (rd);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contact tenancy_contact_group_id_name_a6f04101_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact
    ADD CONSTRAINT tenancy_contact_group_id_name_a6f04101_uniq UNIQUE (group_id, name);


--
-- Name: tenancy_contact tenancy_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact
    ADD CONSTRAINT tenancy_contact_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contactassignment tenancy_contactassignmen_content_type_id_object_i_0764a1ef_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassignmen_content_type_id_object_i_0764a1ef_uniq UNIQUE (content_type_id, object_id, contact_id, role_id, priority);


--
-- Name: tenancy_contactassignment tenancy_contactassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassignment_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contactgroup tenancy_contactgroup_parent_id_name_a1e7aba9_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup
    ADD CONSTRAINT tenancy_contactgroup_parent_id_name_a1e7aba9_uniq UNIQUE (parent_id, name);


--
-- Name: tenancy_contactgroup tenancy_contactgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup
    ADD CONSTRAINT tenancy_contactgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contactrole tenancy_contactrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole
    ADD CONSTRAINT tenancy_contactrole_name_key UNIQUE (name);


--
-- Name: tenancy_contactrole tenancy_contactrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole
    ADD CONSTRAINT tenancy_contactrole_pkey PRIMARY KEY (id);


--
-- Name: tenancy_contactrole tenancy_contactrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactrole
    ADD CONSTRAINT tenancy_contactrole_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenant tenancy_tenant_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_name_key UNIQUE (name);


--
-- Name: tenancy_tenant tenancy_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_name_key UNIQUE (name);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_slug_key UNIQUE (slug);


--
-- Name: users_objectpermission_groups users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq UNIQUE (objectpermission_id, group_id);


--
-- Name: users_objectpermission_groups users_objectpermission_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_groups_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_object_types users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq UNIQUE (objectpermission_id, contenttype_id);


--
-- Name: users_objectpermission_object_types users_objectpermission_object_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_object_types_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission users_objectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission
    ADD CONSTRAINT users_objectpermission_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_users users_objectpermission_u_objectpermission_id_user_3a7db108_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_u_objectpermission_id_user_3a7db108_uniq UNIQUE (objectpermission_id, user_id);


--
-- Name: users_objectpermission_users users_objectpermission_users_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_pkey PRIMARY KEY (id);


--
-- Name: users_token users_token_key_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_key_key UNIQUE (key);


--
-- Name: users_token users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_user_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_key UNIQUE (user_id);


--
-- Name: virtualization_cluster virtualization_cluster_group_id_name_7760ee61_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_group_id_name_7760ee61_uniq UNIQUE (group_id, name);


--
-- Name: virtualization_cluster virtualization_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_pkey PRIMARY KEY (id);


--
-- Name: virtualization_cluster virtualization_cluster_site_id_name_0ccc30a5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_name_0ccc30a5_uniq UNIQUE (site_id, name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_name_key UNIQUE (name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_slug_key UNIQUE (slug);


--
-- Name: virtualization_clustertype virtualization_clustertype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_name_key UNIQUE (name);


--
-- Name: virtualization_clustertype virtualization_clustertype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustertype virtualization_clustertype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_slug_key UNIQUE (slug);


--
-- Name: virtualization_virtualmachine virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq UNIQUE (cluster_id, tenant_id, name);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_pkey PRIMARY KEY (id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: virtualization_vminterface virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq UNIQUE (virtual_machine_id, name);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq UNIQUE (vminterface_id, vlan_id);


--
-- Name: virtualization_vminterface virtualization_vminterface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_pkey PRIMARY KEY (id);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: wireless_wirelesslan wireless_wirelesslan_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan
    ADD CONSTRAINT wireless_wirelesslan_pkey PRIMARY KEY (id);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_name_key UNIQUE (name);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_parent_id_name_d61bc23c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_parent_id_name_d61bc23c_uniq UNIQUE (parent_id, name);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_pkey PRIMARY KEY (id);


--
-- Name: wireless_wirelesslangroup wireless_wirelesslangroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslangroup_slug_key UNIQUE (slug);


--
-- Name: wireless_wirelesslink wireless_wirelesslink_interface_a_id_interface_d1f2f36d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslink_interface_a_id_interface_d1f2f36d_uniq UNIQUE (interface_a_id, interface_b_id);


--
-- Name: wireless_wirelesslink wireless_wirelesslink_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslink_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: circuits_circuit_provider_id_d9195418; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_provider_id_d9195418 ON public.circuits_circuit USING btree (provider_id);


--
-- Name: circuits_circuit_tenant_id_812508a5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_tenant_id_812508a5 ON public.circuits_circuit USING btree (tenant_id);


--
-- Name: circuits_circuit_termination_a_id_f891adac; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_termination_a_id_f891adac ON public.circuits_circuit USING btree (termination_a_id);


--
-- Name: circuits_circuit_termination_z_id_377b8551; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_termination_z_id_377b8551 ON public.circuits_circuit USING btree (termination_z_id);


--
-- Name: circuits_circuit_type_id_1b9f485a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_type_id_1b9f485a ON public.circuits_circuit USING btree (type_id);


--
-- Name: circuits_circuittermination__cable_peer_type_id_bd122156; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination__cable_peer_type_id_bd122156 ON public.circuits_circuittermination USING btree (_link_peer_type_id);


--
-- Name: circuits_circuittermination_cable_id_35e9f703; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_cable_id_35e9f703 ON public.circuits_circuittermination USING btree (cable_id);


--
-- Name: circuits_circuittermination_circuit_id_257e87e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_circuit_id_257e87e7 ON public.circuits_circuittermination USING btree (circuit_id);


--
-- Name: circuits_circuittermination_provider_network_id_b0c660f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_provider_network_id_b0c660f1 ON public.circuits_circuittermination USING btree (provider_network_id);


--
-- Name: circuits_circuittermination_site_id_e6fe5652; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_site_id_e6fe5652 ON public.circuits_circuittermination USING btree (site_id);


--
-- Name: circuits_circuittype_name_8256ea9a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_name_8256ea9a_like ON public.circuits_circuittype USING btree (name varchar_pattern_ops);


--
-- Name: circuits_circuittype_slug_9b4b3cf9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_slug_9b4b3cf9_like ON public.circuits_circuittype USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_provider_asns_asn_id_0a6c53b3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_asns_asn_id_0a6c53b3 ON public.circuits_provider_asns USING btree (asn_id);


--
-- Name: circuits_provider_asns_provider_id_becc3f7e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_asns_provider_id_becc3f7e ON public.circuits_provider_asns USING btree (provider_id);


--
-- Name: circuits_provider_name_8f2514f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_name_8f2514f5_like ON public.circuits_provider USING btree (name varchar_pattern_ops);


--
-- Name: circuits_provider_slug_c3c0aa10_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_slug_c3c0aa10_like ON public.circuits_provider USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_providernetwork_provider_id_7992236c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_providernetwork_provider_id_7992236c ON public.circuits_providernetwork USING btree (provider_id);


--
-- Name: dcim_cable__termination_a_device_id_e59cde1c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_a_device_id_e59cde1c ON public.dcim_cable USING btree (_termination_a_device_id);


--
-- Name: dcim_cable__termination_b_device_id_a9073762; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_b_device_id_a9073762 ON public.dcim_cable USING btree (_termination_b_device_id);


--
-- Name: dcim_cable_tenant_id_3a7fdbb8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_tenant_id_3a7fdbb8 ON public.dcim_cable USING btree (tenant_id);


--
-- Name: dcim_cable_termination_a_type_id_a614bab8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_a_type_id_a614bab8 ON public.dcim_cable USING btree (termination_a_type_id);


--
-- Name: dcim_cable_termination_b_type_id_a91595d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_b_type_id_a91595d0 ON public.dcim_cable USING btree (termination_b_type_id);


--
-- Name: dcim_cablepath_destination_type_id_a8c1654b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cablepath_destination_type_id_a8c1654b ON public.dcim_cablepath USING btree (destination_type_id);


--
-- Name: dcim_cablepath_origin_type_id_6de54f6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cablepath_origin_type_id_6de54f6d ON public.dcim_cablepath USING btree (origin_type_id);


--
-- Name: dcim_consoleport__cable_peer_type_id_52adb1be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport__cable_peer_type_id_52adb1be ON public.dcim_consoleport USING btree (_link_peer_type_id);


--
-- Name: dcim_consoleport__path_id_e40a4436; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport__path_id_e40a4436 ON public.dcim_consoleport USING btree (_path_id);


--
-- Name: dcim_consoleport_cable_id_a9ae5465; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_cable_id_a9ae5465 ON public.dcim_consoleport USING btree (cable_id);


--
-- Name: dcim_consoleport_device_id_f2d90d3c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_device_id_f2d90d3c ON public.dcim_consoleport USING btree (device_id);


--
-- Name: dcim_consoleport_module_id_d17b2519; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_module_id_d17b2519 ON public.dcim_consoleport USING btree (module_id);


--
-- Name: dcim_consoleporttemplate_device_type_id_075d4015; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleporttemplate_device_type_id_075d4015 ON public.dcim_consoleporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleporttemplate_module_type_id_c0f35d97; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleporttemplate_module_type_id_c0f35d97 ON public.dcim_consoleporttemplate USING btree (module_type_id);


--
-- Name: dcim_consoleserverport__cable_peer_type_id_132b6744; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport__cable_peer_type_id_132b6744 ON public.dcim_consoleserverport USING btree (_link_peer_type_id);


--
-- Name: dcim_consoleserverport__path_id_dc5abe09; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport__path_id_dc5abe09 ON public.dcim_consoleserverport USING btree (_path_id);


--
-- Name: dcim_consoleserverport_cable_id_f2940dfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_cable_id_f2940dfd ON public.dcim_consoleserverport USING btree (cable_id);


--
-- Name: dcim_consoleserverport_device_id_d9866581; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_device_id_d9866581 ON public.dcim_consoleserverport USING btree (device_id);


--
-- Name: dcim_consoleserverport_module_id_d060cfc8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_module_id_d060cfc8 ON public.dcim_consoleserverport USING btree (module_id);


--
-- Name: dcim_consoleserverporttemplate_device_type_id_579bdc86; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverporttemplate_device_type_id_579bdc86 ON public.dcim_consoleserverporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleserverporttemplate_module_type_id_4abf751a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverporttemplate_module_type_id_4abf751a ON public.dcim_consoleserverporttemplate USING btree (module_type_id);


--
-- Name: dcim_device_asset_tag_8dac1079_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_asset_tag_8dac1079_like ON public.dcim_device USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_device_cluster_id_cf852f78; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_cluster_id_cf852f78 ON public.dcim_device USING btree (cluster_id);


--
-- Name: dcim_device_device_role_id_682e8188; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_role_id_682e8188 ON public.dcim_device USING btree (device_role_id);


--
-- Name: dcim_device_device_type_id_d61b4086; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_type_id_d61b4086 ON public.dcim_device USING btree (device_type_id);


--
-- Name: dcim_device_location_id_11a7bedb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_location_id_11a7bedb ON public.dcim_device USING btree (location_id);


--
-- Name: dcim_device_platform_id_468138f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_platform_id_468138f1 ON public.dcim_device USING btree (platform_id);


--
-- Name: dcim_device_rack_id_23bde71f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_rack_id_23bde71f ON public.dcim_device USING btree (rack_id);


--
-- Name: dcim_device_site_id_ff897cf6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_site_id_ff897cf6 ON public.dcim_device USING btree (site_id);


--
-- Name: dcim_device_tenant_id_dcea7969; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_tenant_id_dcea7969 ON public.dcim_device USING btree (tenant_id);


--
-- Name: dcim_device_virtual_chassis_id_aed51693; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_virtual_chassis_id_aed51693 ON public.dcim_device USING btree (virtual_chassis_id);


--
-- Name: dcim_devicebay_device_id_0c8a1218; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebay_device_id_0c8a1218 ON public.dcim_devicebay USING btree (device_id);


--
-- Name: dcim_devicebaytemplate_device_type_id_f4b24a29; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebaytemplate_device_type_id_f4b24a29 ON public.dcim_devicebaytemplate USING btree (device_type_id);


--
-- Name: dcim_devicerole_name_1c813306_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_name_1c813306_like ON public.dcim_devicerole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicerole_slug_7952643b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_slug_7952643b_like ON public.dcim_devicerole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_devicetype_manufacturer_id_a3e8029e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_manufacturer_id_a3e8029e ON public.dcim_devicetype USING btree (manufacturer_id);


--
-- Name: dcim_devicetype_slug_448745bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd ON public.dcim_devicetype USING btree (slug);


--
-- Name: dcim_devicetype_slug_448745bd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd_like ON public.dcim_devicetype USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_frontport__cable_peer_type_id_c4690f56; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport__cable_peer_type_id_c4690f56 ON public.dcim_frontport USING btree (_link_peer_type_id);


--
-- Name: dcim_frontport_cable_id_04ff8aab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_cable_id_04ff8aab ON public.dcim_frontport USING btree (cable_id);


--
-- Name: dcim_frontport_device_id_950557b5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_device_id_950557b5 ON public.dcim_frontport USING btree (device_id);


--
-- Name: dcim_frontport_module_id_952c3f9a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_module_id_952c3f9a ON public.dcim_frontport USING btree (module_id);


--
-- Name: dcim_frontport_rear_port_id_78df2532; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_rear_port_id_78df2532 ON public.dcim_frontport USING btree (rear_port_id);


--
-- Name: dcim_frontporttemplate_device_type_id_f088b952; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_device_type_id_f088b952 ON public.dcim_frontporttemplate USING btree (device_type_id);


--
-- Name: dcim_frontporttemplate_module_type_id_66851ff9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_module_type_id_66851ff9 ON public.dcim_frontporttemplate USING btree (module_type_id);


--
-- Name: dcim_frontporttemplate_rear_port_id_9775411b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_rear_port_id_9775411b ON public.dcim_frontporttemplate USING btree (rear_port_id);


--
-- Name: dcim_interface__cable_peer_type_id_ce52cb81; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface__cable_peer_type_id_ce52cb81 ON public.dcim_interface USING btree (_link_peer_type_id);


--
-- Name: dcim_interface__path_id_f8f4f7f0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface__path_id_f8f4f7f0 ON public.dcim_interface USING btree (_path_id);


--
-- Name: dcim_interface_bridge_id_f2a8df85; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_bridge_id_f2a8df85 ON public.dcim_interface USING btree (bridge_id);


--
-- Name: dcim_interface_cable_id_1b264edb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_cable_id_1b264edb ON public.dcim_interface USING btree (cable_id);


--
-- Name: dcim_interface_device_id_359c6115; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_device_id_359c6115 ON public.dcim_interface USING btree (device_id);


--
-- Name: dcim_interface_lag_id_ea1a1d12; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_lag_id_ea1a1d12 ON public.dcim_interface USING btree (lag_id);


--
-- Name: dcim_interface_module_id_05ca2da5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_module_id_05ca2da5 ON public.dcim_interface USING btree (module_id);


--
-- Name: dcim_interface_parent_id_3e2b159b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_parent_id_3e2b159b ON public.dcim_interface USING btree (parent_id);


--
-- Name: dcim_interface_tagged_vlans_interface_id_5870c9e9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_interface_id_5870c9e9 ON public.dcim_interface_tagged_vlans USING btree (interface_id);


--
-- Name: dcim_interface_tagged_vlans_vlan_id_e027005c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_vlan_id_e027005c ON public.dcim_interface_tagged_vlans USING btree (vlan_id);


--
-- Name: dcim_interface_untagged_vlan_id_838dc7be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_untagged_vlan_id_838dc7be ON public.dcim_interface USING btree (untagged_vlan_id);


--
-- Name: dcim_interface_vrf_id_a92e59b2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_vrf_id_a92e59b2 ON public.dcim_interface USING btree (vrf_id);


--
-- Name: dcim_interface_wireless_lans_interface_id_80df3785; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_wireless_lans_interface_id_80df3785 ON public.dcim_interface_wireless_lans USING btree (interface_id);


--
-- Name: dcim_interface_wireless_lans_wirelesslan_id_f081e278; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_wireless_lans_wirelesslan_id_f081e278 ON public.dcim_interface_wireless_lans USING btree (wirelesslan_id);


--
-- Name: dcim_interface_wireless_link_id_bc91108f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_wireless_link_id_bc91108f ON public.dcim_interface USING btree (wireless_link_id);


--
-- Name: dcim_interfacetemplate_device_type_id_4bfcbfab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interfacetemplate_device_type_id_4bfcbfab ON public.dcim_interfacetemplate USING btree (device_type_id);


--
-- Name: dcim_interfacetemplate_module_type_id_f941f180; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interfacetemplate_module_type_id_f941f180 ON public.dcim_interfacetemplate USING btree (module_type_id);


--
-- Name: dcim_inventoryitem_asset_tag_d3289273_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_asset_tag_d3289273_like ON public.dcim_inventoryitem USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_component_type_id_f0e4d83a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_component_type_id_f0e4d83a ON public.dcim_inventoryitem USING btree (component_type_id);


--
-- Name: dcim_inventoryitem_device_id_033d83f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_device_id_033d83f8 ON public.dcim_inventoryitem USING btree (device_id);


--
-- Name: dcim_inventoryitem_manufacturer_id_dcd1b78a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_manufacturer_id_dcd1b78a ON public.dcim_inventoryitem USING btree (manufacturer_id);


--
-- Name: dcim_inventoryitem_parent_id_7ebcd457; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_parent_id_7ebcd457 ON public.dcim_inventoryitem USING btree (parent_id);


--
-- Name: dcim_inventoryitem_role_id_2bcfcb04; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_role_id_2bcfcb04 ON public.dcim_inventoryitem USING btree (role_id);


--
-- Name: dcim_inventoryitem_tree_id_4676ade2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_tree_id_4676ade2 ON public.dcim_inventoryitem USING btree (tree_id);


--
-- Name: dcim_inventoryitemrole_name_4c8cfe6d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemrole_name_4c8cfe6d_like ON public.dcim_inventoryitemrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_inventoryitemrole_slug_3556c227_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemrole_slug_3556c227_like ON public.dcim_inventoryitemrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_inventoryitemtemplate_component_type_id_161623a2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_component_type_id_161623a2 ON public.dcim_inventoryitemtemplate USING btree (component_type_id);


--
-- Name: dcim_inventoryitemtemplate_device_type_id_6a1be904; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_device_type_id_6a1be904 ON public.dcim_inventoryitemtemplate USING btree (device_type_id);


--
-- Name: dcim_inventoryitemtemplate_manufacturer_id_b388c5d9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_manufacturer_id_b388c5d9 ON public.dcim_inventoryitemtemplate USING btree (manufacturer_id);


--
-- Name: dcim_inventoryitemtemplate_parent_id_0dac73bb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_parent_id_0dac73bb ON public.dcim_inventoryitemtemplate USING btree (parent_id);


--
-- Name: dcim_inventoryitemtemplate_role_id_292676e6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_role_id_292676e6 ON public.dcim_inventoryitemtemplate USING btree (role_id);


--
-- Name: dcim_inventoryitemtemplate_tree_id_75ebcb8e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitemtemplate_tree_id_75ebcb8e ON public.dcim_inventoryitemtemplate USING btree (tree_id);


--
-- Name: dcim_location_name; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_location_name ON public.dcim_location USING btree (site_id, name) WHERE (parent_id IS NULL);


--
-- Name: dcim_location_parent_id_d77f3318; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_parent_id_d77f3318 ON public.dcim_location USING btree (parent_id);


--
-- Name: dcim_location_site_id_b55e975f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_site_id_b55e975f ON public.dcim_location USING btree (site_id);


--
-- Name: dcim_location_slug; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_location_slug ON public.dcim_location USING btree (site_id, slug) WHERE (parent_id IS NULL);


--
-- Name: dcim_location_slug_352c5472; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_slug_352c5472 ON public.dcim_location USING btree (slug);


--
-- Name: dcim_location_slug_352c5472_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_slug_352c5472_like ON public.dcim_location USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_location_tenant_id_2c4df974; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_tenant_id_2c4df974 ON public.dcim_location USING btree (tenant_id);


--
-- Name: dcim_location_tree_id_5089ef14; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_tree_id_5089ef14 ON public.dcim_location USING btree (tree_id);


--
-- Name: dcim_manufacturer_name_841fcd92_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_name_841fcd92_like ON public.dcim_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: dcim_manufacturer_slug_00430749_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_slug_00430749_like ON public.dcim_manufacturer USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_module_asset_tag_2fd91eed_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_asset_tag_2fd91eed_like ON public.dcim_module USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_module_device_id_53cfd5be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_device_id_53cfd5be ON public.dcim_module USING btree (device_id);


--
-- Name: dcim_module_module_type_id_a50b39fc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_module_type_id_a50b39fc ON public.dcim_module USING btree (module_type_id);


--
-- Name: dcim_modulebay_device_id_3526abc2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_modulebay_device_id_3526abc2 ON public.dcim_modulebay USING btree (device_id);


--
-- Name: dcim_modulebaytemplate_device_type_id_9eaf9bd3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_modulebaytemplate_device_type_id_9eaf9bd3 ON public.dcim_modulebaytemplate USING btree (device_type_id);


--
-- Name: dcim_moduletype_manufacturer_id_7347392e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_moduletype_manufacturer_id_7347392e ON public.dcim_moduletype USING btree (manufacturer_id);


--
-- Name: dcim_platform_manufacturer_id_83f72d3d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_manufacturer_id_83f72d3d ON public.dcim_platform USING btree (manufacturer_id);


--
-- Name: dcim_platform_name_c2f04255_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_name_c2f04255_like ON public.dcim_platform USING btree (name varchar_pattern_ops);


--
-- Name: dcim_platform_slug_b0908ae4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_slug_b0908ae4_like ON public.dcim_platform USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_powerfeed__cable_peer_type_id_9f930589; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed__cable_peer_type_id_9f930589 ON public.dcim_powerfeed USING btree (_link_peer_type_id);


--
-- Name: dcim_powerfeed__path_id_a1ea1f28; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed__path_id_a1ea1f28 ON public.dcim_powerfeed USING btree (_path_id);


--
-- Name: dcim_powerfeed_cable_id_ec44c4f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_cable_id_ec44c4f8 ON public.dcim_powerfeed USING btree (cable_id);


--
-- Name: dcim_powerfeed_power_panel_id_32bde3be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_power_panel_id_32bde3be ON public.dcim_powerfeed USING btree (power_panel_id);


--
-- Name: dcim_powerfeed_rack_id_7abba090; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_rack_id_7abba090 ON public.dcim_powerfeed USING btree (rack_id);


--
-- Name: dcim_poweroutlet__cable_peer_type_id_bbff28d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet__cable_peer_type_id_bbff28d0 ON public.dcim_poweroutlet USING btree (_link_peer_type_id);


--
-- Name: dcim_poweroutlet__path_id_cbb47bb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet__path_id_cbb47bb9 ON public.dcim_poweroutlet USING btree (_path_id);


--
-- Name: dcim_poweroutlet_cable_id_8dbea1ec; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_cable_id_8dbea1ec ON public.dcim_poweroutlet USING btree (cable_id);


--
-- Name: dcim_poweroutlet_device_id_286351d7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_device_id_286351d7 ON public.dcim_poweroutlet USING btree (device_id);


--
-- Name: dcim_poweroutlet_module_id_032f5af2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_module_id_032f5af2 ON public.dcim_poweroutlet USING btree (module_id);


--
-- Name: dcim_poweroutlet_power_port_id_9bdf4163; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_power_port_id_9bdf4163 ON public.dcim_poweroutlet USING btree (power_port_id);


--
-- Name: dcim_poweroutlettemplate_device_type_id_26b2316c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_device_type_id_26b2316c ON public.dcim_poweroutlettemplate USING btree (device_type_id);


--
-- Name: dcim_poweroutlettemplate_module_type_id_6142b416; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_module_type_id_6142b416 ON public.dcim_poweroutlettemplate USING btree (module_type_id);


--
-- Name: dcim_poweroutlettemplate_power_port_id_c0fb0c42; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_power_port_id_c0fb0c42 ON public.dcim_poweroutlettemplate USING btree (power_port_id);


--
-- Name: dcim_powerpanel_location_id_474b60f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_location_id_474b60f8 ON public.dcim_powerpanel USING btree (location_id);


--
-- Name: dcim_powerpanel_site_id_c430bc89; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_site_id_c430bc89 ON public.dcim_powerpanel USING btree (site_id);


--
-- Name: dcim_powerport__cable_peer_type_id_9df2a278; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport__cable_peer_type_id_9df2a278 ON public.dcim_powerport USING btree (_link_peer_type_id);


--
-- Name: dcim_powerport__path_id_9fe4af8f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport__path_id_9fe4af8f ON public.dcim_powerport USING btree (_path_id);


--
-- Name: dcim_powerport_cable_id_c9682ba2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_cable_id_c9682ba2 ON public.dcim_powerport USING btree (cable_id);


--
-- Name: dcim_powerport_device_id_ef7185ae; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_device_id_ef7185ae ON public.dcim_powerport USING btree (device_id);


--
-- Name: dcim_powerport_module_id_d0c27534; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_module_id_d0c27534 ON public.dcim_powerport USING btree (module_id);


--
-- Name: dcim_powerporttemplate_device_type_id_1ddfbfcc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerporttemplate_device_type_id_1ddfbfcc ON public.dcim_powerporttemplate USING btree (device_type_id);


--
-- Name: dcim_powerporttemplate_module_type_id_93e26849; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerporttemplate_module_type_id_93e26849 ON public.dcim_powerporttemplate USING btree (module_type_id);


--
-- Name: dcim_rack_asset_tag_f88408e5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_asset_tag_f88408e5_like ON public.dcim_rack USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_rack_location_id_5f63ec31; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_location_id_5f63ec31 ON public.dcim_rack USING btree (location_id);


--
-- Name: dcim_rack_role_id_62d6919e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_role_id_62d6919e ON public.dcim_rack USING btree (role_id);


--
-- Name: dcim_rack_site_id_403c7b3a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_site_id_403c7b3a ON public.dcim_rack USING btree (site_id);


--
-- Name: dcim_rack_tenant_id_7cdf3725; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_tenant_id_7cdf3725 ON public.dcim_rack USING btree (tenant_id);


--
-- Name: dcim_rackreservation_rack_id_1ebbaa9b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_rack_id_1ebbaa9b ON public.dcim_rackreservation USING btree (rack_id);


--
-- Name: dcim_rackreservation_tenant_id_eb5e045f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_tenant_id_eb5e045f ON public.dcim_rackreservation USING btree (tenant_id);


--
-- Name: dcim_rackreservation_user_id_0785a527; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_user_id_0785a527 ON public.dcim_rackreservation USING btree (user_id);


--
-- Name: dcim_rackrole_name_9077cfcc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_name_9077cfcc_like ON public.dcim_rackrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackrole_slug_40bbcd3a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_slug_40bbcd3a_like ON public.dcim_rackrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rearport__cable_peer_type_id_cecf241c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport__cable_peer_type_id_cecf241c ON public.dcim_rearport USING btree (_link_peer_type_id);


--
-- Name: dcim_rearport_cable_id_42c0e4e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_cable_id_42c0e4e7 ON public.dcim_rearport USING btree (cable_id);


--
-- Name: dcim_rearport_device_id_0bdfe9c0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_device_id_0bdfe9c0 ON public.dcim_rearport USING btree (device_id);


--
-- Name: dcim_rearport_module_id_9a7b7e91; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_module_id_9a7b7e91 ON public.dcim_rearport USING btree (module_id);


--
-- Name: dcim_rearporttemplate_device_type_id_6a02fd01; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearporttemplate_device_type_id_6a02fd01 ON public.dcim_rearporttemplate USING btree (device_type_id);


--
-- Name: dcim_rearporttemplate_module_type_id_4d970e5b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearporttemplate_module_type_id_4d970e5b ON public.dcim_rearporttemplate USING btree (module_type_id);


--
-- Name: dcim_region_name; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_region_name ON public.dcim_region USING btree (name) WHERE (parent_id IS NULL);


--
-- Name: dcim_region_parent_id_2486f5d4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_parent_id_2486f5d4 ON public.dcim_region USING btree (parent_id);


--
-- Name: dcim_region_slug; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_region_slug ON public.dcim_region USING btree (slug) WHERE (parent_id IS NULL);


--
-- Name: dcim_region_slug_ff078a66; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_slug_ff078a66 ON public.dcim_region USING btree (slug);


--
-- Name: dcim_region_slug_ff078a66_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_slug_ff078a66_like ON public.dcim_region USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_region_tree_id_a09ea9a7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_tree_id_a09ea9a7 ON public.dcim_region USING btree (tree_id);


--
-- Name: dcim_site_asns_asn_id_3cfd0f00; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_asns_asn_id_3cfd0f00 ON public.dcim_site_asns USING btree (asn_id);


--
-- Name: dcim_site_asns_site_id_112ccacf; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_asns_site_id_112ccacf ON public.dcim_site_asns USING btree (site_id);


--
-- Name: dcim_site_group_id_3910c975; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_group_id_3910c975 ON public.dcim_site USING btree (group_id);


--
-- Name: dcim_site_name_8fe66c76_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_name_8fe66c76_like ON public.dcim_site USING btree (name varchar_pattern_ops);


--
-- Name: dcim_site_region_id_45210932; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_region_id_45210932 ON public.dcim_site USING btree (region_id);


--
-- Name: dcim_site_slug_4412c762_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_slug_4412c762_like ON public.dcim_site USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_site_tenant_id_15e7df63; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_tenant_id_15e7df63 ON public.dcim_site USING btree (tenant_id);


--
-- Name: dcim_sitegroup_name; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_sitegroup_name ON public.dcim_sitegroup USING btree (name) WHERE (parent_id IS NULL);


--
-- Name: dcim_sitegroup_parent_id_533a5e44; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_parent_id_533a5e44 ON public.dcim_sitegroup USING btree (parent_id);


--
-- Name: dcim_sitegroup_slug; Type: INDEX; Schema: public; Owner: netbox
--

CREATE UNIQUE INDEX dcim_sitegroup_slug ON public.dcim_sitegroup USING btree (slug) WHERE (parent_id IS NULL);


--
-- Name: dcim_sitegroup_slug_a11d2b04; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_slug_a11d2b04 ON public.dcim_sitegroup USING btree (slug);


--
-- Name: dcim_sitegroup_slug_a11d2b04_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_slug_a11d2b04_like ON public.dcim_sitegroup USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_sitegroup_tree_id_e76dc999; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_tree_id_e76dc999 ON public.dcim_sitegroup USING btree (tree_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: extras_configcontext_cluster_groups_clustergroup_id_f4322ce8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_clustergroup_id_f4322ce8 ON public.extras_configcontext_cluster_groups USING btree (clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups_configcontext_id_8f50b794; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_configcontext_id_8f50b794 ON public.extras_configcontext_cluster_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_cluster_types_clustertype_id_fa493b64; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_types_clustertype_id_fa493b64 ON public.extras_configcontext_cluster_types USING btree (clustertype_id);


--
-- Name: extras_configcontext_cluster_types_configcontext_id_d549b6f2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_types_configcontext_id_d549b6f2 ON public.extras_configcontext_cluster_types USING btree (configcontext_id);


--
-- Name: extras_configcontext_clusters_cluster_id_6abd47a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_cluster_id_6abd47a1 ON public.extras_configcontext_clusters USING btree (cluster_id);


--
-- Name: extras_configcontext_clusters_configcontext_id_ed579a40; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_configcontext_id_ed579a40 ON public.extras_configcontext_clusters USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_configcontext_id_55632923; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_device_types_configcontext_id_55632923 ON public.extras_configcontext_device_types USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_devicetype_id_b8788c2d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_device_types_devicetype_id_b8788c2d ON public.extras_configcontext_device_types USING btree (devicetype_id);


--
-- Name: extras_configcontext_name_4bbfe25d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_name_4bbfe25d_like ON public.extras_configcontext USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontext_platforms_configcontext_id_2a516699; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_configcontext_id_2a516699 ON public.extras_configcontext_platforms USING btree (configcontext_id);


--
-- Name: extras_configcontext_platforms_platform_id_3fdfedc0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_platform_id_3fdfedc0 ON public.extras_configcontext_platforms USING btree (platform_id);


--
-- Name: extras_configcontext_regions_configcontext_id_73003dbc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_configcontext_id_73003dbc ON public.extras_configcontext_regions USING btree (configcontext_id);


--
-- Name: extras_configcontext_regions_region_id_35c6ba9d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_region_id_35c6ba9d ON public.extras_configcontext_regions USING btree (region_id);


--
-- Name: extras_configcontext_roles_configcontext_id_59b67386; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_configcontext_id_59b67386 ON public.extras_configcontext_roles USING btree (configcontext_id);


--
-- Name: extras_configcontext_roles_devicerole_id_d3a84813; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_devicerole_id_d3a84813 ON public.extras_configcontext_roles USING btree (devicerole_id);


--
-- Name: extras_configcontext_site_groups_configcontext_id_2e0f43cb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_site_groups_configcontext_id_2e0f43cb ON public.extras_configcontext_site_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_site_groups_sitegroup_id_3287c9e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_site_groups_sitegroup_id_3287c9e7 ON public.extras_configcontext_site_groups USING btree (sitegroup_id);


--
-- Name: extras_configcontext_sites_configcontext_id_8c54feb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_configcontext_id_8c54feb9 ON public.extras_configcontext_sites USING btree (configcontext_id);


--
-- Name: extras_configcontext_sites_site_id_cbb76c96; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_site_id_cbb76c96 ON public.extras_configcontext_sites USING btree (site_id);


--
-- Name: extras_configcontext_tags_configcontext_id_64a392b1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_configcontext_id_64a392b1 ON public.extras_configcontext_tags USING btree (configcontext_id);


--
-- Name: extras_configcontext_tags_tag_id_129a5d87; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_tag_id_129a5d87 ON public.extras_configcontext_tags USING btree (tag_id);


--
-- Name: extras_configcontext_tenant_groups_configcontext_id_92f68345; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_configcontext_id_92f68345 ON public.extras_configcontext_tenant_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenant_groups_tenantgroup_id_0909688d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_tenantgroup_id_0909688d ON public.extras_configcontext_tenant_groups USING btree (tenantgroup_id);


--
-- Name: extras_configcontext_tenants_configcontext_id_b53552a6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_configcontext_id_b53552a6 ON public.extras_configcontext_tenants USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenants_tenant_id_8d0aa28e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_tenant_id_8d0aa28e ON public.extras_configcontext_tenants USING btree (tenant_id);


--
-- Name: extras_customfield_content_types_contenttype_id_2997ba90; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_content_types_contenttype_id_2997ba90 ON public.extras_customfield_content_types USING btree (contenttype_id);


--
-- Name: extras_customfield_content_types_customfield_id_3842aaf3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_content_types_customfield_id_3842aaf3 ON public.extras_customfield_content_types USING btree (customfield_id);


--
-- Name: extras_customfield_name_2fe72707_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_name_2fe72707_like ON public.extras_customfield USING btree (name varchar_pattern_ops);


--
-- Name: extras_customfield_object_type_id_489f2239; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_object_type_id_489f2239 ON public.extras_customfield USING btree (object_type_id);


--
-- Name: extras_customlink_content_type_id_4d35b063; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_content_type_id_4d35b063 ON public.extras_customlink USING btree (content_type_id);


--
-- Name: extras_customlink_name_daed2d18_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_name_daed2d18_like ON public.extras_customlink USING btree (name varchar_pattern_ops);


--
-- Name: extras_exporttemplate_content_type_id_59737e21; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_exporttemplate_content_type_id_59737e21 ON public.extras_exporttemplate USING btree (content_type_id);


--
-- Name: extras_imageattachment_content_type_id_90e0643d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_imageattachment_content_type_id_90e0643d ON public.extras_imageattachment USING btree (content_type_id);


--
-- Name: extras_jobresult_obj_type_id_475e80aa; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_obj_type_id_475e80aa ON public.extras_jobresult USING btree (obj_type_id);


--
-- Name: extras_jobresult_user_id_d35285ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_user_id_d35285ab ON public.extras_jobresult USING btree (user_id);


--
-- Name: extras_journalentry_assigned_object_type_id_1bba9f68; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_journalentry_assigned_object_type_id_1bba9f68 ON public.extras_journalentry USING btree (assigned_object_type_id);


--
-- Name: extras_journalentry_created_by_id_8d4e4329; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_journalentry_created_by_id_8d4e4329 ON public.extras_journalentry USING btree (created_by_id);


--
-- Name: extras_objectchange_changed_object_type_id_b755bb60; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_changed_object_type_id_b755bb60 ON public.extras_objectchange USING btree (changed_object_type_id);


--
-- Name: extras_objectchange_related_object_type_id_fe6e521f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_related_object_type_id_fe6e521f ON public.extras_objectchange USING btree (related_object_type_id);


--
-- Name: extras_objectchange_time_224380ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_time_224380ea ON public.extras_objectchange USING btree ("time");


--
-- Name: extras_objectchange_user_id_7fdf8186; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_user_id_7fdf8186 ON public.extras_objectchange USING btree (user_id);


--
-- Name: extras_tag_name_9550b3d9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_name_9550b3d9_like ON public.extras_tag USING btree (name varchar_pattern_ops);


--
-- Name: extras_tag_slug_aaa5b7e9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_slug_aaa5b7e9_like ON public.extras_tag USING btree (slug varchar_pattern_ops);


--
-- Name: extras_taggeditem_content_type_id_ba5562ed; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_ba5562ed ON public.extras_taggeditem USING btree (content_type_id);


--
-- Name: extras_taggeditem_content_type_id_object_id_80e28e23_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_object_id_80e28e23_idx ON public.extras_taggeditem USING btree (content_type_id, object_id);


--
-- Name: extras_taggeditem_object_id_31b2aa77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_object_id_31b2aa77 ON public.extras_taggeditem USING btree (object_id);


--
-- Name: extras_taggeditem_tag_id_d48af7c7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_tag_id_d48af7c7 ON public.extras_taggeditem USING btree (tag_id);


--
-- Name: extras_webhook_content_types_contenttype_id_3fc2c4d3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_content_types_contenttype_id_3fc2c4d3 ON public.extras_webhook_content_types USING btree (contenttype_id);


--
-- Name: extras_webhook_content_types_webhook_id_0c169800; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_content_types_webhook_id_0c169800 ON public.extras_webhook_content_types USING btree (webhook_id);


--
-- Name: extras_webhook_name_82cf60b5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_name_82cf60b5_like ON public.extras_webhook USING btree (name varchar_pattern_ops);


--
-- Name: ipam_aggregate_rir_id_ef7a27bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_rir_id_ef7a27bd ON public.ipam_aggregate USING btree (rir_id);


--
-- Name: ipam_aggregate_tenant_id_637dd1a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_tenant_id_637dd1a1 ON public.ipam_aggregate USING btree (tenant_id);


--
-- Name: ipam_asn_rir_id_f5ad3cff; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_asn_rir_id_f5ad3cff ON public.ipam_asn USING btree (rir_id);


--
-- Name: ipam_asn_tenant_id_07e8188e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_asn_tenant_id_07e8188e ON public.ipam_asn USING btree (tenant_id);


--
-- Name: ipam_fhrpgroupassignment_group_id_19f15ca4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_fhrpgroupassignment_group_id_19f15ca4 ON public.ipam_fhrpgroupassignment USING btree (group_id);


--
-- Name: ipam_fhrpgroupassignment_interface_type_id_f3bcb487; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_fhrpgroupassignment_interface_type_id_f3bcb487 ON public.ipam_fhrpgroupassignment USING btree (interface_type_id);


--
-- Name: ipam_ipaddress_assigned_object_type_id_02354370; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_assigned_object_type_id_02354370 ON public.ipam_ipaddress USING btree (assigned_object_type_id);


--
-- Name: ipam_ipaddress_tenant_id_ac55acfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_tenant_id_ac55acfd ON public.ipam_ipaddress USING btree (tenant_id);


--
-- Name: ipam_ipaddress_vrf_id_51fcc59b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_vrf_id_51fcc59b ON public.ipam_ipaddress USING btree (vrf_id);


--
-- Name: ipam_iprange_role_id_2782e864; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_role_id_2782e864 ON public.ipam_iprange USING btree (role_id);


--
-- Name: ipam_iprange_tenant_id_856027ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_tenant_id_856027ea ON public.ipam_iprange USING btree (tenant_id);


--
-- Name: ipam_iprange_vrf_id_613e9dd2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_vrf_id_613e9dd2 ON public.ipam_iprange USING btree (vrf_id);


--
-- Name: ipam_prefix_role_id_0a98d415; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_role_id_0a98d415 ON public.ipam_prefix USING btree (role_id);


--
-- Name: ipam_prefix_site_id_0b20df05; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_site_id_0b20df05 ON public.ipam_prefix USING btree (site_id);


--
-- Name: ipam_prefix_tenant_id_7ba1fcc4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_tenant_id_7ba1fcc4 ON public.ipam_prefix USING btree (tenant_id);


--
-- Name: ipam_prefix_vlan_id_1db91bff; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vlan_id_1db91bff ON public.ipam_prefix USING btree (vlan_id);


--
-- Name: ipam_prefix_vrf_id_34f78ed0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vrf_id_34f78ed0 ON public.ipam_prefix USING btree (vrf_id);


--
-- Name: ipam_rir_name_64a71982_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_name_64a71982_like ON public.ipam_rir USING btree (name varchar_pattern_ops);


--
-- Name: ipam_rir_slug_ff1a369a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_slug_ff1a369a_like ON public.ipam_rir USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_role_name_13784849_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_name_13784849_like ON public.ipam_role USING btree (name varchar_pattern_ops);


--
-- Name: ipam_role_slug_309ca14c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_slug_309ca14c_like ON public.ipam_role USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_routetarget_name_212be79f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_name_212be79f_like ON public.ipam_routetarget USING btree (name varchar_pattern_ops);


--
-- Name: ipam_routetarget_tenant_id_5a0b35e8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_tenant_id_5a0b35e8 ON public.ipam_routetarget USING btree (tenant_id);


--
-- Name: ipam_service_device_id_b4d2bb9c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_device_id_b4d2bb9c ON public.ipam_service USING btree (device_id);


--
-- Name: ipam_service_ipaddresses_ipaddress_id_b4138c6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_ipaddress_id_b4138c6d ON public.ipam_service_ipaddresses USING btree (ipaddress_id);


--
-- Name: ipam_service_ipaddresses_service_id_ae26b9ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_service_id_ae26b9ab ON public.ipam_service_ipaddresses USING btree (service_id);


--
-- Name: ipam_service_virtual_machine_id_e8b53562; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_virtual_machine_id_e8b53562 ON public.ipam_service USING btree (virtual_machine_id);


--
-- Name: ipam_servicetemplate_name_1a2f3410_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_servicetemplate_name_1a2f3410_like ON public.ipam_servicetemplate USING btree (name varchar_pattern_ops);


--
-- Name: ipam_vlan_group_id_88cbfa62; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_group_id_88cbfa62 ON public.ipam_vlan USING btree (group_id);


--
-- Name: ipam_vlan_role_id_f5015962; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_role_id_f5015962 ON public.ipam_vlan USING btree (role_id);


--
-- Name: ipam_vlan_site_id_a59334e3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_site_id_a59334e3 ON public.ipam_vlan USING btree (site_id);


--
-- Name: ipam_vlan_tenant_id_71a8290d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_tenant_id_71a8290d ON public.ipam_vlan USING btree (tenant_id);


--
-- Name: ipam_vlangroup_scope_type_id_6606a755; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_scope_type_id_6606a755 ON public.ipam_vlangroup USING btree (scope_type_id);


--
-- Name: ipam_vlangroup_slug_40abcf6b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b ON public.ipam_vlangroup USING btree (slug);


--
-- Name: ipam_vlangroup_slug_40abcf6b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b_like ON public.ipam_vlangroup USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_vrf_export_targets_routetarget_id_8d9319f7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_routetarget_id_8d9319f7 ON public.ipam_vrf_export_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_export_targets_vrf_id_6f4875c4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_vrf_id_6f4875c4 ON public.ipam_vrf_export_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_import_targets_routetarget_id_0e05b144; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_routetarget_id_0e05b144 ON public.ipam_vrf_import_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_import_targets_vrf_id_ed491b19; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_vrf_id_ed491b19 ON public.ipam_vrf_import_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_rd_0ac1bde1_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_rd_0ac1bde1_like ON public.ipam_vrf USING btree (rd varchar_pattern_ops);


--
-- Name: ipam_vrf_tenant_id_498b0051; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_tenant_id_498b0051 ON public.ipam_vrf USING btree (tenant_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: tenancy_contact_group_id_76e0267c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contact_group_id_76e0267c ON public.tenancy_contact USING btree (group_id);


--
-- Name: tenancy_contactassignment_contact_id_5302baf0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactassignment_contact_id_5302baf0 ON public.tenancy_contactassignment USING btree (contact_id);


--
-- Name: tenancy_contactassignment_content_type_id_0c3f0c67; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactassignment_content_type_id_0c3f0c67 ON public.tenancy_contactassignment USING btree (content_type_id);


--
-- Name: tenancy_contactassignment_role_id_fc08bfb5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactassignment_role_id_fc08bfb5 ON public.tenancy_contactassignment USING btree (role_id);


--
-- Name: tenancy_contactgroup_parent_id_c087d69f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_parent_id_c087d69f ON public.tenancy_contactgroup USING btree (parent_id);


--
-- Name: tenancy_contactgroup_slug_5b0f3e75; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_slug_5b0f3e75 ON public.tenancy_contactgroup USING btree (slug);


--
-- Name: tenancy_contactgroup_slug_5b0f3e75_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_slug_5b0f3e75_like ON public.tenancy_contactgroup USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_contactgroup_tree_id_57456c98; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactgroup_tree_id_57456c98 ON public.tenancy_contactgroup USING btree (tree_id);


--
-- Name: tenancy_contactrole_name_44b01a1f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactrole_name_44b01a1f_like ON public.tenancy_contactrole USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_contactrole_slug_c5837d7d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_contactrole_slug_c5837d7d_like ON public.tenancy_contactrole USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenant_group_id_7daef6f4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_group_id_7daef6f4 ON public.tenancy_tenant USING btree (group_id);


--
-- Name: tenancy_tenant_name_f6e5b2f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_name_f6e5b2f5_like ON public.tenancy_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenant_slug_0716575e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_slug_0716575e_like ON public.tenancy_tenant USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_name_53363199_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_name_53363199_like ON public.tenancy_tenantgroup USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_parent_id_2542fc18; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_parent_id_2542fc18 ON public.tenancy_tenantgroup USING btree (parent_id);


--
-- Name: tenancy_tenantgroup_slug_e2af1cb6_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_slug_e2af1cb6_like ON public.tenancy_tenantgroup USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_tree_id_769a98bf; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_tree_id_769a98bf ON public.tenancy_tenantgroup USING btree (tree_id);


--
-- Name: users_objectpermission_groups_group_id_fb7ba6e0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_group_id_fb7ba6e0 ON public.users_objectpermission_groups USING btree (group_id);


--
-- Name: users_objectpermission_groups_objectpermission_id_2f7cc117; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_objectpermission_id_2f7cc117 ON public.users_objectpermission_groups USING btree (objectpermission_id);


--
-- Name: users_objectpermission_obj_objectpermission_id_38c7d8f5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_obj_objectpermission_id_38c7d8f5 ON public.users_objectpermission_object_types USING btree (objectpermission_id);


--
-- Name: users_objectpermission_object_types_contenttype_id_594b1cc7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_object_types_contenttype_id_594b1cc7 ON public.users_objectpermission_object_types USING btree (contenttype_id);


--
-- Name: users_objectpermission_users_objectpermission_id_78a9c2e6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_objectpermission_id_78a9c2e6 ON public.users_objectpermission_users USING btree (objectpermission_id);


--
-- Name: users_objectpermission_users_user_id_16c0905d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_user_id_16c0905d ON public.users_objectpermission_users USING btree (user_id);


--
-- Name: users_token_key_820deccd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_key_820deccd_like ON public.users_token USING btree (key varchar_pattern_ops);


--
-- Name: users_token_user_id_af964690; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_user_id_af964690 ON public.users_token USING btree (user_id);


--
-- Name: virtualization_cluster_group_id_de379828; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_group_id_de379828 ON public.virtualization_cluster USING btree (group_id);


--
-- Name: virtualization_cluster_site_id_4d5af282; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_site_id_4d5af282 ON public.virtualization_cluster USING btree (site_id);


--
-- Name: virtualization_cluster_tenant_id_bc2868d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_tenant_id_bc2868d0 ON public.virtualization_cluster USING btree (tenant_id);


--
-- Name: virtualization_cluster_type_id_4efafb0a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_type_id_4efafb0a ON public.virtualization_cluster USING btree (type_id);


--
-- Name: virtualization_clustergroup_name_4fcd26b4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_name_4fcd26b4_like ON public.virtualization_clustergroup USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustergroup_slug_57ca1d23_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_slug_57ca1d23_like ON public.virtualization_clustergroup USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_clustertype_name_ea854d3d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_name_ea854d3d_like ON public.virtualization_clustertype USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustertype_slug_8ee4d0e0_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_slug_8ee4d0e0_like ON public.virtualization_clustertype USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_cluster_id_6c9f9047; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_cluster_id_6c9f9047 ON public.virtualization_virtualmachine USING btree (cluster_id);


--
-- Name: virtualization_virtualmachine_platform_id_a6c5ccb2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_platform_id_a6c5ccb2 ON public.virtualization_virtualmachine USING btree (platform_id);


--
-- Name: virtualization_virtualmachine_role_id_0cc898f9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_role_id_0cc898f9 ON public.virtualization_virtualmachine USING btree (role_id);


--
-- Name: virtualization_virtualmachine_tenant_id_d00d1d77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_tenant_id_d00d1d77 ON public.virtualization_virtualmachine USING btree (tenant_id);


--
-- Name: virtualization_vminterface_bridge_id_7462b91e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_bridge_id_7462b91e ON public.virtualization_vminterface USING btree (bridge_id);


--
-- Name: virtualization_vminterface_parent_id_f86958e1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_parent_id_f86958e1 ON public.virtualization_vminterface USING btree (parent_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vlan_id_4e77411e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vlan_id_4e77411e ON public.virtualization_vminterface_tagged_vlans USING btree (vlan_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vminterface_id_904b12de; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vminterface_id_904b12de ON public.virtualization_vminterface_tagged_vlans USING btree (vminterface_id);


--
-- Name: virtualization_vminterface_untagged_vlan_id_aea4fc69; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_untagged_vlan_id_aea4fc69 ON public.virtualization_vminterface USING btree (untagged_vlan_id);


--
-- Name: virtualization_vminterface_virtual_machine_id_e9f89829; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_virtual_machine_id_e9f89829 ON public.virtualization_vminterface USING btree (virtual_machine_id);


--
-- Name: virtualization_vminterface_vrf_id_4b570a8c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_vrf_id_4b570a8c ON public.virtualization_vminterface USING btree (vrf_id);


--
-- Name: wireless_wirelesslan_group_id_d9e3d67f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslan_group_id_d9e3d67f ON public.wireless_wirelesslan USING btree (group_id);


--
-- Name: wireless_wirelesslan_vlan_id_d7fa6ccc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslan_vlan_id_d7fa6ccc ON public.wireless_wirelesslan USING btree (vlan_id);


--
-- Name: wireless_wirelesslangroup_name_2ffd60c8_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_name_2ffd60c8_like ON public.wireless_wirelesslangroup USING btree (name varchar_pattern_ops);


--
-- Name: wireless_wirelesslangroup_parent_id_37ca8b87; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_parent_id_37ca8b87 ON public.wireless_wirelesslangroup USING btree (parent_id);


--
-- Name: wireless_wirelesslangroup_slug_f5d59831_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_slug_f5d59831_like ON public.wireless_wirelesslangroup USING btree (slug varchar_pattern_ops);


--
-- Name: wireless_wirelesslangroup_tree_id_eb99115d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslangroup_tree_id_eb99115d ON public.wireless_wirelesslangroup USING btree (tree_id);


--
-- Name: wireless_wirelesslink__interface_a_device_id_6c8e042e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink__interface_a_device_id_6c8e042e ON public.wireless_wirelesslink USING btree (_interface_a_device_id);


--
-- Name: wireless_wirelesslink__interface_b_device_id_43d5101a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink__interface_b_device_id_43d5101a ON public.wireless_wirelesslink USING btree (_interface_b_device_id);


--
-- Name: wireless_wirelesslink_interface_a_id_bc9e37fd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink_interface_a_id_bc9e37fd ON public.wireless_wirelesslink USING btree (interface_a_id);


--
-- Name: wireless_wirelesslink_interface_b_id_a82fb2ee; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX wireless_wirelesslink_interface_b_id_a82fb2ee ON public.wireless_wirelesslink USING btree (interface_b_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_provider_id_d9195418_fk_circuits_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_d9195418_fk_circuits_provider_id FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_a_id_f891adac_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_a_id_f891adac_fk_circuits_ FOREIGN KEY (termination_a_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_z_id_377b8551_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_z_id_377b8551_fk_circuits_ FOREIGN KEY (termination_z_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id FOREIGN KEY (type_id) REFERENCES public.circuits_circuittype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm__link_peer_type_id_4c96d182_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm__link_peer_type_id_4c96d182_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_circuit_id_257e87e7_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_circuit_id_257e87e7_fk_circuits_ FOREIGN KEY (circuit_id) REFERENCES public.circuits_circuit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_ FOREIGN KEY (provider_network_id) REFERENCES public.circuits_providernetwork(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_provider_asns circuits_provider_as_provider_id_becc3f7e_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_as_provider_id_becc3f7e_fk_circuits_ FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_provider_asns circuits_provider_asns_asn_id_0a6c53b3_fk_ipam_asn_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider_asns
    ADD CONSTRAINT circuits_provider_asns_asn_id_0a6c53b3_fk_ipam_asn_id FOREIGN KEY (asn_id) REFERENCES public.ipam_asn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_providernetwork circuits_providernet_provider_id_7992236c_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernet_provider_id_7992236c_fk_circuits_ FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id FOREIGN KEY (_termination_a_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id FOREIGN KEY (_termination_b_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_tenant_id_3a7fdbb8_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_tenant_id_3a7fdbb8_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_a_type_i_a614bab8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_i_a614bab8_fk_django_co FOREIGN KEY (termination_a_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_b_type_i_a91595d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_i_a91595d0_fk_django_co FOREIGN KEY (termination_b_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_destination_type_id_a8c1654b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_destination_type_id_a8c1654b_fk_django_co FOREIGN KEY (destination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_6de54f6d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_6de54f6d_fk_django_co FOREIGN KEY (origin_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__link_peer_type_id_5ee0ae35_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__link_peer_type_id_5ee0ae35_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_module_id_d17b2519_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_module_id_d17b2519_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_module_type_id_c0f35d97_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_module_type_id_c0f35d97_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverpo__link_peer_type_id_656047f9_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverpo__link_peer_type_id_656047f9_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_module_type_id_4abf751a_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_module_type_id_4abf751a_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_module_id_d060cfc8_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_module_id_d060cfc8_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id FOREIGN KEY (device_role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_location_id_11a7bedb_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_location_id_11a7bedb_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_platform_id_468138f1_fk_dcim_platform_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_platform_id_468138f1_fk_dcim_platform_id FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_rack_id_23bde71f_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_23bde71f_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_site_id_ff897cf6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_ff897cf6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt FOREIGN KEY (virtual_chassis_id) REFERENCES public.dcim_virtualchassis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id FOREIGN KEY (installed_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebaytemplate dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport__link_peer_type_id_c80bef1d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport__link_peer_type_id_c80bef1d_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_device_id_950557b5_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_950557b5_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_module_id_952c3f9a_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_module_id_952c3f9a_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_module_type_id_66851ff9_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_module_type_id_66851ff9_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__link_peer_type_id_a229a4ea_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__link_peer_type_id_a229a4ea_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id FOREIGN KEY (bridge_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_cable_id_1b264edb_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_cable_id_1b264edb_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_device_id_359c6115_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_359c6115_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id FOREIGN KEY (lag_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_module_id_05ca2da5_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_module_id_05ca2da5_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_parent_id_3e2b159b_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_parent_id_3e2b159b_fk_dcim_interface_id FOREIGN KEY (parent_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_wireless_lans dcim_interface_wirel_interface_id_80df3785_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wirel_interface_id_80df3785_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_wireless_lans dcim_interface_wirel_wirelesslan_id_f081e278_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_wireless_lans
    ADD CONSTRAINT dcim_interface_wirel_wirelesslan_id_f081e278_fk_wireless_ FOREIGN KEY (wirelesslan_id) REFERENCES public.wireless_wirelesslan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_wireless_link_id_bc91108f_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_wireless_link_id_bc91108f_fk_wireless_ FOREIGN KEY (wireless_link_id) REFERENCES public.wireless_wirelesslink(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_module_type_id_f941f180_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_module_type_id_f941f180_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_component_type_id_f0e4d83a_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_component_type_id_f0e4d83a_fk_django_co FOREIGN KEY (component_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_role_id_2bcfcb04_fk_dcim_inve; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_role_id_2bcfcb04_fk_dcim_inve FOREIGN KEY (role_id) REFERENCES public.dcim_inventoryitemrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_component_type_id_161623a2_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_component_type_id_161623a2_fk_django_co FOREIGN KEY (component_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_device_type_id_6a1be904_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_device_type_id_6a1be904_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_manufacturer_id_b388c5d9_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_manufacturer_id_b388c5d9_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_parent_id_0dac73bb_fk_dcim_inve; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_parent_id_0dac73bb_fk_dcim_inve FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitemtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitemtemplate dcim_inventoryitemte_role_id_292676e6_fk_dcim_inve; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitemtemplate
    ADD CONSTRAINT dcim_inventoryitemte_role_id_292676e6_fk_dcim_inve FOREIGN KEY (role_id) REFERENCES public.dcim_inventoryitemrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_parent_id_d77f3318_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_id_d77f3318_fk_dcim_location_id FOREIGN KEY (parent_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_site_id_b55e975f_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_site_id_b55e975f_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_tenant_id_2c4df974_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_tenant_id_2c4df974_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_module dcim_module_device_id_53cfd5be_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_device_id_53cfd5be_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_module dcim_module_module_bay_id_8a1bf3e2_fk_dcim_modulebay_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_module_bay_id_8a1bf3e2_fk_dcim_modulebay_id FOREIGN KEY (module_bay_id) REFERENCES public.dcim_modulebay(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_module dcim_module_module_type_id_a50b39fc_fk_dcim_moduletype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_module
    ADD CONSTRAINT dcim_module_module_type_id_a50b39fc_fk_dcim_moduletype_id FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_modulebay dcim_modulebay_device_id_3526abc2_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebay
    ADD CONSTRAINT dcim_modulebay_device_id_3526abc2_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_modulebaytemplate dcim_modulebaytempla_device_type_id_9eaf9bd3_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_modulebaytemplate
    ADD CONSTRAINT dcim_modulebaytempla_device_type_id_9eaf9bd3_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_moduletype dcim_moduletype_manufacturer_id_7347392e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_moduletype
    ADD CONSTRAINT dcim_moduletype_manufacturer_id_7347392e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_platform dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__link_peer_type_id_e496c241_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__link_peer_type_id_e496c241_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id FOREIGN KEY (power_panel_id) REFERENCES public.dcim_powerpanel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__link_peer_type_id_caf100f3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__link_peer_type_id_caf100f3_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_module_id_032f5af2_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_module_id_032f5af2_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_module_type_id_6142b416_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_module_type_id_6142b416_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__link_peer_type_id_92f4681f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__link_peer_type_id_92f4681f_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_device_id_ef7185ae_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_ef7185ae_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_module_id_d0c27534_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_module_id_d0c27534_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_module_type_id_93e26849_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_module_type_id_93e26849_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_location_id_5f63ec31_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_5f63ec31_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id FOREIGN KEY (role_id) REFERENCES public.dcim_rackrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_site_id_403c7b3a_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_403c7b3a_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_user_id_0785a527_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_user_id_0785a527_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport__link_peer_type_id_f9d77e49_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport__link_peer_type_id_f9d77e49_fk_django_co FOREIGN KEY (_link_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_module_id_9a7b7e91_fk_dcim_module_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_module_id_9a7b7e91_fk_dcim_module_id FOREIGN KEY (module_id) REFERENCES public.dcim_module(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_module_type_id_4d970e5b_fk_dcim_modu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_module_type_id_4d970e5b_fk_dcim_modu FOREIGN KEY (module_type_id) REFERENCES public.dcim_moduletype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_region dcim_region_parent_id_2486f5d4_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_id_2486f5d4_fk_dcim_region_id FOREIGN KEY (parent_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site_asns dcim_site_asns_asn_id_3cfd0f00_fk_ipam_asn_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_asn_id_3cfd0f00_fk_ipam_asn_id FOREIGN KEY (asn_id) REFERENCES public.ipam_asn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site_asns dcim_site_asns_site_id_112ccacf_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site_asns
    ADD CONSTRAINT dcim_site_asns_site_id_112ccacf_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_group_id_3910c975_fk_dcim_sitegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_group_id_3910c975_fk_dcim_sitegroup_id FOREIGN KEY (group_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_region_id_45210932_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_region_id_45210932_fk_dcim_region_id FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_sitegroup dcim_sitegroup_parent_id_533a5e44_fk_dcim_sitegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_parent_id_533a5e44_fk_dcim_sitegroup_id FOREIGN KEY (parent_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id FOREIGN KEY (master_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_cluster_id_6abd47a1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_cluster_id_6abd47a1_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz FOREIGN KEY (clustergroup_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_types extras_configcontext_clustertype_id_fa493b64_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_clustertype_id_fa493b64_fk_virtualiz FOREIGN KEY (clustertype_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_configcontext_id_2a516699_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_configcontext_id_2a516699_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_site_groups extras_configcontext_configcontext_id_2e0f43cb_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_2e0f43cb_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_configcontext_id_55632923_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_configcontext_id_55632923_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_configcontext_id_59b67386_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_configcontext_id_59b67386_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_configcontext_id_64a392b1_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_configcontext_id_64a392b1_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_configcontext_id_73003dbc_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_configcontext_id_73003dbc_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_configcontext_id_8c54feb9_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_configcontext_id_8c54feb9_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_configcontext_id_8f50b794_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_8f50b794_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_configcontext_id_92f68345_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_92f68345_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_configcontext_id_b53552a6_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_configcontext_id_b53552a6_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_types extras_configcontext_configcontext_id_d549b6f2_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_types
    ADD CONSTRAINT extras_configcontext_configcontext_id_d549b6f2_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_configcontext_id_ed579a40_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_configcontext_id_ed579a40_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi FOREIGN KEY (devicerole_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi FOREIGN KEY (devicetype_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_region_id_35c6ba9d_fk_dcim_regi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_region_id_35c6ba9d_fk_dcim_regi FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_site_groups extras_configcontext_sitegroup_id_3287c9e7_fk_dcim_site; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_sitegroup_id_3287c9e7_fk_dcim_site FOREIGN KEY (sitegroup_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t FOREIGN KEY (tenantgroup_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_contenttype_id_2997ba90_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_contenttype_id_2997ba90_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu FOREIGN KEY (customfield_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield extras_customfield_object_type_id_489f2239_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_object_type_id_489f2239_fk_django_co FOREIGN KEY (object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customlink extras_customlink_content_type_id_4d35b063_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_content_type_id_4d35b063_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate extras_exporttemplat_content_type_id_59737e21_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplat_content_type_id_59737e21_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_imageattachment extras_imageattachme_content_type_id_90e0643d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachme_content_type_id_90e0643d_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id FOREIGN KEY (obj_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_user_id_d35285ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_user_id_d35285ab_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_journalentry extras_journalentry_assigned_object_type_1bba9f68_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_assigned_object_type_1bba9f68_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_journalentry extras_journalentry_created_by_id_8d4e4329_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_created_by_id_8d4e4329_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_changed_object_type__b755bb60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_changed_object_type__b755bb60_fk_django_co FOREIGN KEY (changed_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_related_object_type__fe6e521f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_related_object_type__fe6e521f_fk_django_co FOREIGN KEY (related_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_user_id_7fdf8186_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_user_id_7fdf8186_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_content_type_id_ba5562ed_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_content_type_id_ba5562ed_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_webhook_id_0c169800_fk_extras_we; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_webhook_id_0c169800_fk_extras_we FOREIGN KEY (webhook_id) REFERENCES public.extras_webhook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_asn ipam_asn_rir_id_f5ad3cff_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_rir_id_f5ad3cff_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_asn ipam_asn_tenant_id_07e8188e_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_asn
    ADD CONSTRAINT ipam_asn_tenant_id_07e8188e_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassign_interface_type_id_f3bcb487_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassign_interface_type_id_f3bcb487_fk_django_co FOREIGN KEY (interface_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_fhrpgroupassignment ipam_fhrpgroupassignment_group_id_19f15ca4_fk_ipam_fhrpgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_fhrpgroupassignment
    ADD CONSTRAINT ipam_fhrpgroupassignment_group_id_19f15ca4_fk_ipam_fhrpgroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_fhrpgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_assigned_object_type_02354370_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_assigned_object_type_02354370_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id FOREIGN KEY (nat_inside_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_role_id_2782e864_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_role_id_2782e864_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_tenant_id_856027ea_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_tenant_id_856027ea_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_vrf_id_613e9dd2_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_vrf_id_613e9dd2_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_role_id_0a98d415_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_role_id_0a98d415_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_site_id_0b20df05_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_site_id_0b20df05_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_routetarget ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_device_id_b4d2bb9c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_device_id_b4d2bb9c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad FOREIGN KEY (ipaddress_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id FOREIGN KEY (service_id) REFERENCES public.ipam_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_virtual_machine_id_e8b53562_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_virtual_machine_id_e8b53562_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_vlangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_role_id_f5015962_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_role_id_f5015962_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_site_id_a59334e3_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_site_id_a59334e3_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_6606a755_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_6606a755_fk_django_content_type_id FOREIGN KEY (scope_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contact tenancy_contact_group_id_76e0267c_fk_tenancy_contactgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contact
    ADD CONSTRAINT tenancy_contact_group_id_76e0267c_fk_tenancy_contactgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_contactgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactassignment tenancy_contactassig_contact_id_5302baf0_fk_tenancy_c; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassig_contact_id_5302baf0_fk_tenancy_c FOREIGN KEY (contact_id) REFERENCES public.tenancy_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactassignment tenancy_contactassig_content_type_id_0c3f0c67_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassig_content_type_id_0c3f0c67_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactassignment tenancy_contactassig_role_id_fc08bfb5_fk_tenancy_c; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactassignment
    ADD CONSTRAINT tenancy_contactassig_role_id_fc08bfb5_fk_tenancy_c FOREIGN KEY (role_id) REFERENCES public.tenancy_contactrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_contactgroup tenancy_contactgroup_parent_id_c087d69f_fk_tenancy_c; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_contactgroup
    ADD CONSTRAINT tenancy_contactgroup_parent_id_c087d69f_fk_tenancy_c FOREIGN KEY (parent_id) REFERENCES public.tenancy_contactgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenant tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t FOREIGN KEY (parent_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_contenttype_id_594b1cc7_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_contenttype_id_594b1cc7_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermission_users_user_id_16c0905d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_user_id_16c0905d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_token users_token_user_id_af964690_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_user_id_af964690_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_userconfig users_userconfig_user_id_afd44184_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_afd44184_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_group_id_de379828_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_group_id_de379828_fk_virtualiz FOREIGN KEY (group_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_type_id_4efafb0a_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_type_id_4efafb0a_fk_virtualiz FOREIGN KEY (type_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_site_id_4d5af282_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_4d5af282_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_role_id_0cc898f9_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_role_id_0cc898f9_fk_dcim_devi FOREIGN KEY (role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_bridge_id_7462b91e_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_bridge_id_7462b91e_fk_virtualiz FOREIGN KEY (bridge_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_parent_id_f86958e1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_parent_id_f86958e1_fk_virtualiz FOREIGN KEY (parent_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vminterface_id_904b12de_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vminterface_id_904b12de_fk_virtualiz FOREIGN KEY (vminterface_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vminterface_vrf_id_4b570a8c_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_vrf_id_4b570a8c_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslan wireless_wirelesslan_group_id_d9e3d67f_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan
    ADD CONSTRAINT wireless_wirelesslan_group_id_d9e3d67f_fk_wireless_ FOREIGN KEY (group_id) REFERENCES public.wireless_wirelesslangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslangroup wireless_wirelesslan_parent_id_37ca8b87_fk_wireless_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslangroup
    ADD CONSTRAINT wireless_wirelesslan_parent_id_37ca8b87_fk_wireless_ FOREIGN KEY (parent_id) REFERENCES public.wireless_wirelesslangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslan wireless_wirelesslan_vlan_id_d7fa6ccc_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslan
    ADD CONSTRAINT wireless_wirelesslan_vlan_id_d7fa6ccc_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin__interface_a_device__6c8e042e_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin__interface_a_device__6c8e042e_fk_dcim_devi FOREIGN KEY (_interface_a_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin__interface_b_device__43d5101a_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin__interface_b_device__43d5101a_fk_dcim_devi FOREIGN KEY (_interface_b_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin_interface_a_id_bc9e37fd_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin_interface_a_id_bc9e37fd_fk_dcim_inte FOREIGN KEY (interface_a_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wireless_wirelesslink wireless_wirelesslin_interface_b_id_a82fb2ee_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.wireless_wirelesslink
    ADD CONSTRAINT wireless_wirelesslin_interface_b_id_a82fb2ee_fk_dcim_inte FOREIGN KEY (interface_b_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

