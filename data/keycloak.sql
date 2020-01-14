--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 11.5

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

SET default_with_oids = false;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak_user;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak_user;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak_user;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak_user;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak_user;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak_user;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak_user;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak_user;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO keycloak_user;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak_user;

--
-- Name: client_default_roles; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_default_roles OWNER TO keycloak_user;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak_user;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak_user;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak_user;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak_user;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak_user;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak_user;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak_user;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak_user;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak_user;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak_user;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak_user;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak_user;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak_user;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak_user;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak_user;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak_user;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak_user;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak_user;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak_user;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak_user;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak_user;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak_user;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak_user;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak_user;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak_user;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak_user;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak_user;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak_user;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak_user;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak_user;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak_user;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak_user;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak_user;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak_user;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak_user;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36),
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak_user;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(36),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak_user;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak_user;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(36) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak_user;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak_user;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak_user;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak_user;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak_user;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.realm OWNER TO keycloak_user;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_attribute OWNER TO keycloak_user;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak_user;

--
-- Name: realm_default_roles; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_roles OWNER TO keycloak_user;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak_user;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak_user;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak_user;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak_user;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak_user;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak_user;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak_user;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak_user;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak_user;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak_user;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak_user;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak_user;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(36) NOT NULL,
    requester character varying(36) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak_user;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(36)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak_user;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(36) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak_user;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak_user;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak_user;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak_user;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak_user;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak_user;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak_user;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak_user;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak_user;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(36),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak_user;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak_user;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak_user;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak_user;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak_user;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak_user;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak_user;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak_user;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak_user;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak_user;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak_user;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak_user
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak_user;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
441333d8-a75c-4c00-8972-867e4b15d20a	1578964981000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	events/config	{"eventsEnabled":true,"eventsListeners":["jboss-logging"],"enabledEventTypes":["LOGIN","LOGIN_ERROR","REGISTER","REGISTER_ERROR","LOGOUT","LOGOUT_ERROR","CODE_TO_TOKEN","CODE_TO_TOKEN_ERROR","CLIENT_LOGIN","CLIENT_LOGIN_ERROR","FEDERATED_IDENTITY_LINK","FEDERATED_IDENTITY_LINK_ERROR","REMOVE_FEDERATED_IDENTITY","REMOVE_FEDERATED_IDENTITY_ERROR","UPDATE_EMAIL","UPDATE_EMAIL_ERROR","UPDATE_PROFILE","UPDATE_PROFILE_ERROR","UPDATE_PASSWORD","UPDATE_PASSWORD_ERROR","UPDATE_TOTP","UPDATE_TOTP_ERROR","VERIFY_EMAIL","VERIFY_EMAIL_ERROR","REMOVE_TOTP","REMOVE_TOTP_ERROR","GRANT_CONSENT","GRANT_CONSENT_ERROR","UPDATE_CONSENT","UPDATE_CONSENT_ERROR","REVOKE_GRANT","REVOKE_GRANT_ERROR","SEND_VERIFY_EMAIL","SEND_VERIFY_EMAIL_ERROR","SEND_RESET_PASSWORD","SEND_RESET_PASSWORD_ERROR","SEND_IDENTITY_PROVIDER_LINK","SEND_IDENTITY_PROVIDER_LINK_ERROR","RESET_PASSWORD","RESET_PASSWORD_ERROR","RESTART_AUTHENTICATION","RESTART_AUTHENTICATION_ERROR","IDENTITY_PROVIDER_LINK_ACCOUNT","IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR","IDENTITY_PROVIDER_FIRST_LOGIN","IDENTITY_PROVIDER_FIRST_LOGIN_ERROR","IDENTITY_PROVIDER_POST_LOGIN","IDENTITY_PROVIDER_POST_LOGIN_ERROR","IMPERSONATE","IMPERSONATE_ERROR","CUSTOM_REQUIRED_ACTION","CUSTOM_REQUIRED_ACTION_ERROR","EXECUTE_ACTIONS","EXECUTE_ACTIONS_ERROR","EXECUTE_ACTION_TOKEN","EXECUTE_ACTION_TOKEN_ERROR","CLIENT_REGISTER","CLIENT_REGISTER_ERROR","CLIENT_UPDATE","CLIENT_UPDATE_ERROR","CLIENT_DELETE","CLIENT_DELETE_ERROR","CLIENT_INITIATED_ACCOUNT_LINKING","CLIENT_INITIATED_ACCOUNT_LINKING_ERROR","TOKEN_EXCHANGE","TOKEN_EXCHANGE_ERROR","PERMISSION_TOKEN"],"adminEventsEnabled":true,"adminEventsDetailsEnabled":true}	\N	REALM
a10c5da8-d59a-47b2-97c4-66aa54c18420	1578964985000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	events/config	{"eventsEnabled":true,"eventsExpiration":0,"eventsListeners":["jboss-logging"],"enabledEventTypes":["LOGIN","LOGIN_ERROR","REGISTER","REGISTER_ERROR","LOGOUT","LOGOUT_ERROR","CODE_TO_TOKEN","CODE_TO_TOKEN_ERROR","CLIENT_LOGIN","CLIENT_LOGIN_ERROR","FEDERATED_IDENTITY_LINK","FEDERATED_IDENTITY_LINK_ERROR","REMOVE_FEDERATED_IDENTITY","REMOVE_FEDERATED_IDENTITY_ERROR","UPDATE_EMAIL","UPDATE_EMAIL_ERROR","UPDATE_PROFILE","UPDATE_PROFILE_ERROR","UPDATE_PASSWORD","UPDATE_PASSWORD_ERROR","UPDATE_TOTP","UPDATE_TOTP_ERROR","VERIFY_EMAIL","VERIFY_EMAIL_ERROR","REMOVE_TOTP","REMOVE_TOTP_ERROR","GRANT_CONSENT","GRANT_CONSENT_ERROR","UPDATE_CONSENT","UPDATE_CONSENT_ERROR","REVOKE_GRANT","REVOKE_GRANT_ERROR","SEND_VERIFY_EMAIL","SEND_VERIFY_EMAIL_ERROR","SEND_RESET_PASSWORD","SEND_RESET_PASSWORD_ERROR","SEND_IDENTITY_PROVIDER_LINK","SEND_IDENTITY_PROVIDER_LINK_ERROR","RESET_PASSWORD","RESET_PASSWORD_ERROR","RESTART_AUTHENTICATION","RESTART_AUTHENTICATION_ERROR","IDENTITY_PROVIDER_LINK_ACCOUNT","IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR","IDENTITY_PROVIDER_FIRST_LOGIN","IDENTITY_PROVIDER_FIRST_LOGIN_ERROR","IDENTITY_PROVIDER_POST_LOGIN","IDENTITY_PROVIDER_POST_LOGIN_ERROR","IMPERSONATE","IMPERSONATE_ERROR","CUSTOM_REQUIRED_ACTION","CUSTOM_REQUIRED_ACTION_ERROR","EXECUTE_ACTIONS","EXECUTE_ACTIONS_ERROR","EXECUTE_ACTION_TOKEN","EXECUTE_ACTION_TOKEN_ERROR","CLIENT_REGISTER","CLIENT_REGISTER_ERROR","CLIENT_UPDATE","CLIENT_UPDATE_ERROR","CLIENT_DELETE","CLIENT_DELETE_ERROR","CLIENT_INITIATED_ACCOUNT_LINKING","CLIENT_INITIATED_ACCOUNT_LINKING_ERROR","TOKEN_EXCHANGE","TOKEN_EXCHANGE_ERROR","PERMISSION_TOKEN"],"adminEventsEnabled":true,"adminEventsDetailsEnabled":true}	\N	REALM
d37157b9-24cc-4088-b040-8a93a94d43d3	1578964992000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	events/config	{"eventsEnabled":true,"eventsExpiration":86400,"eventsListeners":["jboss-logging"],"enabledEventTypes":["LOGIN","LOGIN_ERROR","REGISTER","REGISTER_ERROR","LOGOUT","LOGOUT_ERROR","CODE_TO_TOKEN","CODE_TO_TOKEN_ERROR","CLIENT_LOGIN","CLIENT_LOGIN_ERROR","FEDERATED_IDENTITY_LINK","FEDERATED_IDENTITY_LINK_ERROR","REMOVE_FEDERATED_IDENTITY","REMOVE_FEDERATED_IDENTITY_ERROR","UPDATE_EMAIL","UPDATE_EMAIL_ERROR","UPDATE_PROFILE","UPDATE_PROFILE_ERROR","UPDATE_PASSWORD","UPDATE_PASSWORD_ERROR","UPDATE_TOTP","UPDATE_TOTP_ERROR","VERIFY_EMAIL","VERIFY_EMAIL_ERROR","REMOVE_TOTP","REMOVE_TOTP_ERROR","GRANT_CONSENT","GRANT_CONSENT_ERROR","UPDATE_CONSENT","UPDATE_CONSENT_ERROR","REVOKE_GRANT","REVOKE_GRANT_ERROR","SEND_VERIFY_EMAIL","SEND_VERIFY_EMAIL_ERROR","SEND_RESET_PASSWORD","SEND_RESET_PASSWORD_ERROR","SEND_IDENTITY_PROVIDER_LINK","SEND_IDENTITY_PROVIDER_LINK_ERROR","RESET_PASSWORD","RESET_PASSWORD_ERROR","RESTART_AUTHENTICATION","RESTART_AUTHENTICATION_ERROR","IDENTITY_PROVIDER_LINK_ACCOUNT","IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR","IDENTITY_PROVIDER_FIRST_LOGIN","IDENTITY_PROVIDER_FIRST_LOGIN_ERROR","IDENTITY_PROVIDER_POST_LOGIN","IDENTITY_PROVIDER_POST_LOGIN_ERROR","IMPERSONATE","IMPERSONATE_ERROR","CUSTOM_REQUIRED_ACTION","CUSTOM_REQUIRED_ACTION_ERROR","EXECUTE_ACTIONS","EXECUTE_ACTIONS_ERROR","EXECUTE_ACTION_TOKEN","EXECUTE_ACTION_TOKEN_ERROR","CLIENT_REGISTER","CLIENT_REGISTER_ERROR","CLIENT_UPDATE","CLIENT_UPDATE_ERROR","CLIENT_DELETE","CLIENT_DELETE_ERROR","CLIENT_INITIATED_ACCOUNT_LINKING","CLIENT_INITIATED_ACCOUNT_LINKING_ERROR","TOKEN_EXCHANGE","TOKEN_EXCHANGE_ERROR","PERMISSION_TOKEN"],"adminEventsEnabled":true,"adminEventsDetailsEnabled":true}	\N	REALM
b54232a6-77b0-499a-9137-0cb03348f975	1578965033000	test	CREATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	roles-by-id/e6769c2e-c8b5-43f4-8b4c-327b8af2d12e/composites	[{"id":"e3ebc595-a7b1-4096-b831-bc8f1d7bc663","name":"x-user","composite":false,"clientRole":false,"containerId":"test"}]	\N	REALM_ROLE
147d2051-c112-489a-9e6a-f53bfc542708	1578965103000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	\N	{"id":"test","realm":"Amestris","displayName":"","notBefore":1578804821,"revokeRefreshToken":false,"refreshTokenMaxReuse":0,"accessTokenLifespan":300,"accessTokenLifespanForImplicitFlow":900,"ssoSessionIdleTimeout":1800,"ssoSessionMaxLifespan":36000,"ssoSessionIdleTimeoutRememberMe":0,"ssoSessionMaxLifespanRememberMe":0,"offlineSessionIdleTimeout":2592000,"offlineSessionMaxLifespanEnabled":false,"offlineSessionMaxLifespan":5184000,"accessCodeLifespan":60,"accessCodeLifespanUserAction":300,"accessCodeLifespanLogin":1800,"actionTokenGeneratedByAdminLifespan":43200,"actionTokenGeneratedByUserLifespan":300,"enabled":true,"sslRequired":"external","registrationAllowed":true,"registrationEmailAsUsername":true,"rememberMe":false,"verifyEmail":false,"loginWithEmailAllowed":true,"duplicateEmailsAllowed":false,"resetPasswordAllowed":false,"editUsernameAllowed":false,"bruteForceProtected":false,"permanentLockout":false,"maxFailureWaitSeconds":900,"minimumQuickLoginWaitSeconds":60,"waitIncrementSeconds":60,"quickLoginCheckMilliSeconds":1000,"maxDeltaTimeSeconds":43200,"failureFactor":30,"defaultRoles":["offline_access","uma_authorization"],"requiredCredentials":["password"],"otpPolicyType":"totp","otpPolicyAlgorithm":"HmacSHA1","otpPolicyInitialCounter":0,"otpPolicyDigits":6,"otpPolicyLookAheadWindow":1,"otpPolicyPeriod":30,"otpSupportedApplications":["FreeOTP","Google Authenticator"],"webAuthnPolicyRpEntityName":"keycloak","webAuthnPolicySignatureAlgorithms":["ES256"],"webAuthnPolicyRpId":"","webAuthnPolicyAttestationConveyancePreference":"not specified","webAuthnPolicyAuthenticatorAttachment":"not specified","webAuthnPolicyRequireResidentKey":"not specified","webAuthnPolicyUserVerificationRequirement":"not specified","webAuthnPolicyCreateTimeout":0,"webAuthnPolicyAvoidSameAuthenticatorRegister":false,"webAuthnPolicyAcceptableAaguids":[],"browserSecurityHeaders":{"contentSecurityPolicyReportOnly":"","xContentTypeOptions":"nosniff","xRobotsTag":"none","xFrameOptions":"SAMEORIGIN","contentSecurityPolicy":"frame-src 'self'; frame-ancestors 'self'; object-src 'none';","xXSSProtection":"1; mode=block","strictTransportSecurity":"max-age=31536000; includeSubDomains"},"smtpServer":{},"eventsEnabled":true,"eventsExpiration":86400,"eventsListeners":["jboss-logging"],"enabledEventTypes":["SEND_RESET_PASSWORD","UPDATE_CONSENT_ERROR","GRANT_CONSENT","REVOKE_GRANT","REMOVE_TOTP","UPDATE_TOTP","LOGIN_ERROR","CLIENT_LOGIN","RESET_PASSWORD_ERROR","IMPERSONATE_ERROR","CUSTOM_REQUIRED_ACTION","CODE_TO_TOKEN_ERROR","RESTART_AUTHENTICATION","IMPERSONATE","UPDATE_PROFILE_ERROR","UPDATE_PASSWORD_ERROR","LOGIN","CLIENT_INITIATED_ACCOUNT_LINKING","TOKEN_EXCHANGE","LOGOUT","REGISTER","CLIENT_REGISTER","IDENTITY_PROVIDER_LINK_ACCOUNT","UPDATE_PASSWORD","CLIENT_DELETE","FEDERATED_IDENTITY_LINK_ERROR","IDENTITY_PROVIDER_FIRST_LOGIN","CLIENT_DELETE_ERROR","VERIFY_EMAIL","RESTART_AUTHENTICATION_ERROR","CLIENT_LOGIN_ERROR","TOKEN_EXCHANGE_ERROR","EXECUTE_ACTIONS","REMOVE_FEDERATED_IDENTITY_ERROR","PERMISSION_TOKEN","SEND_IDENTITY_PROVIDER_LINK_ERROR","EXECUTE_ACTION_TOKEN_ERROR","SEND_VERIFY_EMAIL","EXECUTE_ACTIONS_ERROR","REMOVE_FEDERATED_IDENTITY","IDENTITY_PROVIDER_POST_LOGIN","IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR","UPDATE_EMAIL","REGISTER_ERROR","REVOKE_GRANT_ERROR","EXECUTE_ACTION_TOKEN","UPDATE_EMAIL_ERROR","LOGOUT_ERROR","CLIENT_UPDATE_ERROR","UPDATE_PROFILE","CLIENT_REGISTER_ERROR","FEDERATED_IDENTITY_LINK","SEND_IDENTITY_PROVIDER_LINK","SEND_VERIFY_EMAIL_ERROR","RESET_PASSWORD","CLIENT_INITIATED_ACCOUNT_LINKING_ERROR","UPDATE_CONSENT","REMOVE_TOTP_ERROR","VERIFY_EMAIL_ERROR","SEND_RESET_PASSWORD_ERROR","CLIENT_UPDATE","CUSTOM_REQUIRED_ACTION_ERROR","IDENTITY_PROVIDER_POST_LOGIN_ERROR","UPDATE_TOTP_ERROR","CODE_TO_TOKEN","IDENTITY_PROVIDER_FIRST_LOGIN_ERROR","GRANT_CONSENT_ERROR"],"adminEventsEnabled":true,"adminEventsDetailsEnabled":true,"internationalizationEnabled":false,"supportedLocales":[],"browserFlow":"browser","registrationFlow":"registration","directGrantFlow":"direct grant","resetCredentialsFlow":"reset credentials","clientAuthenticationFlow":"clients","dockerAuthenticationFlow":"docker auth","attributes":{"webAuthnPolicyAuthenticatorAttachment":"not specified","displayName":"","_browser_header.xRobotsTag":"none","webAuthnPolicyRpEntityName":"keycloak","failureFactor":"30","actionTokenGeneratedByUserLifespan":"300","maxDeltaTimeSeconds":"43200","webAuthnPolicySignatureAlgorithms":"ES256","offlineSessionMaxLifespan":"5184000","_browser_header.contentSecurityPolicyReportOnly":"","bruteForceProtected":"false","_browser_header.contentSecurityPolicy":"frame-src 'self'; frame-ancestors 'self'; object-src 'none';","_browser_header.xXSSProtection":"1; mode=block","_browser_header.xFrameOptions":"SAMEORIGIN","_browser_header.strictTransportSecurity":"max-age=31536000; includeSubDomains","webAuthnPolicyUserVerificationRequirement":"not specified","permanentLockout":"false","quickLoginCheckMilliSeconds":"1000","webAuthnPolicyCreateTimeout":"0","webAuthnPolicyRequireResidentKey":"not specified","webAuthnPolicyRpId":"","webAuthnPolicyAttestationConveyancePreference":"not specified","maxFailureWaitSeconds":"900","minimumQuickLoginWaitSeconds":"60","webAuthnPolicyAvoidSameAuthenticatorRegister":"false","_browser_header.xContentTypeOptions":"nosniff","actionTokenGeneratedByAdminLifespan":"43200","waitIncrementSeconds":"60","offlineSessionMaxLifespanEnabled":"false"},"userManagedAccessAllowed":false}	\N	REALM
21129161-71ab-45d1-b240-b736e95d29b0	1578965109000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	\N	{"id":"test","realm":"amestris","displayName":"","notBefore":1578804821,"revokeRefreshToken":false,"refreshTokenMaxReuse":0,"accessTokenLifespan":300,"accessTokenLifespanForImplicitFlow":900,"ssoSessionIdleTimeout":1800,"ssoSessionMaxLifespan":36000,"ssoSessionIdleTimeoutRememberMe":0,"ssoSessionMaxLifespanRememberMe":0,"offlineSessionIdleTimeout":2592000,"offlineSessionMaxLifespanEnabled":false,"offlineSessionMaxLifespan":5184000,"accessCodeLifespan":60,"accessCodeLifespanUserAction":300,"accessCodeLifespanLogin":1800,"actionTokenGeneratedByAdminLifespan":43200,"actionTokenGeneratedByUserLifespan":300,"enabled":true,"sslRequired":"external","registrationAllowed":true,"registrationEmailAsUsername":true,"rememberMe":false,"verifyEmail":false,"loginWithEmailAllowed":true,"duplicateEmailsAllowed":false,"resetPasswordAllowed":false,"editUsernameAllowed":false,"bruteForceProtected":false,"permanentLockout":false,"maxFailureWaitSeconds":900,"minimumQuickLoginWaitSeconds":60,"waitIncrementSeconds":60,"quickLoginCheckMilliSeconds":1000,"maxDeltaTimeSeconds":43200,"failureFactor":30,"defaultRoles":["offline_access","uma_authorization"],"requiredCredentials":["password"],"otpPolicyType":"totp","otpPolicyAlgorithm":"HmacSHA1","otpPolicyInitialCounter":0,"otpPolicyDigits":6,"otpPolicyLookAheadWindow":1,"otpPolicyPeriod":30,"otpSupportedApplications":["FreeOTP","Google Authenticator"],"webAuthnPolicyRpEntityName":"keycloak","webAuthnPolicySignatureAlgorithms":["ES256"],"webAuthnPolicyRpId":"","webAuthnPolicyAttestationConveyancePreference":"not specified","webAuthnPolicyAuthenticatorAttachment":"not specified","webAuthnPolicyRequireResidentKey":"not specified","webAuthnPolicyUserVerificationRequirement":"not specified","webAuthnPolicyCreateTimeout":0,"webAuthnPolicyAvoidSameAuthenticatorRegister":false,"webAuthnPolicyAcceptableAaguids":[],"browserSecurityHeaders":{"contentSecurityPolicyReportOnly":"","xContentTypeOptions":"nosniff","xRobotsTag":"none","xFrameOptions":"SAMEORIGIN","contentSecurityPolicy":"frame-src 'self'; frame-ancestors 'self'; object-src 'none';","xXSSProtection":"1; mode=block","strictTransportSecurity":"max-age=31536000; includeSubDomains"},"smtpServer":{},"eventsEnabled":true,"eventsExpiration":86400,"eventsListeners":["jboss-logging"],"enabledEventTypes":["SEND_RESET_PASSWORD","UPDATE_CONSENT_ERROR","GRANT_CONSENT","REVOKE_GRANT","REMOVE_TOTP","UPDATE_TOTP","LOGIN_ERROR","CLIENT_LOGIN","RESET_PASSWORD_ERROR","IMPERSONATE_ERROR","CUSTOM_REQUIRED_ACTION","CODE_TO_TOKEN_ERROR","RESTART_AUTHENTICATION","IMPERSONATE","UPDATE_PROFILE_ERROR","UPDATE_PASSWORD_ERROR","LOGIN","CLIENT_INITIATED_ACCOUNT_LINKING","TOKEN_EXCHANGE","LOGOUT","REGISTER","CLIENT_REGISTER","IDENTITY_PROVIDER_LINK_ACCOUNT","UPDATE_PASSWORD","CLIENT_DELETE","FEDERATED_IDENTITY_LINK_ERROR","IDENTITY_PROVIDER_FIRST_LOGIN","CLIENT_DELETE_ERROR","VERIFY_EMAIL","RESTART_AUTHENTICATION_ERROR","CLIENT_LOGIN_ERROR","TOKEN_EXCHANGE_ERROR","EXECUTE_ACTIONS","REMOVE_FEDERATED_IDENTITY_ERROR","PERMISSION_TOKEN","SEND_IDENTITY_PROVIDER_LINK_ERROR","EXECUTE_ACTION_TOKEN_ERROR","SEND_VERIFY_EMAIL","EXECUTE_ACTIONS_ERROR","REMOVE_FEDERATED_IDENTITY","IDENTITY_PROVIDER_POST_LOGIN","IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR","UPDATE_EMAIL","REGISTER_ERROR","REVOKE_GRANT_ERROR","EXECUTE_ACTION_TOKEN","UPDATE_EMAIL_ERROR","LOGOUT_ERROR","CLIENT_UPDATE_ERROR","UPDATE_PROFILE","CLIENT_REGISTER_ERROR","FEDERATED_IDENTITY_LINK","SEND_IDENTITY_PROVIDER_LINK","SEND_VERIFY_EMAIL_ERROR","RESET_PASSWORD","CLIENT_INITIATED_ACCOUNT_LINKING_ERROR","UPDATE_CONSENT","REMOVE_TOTP_ERROR","VERIFY_EMAIL_ERROR","SEND_RESET_PASSWORD_ERROR","CLIENT_UPDATE","CUSTOM_REQUIRED_ACTION_ERROR","IDENTITY_PROVIDER_POST_LOGIN_ERROR","UPDATE_TOTP_ERROR","CODE_TO_TOKEN","IDENTITY_PROVIDER_FIRST_LOGIN_ERROR","GRANT_CONSENT_ERROR"],"adminEventsEnabled":true,"adminEventsDetailsEnabled":true,"internationalizationEnabled":false,"supportedLocales":[],"browserFlow":"browser","registrationFlow":"registration","directGrantFlow":"direct grant","resetCredentialsFlow":"reset credentials","clientAuthenticationFlow":"clients","dockerAuthenticationFlow":"docker auth","attributes":{"webAuthnPolicyAuthenticatorAttachment":"not specified","displayName":"","_browser_header.xRobotsTag":"none","webAuthnPolicyRpEntityName":"keycloak","failureFactor":"30","actionTokenGeneratedByUserLifespan":"300","maxDeltaTimeSeconds":"43200","webAuthnPolicySignatureAlgorithms":"ES256","offlineSessionMaxLifespan":"5184000","_browser_header.contentSecurityPolicyReportOnly":"","bruteForceProtected":"false","_browser_header.contentSecurityPolicy":"frame-src 'self'; frame-ancestors 'self'; object-src 'none';","_browser_header.xXSSProtection":"1; mode=block","_browser_header.xFrameOptions":"SAMEORIGIN","_browser_header.strictTransportSecurity":"max-age=31536000; includeSubDomains","webAuthnPolicyUserVerificationRequirement":"not specified","permanentLockout":"false","quickLoginCheckMilliSeconds":"1000","webAuthnPolicyCreateTimeout":"0","webAuthnPolicyRequireResidentKey":"not specified","webAuthnPolicyRpId":"","webAuthnPolicyAttestationConveyancePreference":"not specified","maxFailureWaitSeconds":"900","minimumQuickLoginWaitSeconds":"60","webAuthnPolicyAvoidSameAuthenticatorRegister":"false","_browser_header.xContentTypeOptions":"nosniff","actionTokenGeneratedByAdminLifespan":"43200","waitIncrementSeconds":"60","offlineSessionMaxLifespanEnabled":"false"},"userManagedAccessAllowed":false}	\N	REALM
bcdba45d-4796-425c-8739-77161f668b90	1578965113000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	\N	{"id":"test","realm":"amestris","displayName":"Amestris","notBefore":1578804821,"revokeRefreshToken":false,"refreshTokenMaxReuse":0,"accessTokenLifespan":300,"accessTokenLifespanForImplicitFlow":900,"ssoSessionIdleTimeout":1800,"ssoSessionMaxLifespan":36000,"ssoSessionIdleTimeoutRememberMe":0,"ssoSessionMaxLifespanRememberMe":0,"offlineSessionIdleTimeout":2592000,"offlineSessionMaxLifespanEnabled":false,"offlineSessionMaxLifespan":5184000,"accessCodeLifespan":60,"accessCodeLifespanUserAction":300,"accessCodeLifespanLogin":1800,"actionTokenGeneratedByAdminLifespan":43200,"actionTokenGeneratedByUserLifespan":300,"enabled":true,"sslRequired":"external","registrationAllowed":true,"registrationEmailAsUsername":true,"rememberMe":false,"verifyEmail":false,"loginWithEmailAllowed":true,"duplicateEmailsAllowed":false,"resetPasswordAllowed":false,"editUsernameAllowed":false,"bruteForceProtected":false,"permanentLockout":false,"maxFailureWaitSeconds":900,"minimumQuickLoginWaitSeconds":60,"waitIncrementSeconds":60,"quickLoginCheckMilliSeconds":1000,"maxDeltaTimeSeconds":43200,"failureFactor":30,"defaultRoles":["offline_access","uma_authorization"],"requiredCredentials":["password"],"otpPolicyType":"totp","otpPolicyAlgorithm":"HmacSHA1","otpPolicyInitialCounter":0,"otpPolicyDigits":6,"otpPolicyLookAheadWindow":1,"otpPolicyPeriod":30,"otpSupportedApplications":["FreeOTP","Google Authenticator"],"webAuthnPolicyRpEntityName":"keycloak","webAuthnPolicySignatureAlgorithms":["ES256"],"webAuthnPolicyRpId":"","webAuthnPolicyAttestationConveyancePreference":"not specified","webAuthnPolicyAuthenticatorAttachment":"not specified","webAuthnPolicyRequireResidentKey":"not specified","webAuthnPolicyUserVerificationRequirement":"not specified","webAuthnPolicyCreateTimeout":0,"webAuthnPolicyAvoidSameAuthenticatorRegister":false,"webAuthnPolicyAcceptableAaguids":[],"browserSecurityHeaders":{"contentSecurityPolicyReportOnly":"","xContentTypeOptions":"nosniff","xRobotsTag":"none","xFrameOptions":"SAMEORIGIN","contentSecurityPolicy":"frame-src 'self'; frame-ancestors 'self'; object-src 'none';","xXSSProtection":"1; mode=block","strictTransportSecurity":"max-age=31536000; includeSubDomains"},"smtpServer":{},"eventsEnabled":true,"eventsExpiration":86400,"eventsListeners":["jboss-logging"],"enabledEventTypes":["SEND_RESET_PASSWORD","UPDATE_CONSENT_ERROR","GRANT_CONSENT","REVOKE_GRANT","REMOVE_TOTP","UPDATE_TOTP","LOGIN_ERROR","CLIENT_LOGIN","RESET_PASSWORD_ERROR","IMPERSONATE_ERROR","CUSTOM_REQUIRED_ACTION","CODE_TO_TOKEN_ERROR","RESTART_AUTHENTICATION","IMPERSONATE","UPDATE_PROFILE_ERROR","UPDATE_PASSWORD_ERROR","LOGIN","CLIENT_INITIATED_ACCOUNT_LINKING","TOKEN_EXCHANGE","LOGOUT","REGISTER","CLIENT_REGISTER","IDENTITY_PROVIDER_LINK_ACCOUNT","UPDATE_PASSWORD","CLIENT_DELETE","FEDERATED_IDENTITY_LINK_ERROR","IDENTITY_PROVIDER_FIRST_LOGIN","CLIENT_DELETE_ERROR","VERIFY_EMAIL","RESTART_AUTHENTICATION_ERROR","CLIENT_LOGIN_ERROR","TOKEN_EXCHANGE_ERROR","EXECUTE_ACTIONS","REMOVE_FEDERATED_IDENTITY_ERROR","PERMISSION_TOKEN","SEND_IDENTITY_PROVIDER_LINK_ERROR","EXECUTE_ACTION_TOKEN_ERROR","SEND_VERIFY_EMAIL","EXECUTE_ACTIONS_ERROR","REMOVE_FEDERATED_IDENTITY","IDENTITY_PROVIDER_POST_LOGIN","IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR","UPDATE_EMAIL","REGISTER_ERROR","REVOKE_GRANT_ERROR","EXECUTE_ACTION_TOKEN","UPDATE_EMAIL_ERROR","LOGOUT_ERROR","CLIENT_UPDATE_ERROR","UPDATE_PROFILE","CLIENT_REGISTER_ERROR","FEDERATED_IDENTITY_LINK","SEND_IDENTITY_PROVIDER_LINK","SEND_VERIFY_EMAIL_ERROR","RESET_PASSWORD","CLIENT_INITIATED_ACCOUNT_LINKING_ERROR","UPDATE_CONSENT","REMOVE_TOTP_ERROR","VERIFY_EMAIL_ERROR","SEND_RESET_PASSWORD_ERROR","CLIENT_UPDATE","CUSTOM_REQUIRED_ACTION_ERROR","IDENTITY_PROVIDER_POST_LOGIN_ERROR","UPDATE_TOTP_ERROR","CODE_TO_TOKEN","IDENTITY_PROVIDER_FIRST_LOGIN_ERROR","GRANT_CONSENT_ERROR"],"adminEventsEnabled":true,"adminEventsDetailsEnabled":true,"internationalizationEnabled":false,"supportedLocales":[],"browserFlow":"browser","registrationFlow":"registration","directGrantFlow":"direct grant","resetCredentialsFlow":"reset credentials","clientAuthenticationFlow":"clients","dockerAuthenticationFlow":"docker auth","attributes":{"webAuthnPolicyAuthenticatorAttachment":"not specified","displayName":"","_browser_header.xRobotsTag":"none","webAuthnPolicyRpEntityName":"keycloak","failureFactor":"30","actionTokenGeneratedByUserLifespan":"300","maxDeltaTimeSeconds":"43200","webAuthnPolicySignatureAlgorithms":"ES256","offlineSessionMaxLifespan":"5184000","_browser_header.contentSecurityPolicyReportOnly":"","bruteForceProtected":"false","_browser_header.contentSecurityPolicy":"frame-src 'self'; frame-ancestors 'self'; object-src 'none';","_browser_header.xXSSProtection":"1; mode=block","_browser_header.xFrameOptions":"SAMEORIGIN","_browser_header.strictTransportSecurity":"max-age=31536000; includeSubDomains","webAuthnPolicyUserVerificationRequirement":"not specified","permanentLockout":"false","quickLoginCheckMilliSeconds":"1000","webAuthnPolicyCreateTimeout":"0","webAuthnPolicyRequireResidentKey":"not specified","webAuthnPolicyRpId":"","webAuthnPolicyAttestationConveyancePreference":"not specified","maxFailureWaitSeconds":"900","minimumQuickLoginWaitSeconds":"60","webAuthnPolicyAvoidSameAuthenticatorRegister":"false","_browser_header.xContentTypeOptions":"nosniff","actionTokenGeneratedByAdminLifespan":"43200","waitIncrementSeconds":"60","offlineSessionMaxLifespanEnabled":"false"},"userManagedAccessAllowed":false}	\N	REALM
2fbc16fb-e69c-424b-ac2c-b31905342b7c	1578965124000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	\N	{"id":"test","realm":"amestris","displayName":"Amestris","notBefore":1578804821,"revokeRefreshToken":false,"refreshTokenMaxReuse":0,"accessTokenLifespan":300,"accessTokenLifespanForImplicitFlow":900,"ssoSessionIdleTimeout":1800,"ssoSessionMaxLifespan":36000,"ssoSessionIdleTimeoutRememberMe":0,"ssoSessionMaxLifespanRememberMe":0,"offlineSessionIdleTimeout":2592000,"offlineSessionMaxLifespanEnabled":false,"offlineSessionMaxLifespan":5184000,"accessCodeLifespan":60,"accessCodeLifespanUserAction":300,"accessCodeLifespanLogin":1800,"actionTokenGeneratedByAdminLifespan":43200,"actionTokenGeneratedByUserLifespan":300,"enabled":true,"sslRequired":"external","registrationAllowed":true,"registrationEmailAsUsername":true,"rememberMe":false,"verifyEmail":false,"loginWithEmailAllowed":true,"duplicateEmailsAllowed":false,"resetPasswordAllowed":false,"editUsernameAllowed":false,"bruteForceProtected":false,"permanentLockout":false,"maxFailureWaitSeconds":900,"minimumQuickLoginWaitSeconds":60,"waitIncrementSeconds":60,"quickLoginCheckMilliSeconds":1000,"maxDeltaTimeSeconds":43200,"failureFactor":30,"defaultRoles":["offline_access","uma_authorization"],"requiredCredentials":["password"],"otpPolicyType":"totp","otpPolicyAlgorithm":"HmacSHA1","otpPolicyInitialCounter":0,"otpPolicyDigits":6,"otpPolicyLookAheadWindow":1,"otpPolicyPeriod":30,"otpSupportedApplications":["FreeOTP","Google Authenticator"],"webAuthnPolicyRpEntityName":"keycloak","webAuthnPolicySignatureAlgorithms":["ES256"],"webAuthnPolicyRpId":"","webAuthnPolicyAttestationConveyancePreference":"not specified","webAuthnPolicyAuthenticatorAttachment":"not specified","webAuthnPolicyRequireResidentKey":"not specified","webAuthnPolicyUserVerificationRequirement":"not specified","webAuthnPolicyCreateTimeout":0,"webAuthnPolicyAvoidSameAuthenticatorRegister":false,"webAuthnPolicyAcceptableAaguids":[],"browserSecurityHeaders":{"contentSecurityPolicyReportOnly":"","xContentTypeOptions":"nosniff","xRobotsTag":"none","xFrameOptions":"SAMEORIGIN","contentSecurityPolicy":"frame-src 'self'; frame-ancestors 'self'; object-src 'none';","xXSSProtection":"1; mode=block","strictTransportSecurity":"max-age=31536000; includeSubDomains"},"smtpServer":{},"eventsEnabled":true,"eventsExpiration":86400,"eventsListeners":["jboss-logging"],"enabledEventTypes":["SEND_RESET_PASSWORD","UPDATE_CONSENT_ERROR","GRANT_CONSENT","REVOKE_GRANT","REMOVE_TOTP","UPDATE_TOTP","LOGIN_ERROR","CLIENT_LOGIN","RESET_PASSWORD_ERROR","IMPERSONATE_ERROR","CUSTOM_REQUIRED_ACTION","CODE_TO_TOKEN_ERROR","RESTART_AUTHENTICATION","IMPERSONATE","UPDATE_PROFILE_ERROR","UPDATE_PASSWORD_ERROR","LOGIN","CLIENT_INITIATED_ACCOUNT_LINKING","TOKEN_EXCHANGE","LOGOUT","REGISTER","CLIENT_REGISTER","IDENTITY_PROVIDER_LINK_ACCOUNT","UPDATE_PASSWORD","CLIENT_DELETE","FEDERATED_IDENTITY_LINK_ERROR","IDENTITY_PROVIDER_FIRST_LOGIN","CLIENT_DELETE_ERROR","VERIFY_EMAIL","RESTART_AUTHENTICATION_ERROR","CLIENT_LOGIN_ERROR","TOKEN_EXCHANGE_ERROR","EXECUTE_ACTIONS","REMOVE_FEDERATED_IDENTITY_ERROR","PERMISSION_TOKEN","SEND_IDENTITY_PROVIDER_LINK_ERROR","EXECUTE_ACTION_TOKEN_ERROR","SEND_VERIFY_EMAIL","EXECUTE_ACTIONS_ERROR","REMOVE_FEDERATED_IDENTITY","IDENTITY_PROVIDER_POST_LOGIN","IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR","UPDATE_EMAIL","REGISTER_ERROR","REVOKE_GRANT_ERROR","EXECUTE_ACTION_TOKEN","UPDATE_EMAIL_ERROR","LOGOUT_ERROR","CLIENT_UPDATE_ERROR","UPDATE_PROFILE","CLIENT_REGISTER_ERROR","FEDERATED_IDENTITY_LINK","SEND_IDENTITY_PROVIDER_LINK","SEND_VERIFY_EMAIL_ERROR","RESET_PASSWORD","CLIENT_INITIATED_ACCOUNT_LINKING_ERROR","UPDATE_CONSENT","REMOVE_TOTP_ERROR","VERIFY_EMAIL_ERROR","SEND_RESET_PASSWORD_ERROR","CLIENT_UPDATE","CUSTOM_REQUIRED_ACTION_ERROR","IDENTITY_PROVIDER_POST_LOGIN_ERROR","UPDATE_TOTP_ERROR","CODE_TO_TOKEN","IDENTITY_PROVIDER_FIRST_LOGIN_ERROR","GRANT_CONSENT_ERROR"],"adminEventsEnabled":true,"adminEventsDetailsEnabled":true,"internationalizationEnabled":false,"supportedLocales":[],"browserFlow":"browser","registrationFlow":"registration","directGrantFlow":"direct grant","resetCredentialsFlow":"reset credentials","clientAuthenticationFlow":"clients","dockerAuthenticationFlow":"docker auth","attributes":{"webAuthnPolicyAuthenticatorAttachment":"not specified","displayName":"","_browser_header.xRobotsTag":"none","webAuthnPolicyRpEntityName":"keycloak","failureFactor":"30","actionTokenGeneratedByUserLifespan":"300","maxDeltaTimeSeconds":"43200","webAuthnPolicySignatureAlgorithms":"ES256","offlineSessionMaxLifespan":"5184000","_browser_header.contentSecurityPolicyReportOnly":"","bruteForceProtected":"false","_browser_header.contentSecurityPolicy":"frame-src 'self'; frame-ancestors 'self'; object-src 'none';","_browser_header.xXSSProtection":"1; mode=block","_browser_header.xFrameOptions":"SAMEORIGIN","_browser_header.strictTransportSecurity":"max-age=31536000; includeSubDomains","webAuthnPolicyUserVerificationRequirement":"not specified","permanentLockout":"false","quickLoginCheckMilliSeconds":"1000","webAuthnPolicyCreateTimeout":"0","webAuthnPolicyRequireResidentKey":"not specified","webAuthnPolicyRpId":"","webAuthnPolicyAttestationConveyancePreference":"not specified","maxFailureWaitSeconds":"900","minimumQuickLoginWaitSeconds":"60","webAuthnPolicyAvoidSameAuthenticatorRegister":"false","_browser_header.xContentTypeOptions":"nosniff","actionTokenGeneratedByAdminLifespan":"43200","waitIncrementSeconds":"60","offlineSessionMaxLifespanEnabled":"false"},"userManagedAccessAllowed":false}	\N	REALM
ba768712-9808-47f1-9c83-ece162ed0a91	1578965551000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	users/2e477043-4363-48ef-bb69-568c0c02b005	{"id":"2e477043-4363-48ef-bb69-568c0c02b005","createdTimestamp":1578964916788,"username":"winry.rockbell@gmail.com","enabled":true,"totp":false,"emailVerified":true,"firstName":"Winry","lastName":"Rockbell","email":"winry.rockbell@gmail.com","attributes":{},"disableableCredentialTypes":[],"requiredActions":[],"notBefore":0,"access":{"manageGroupMembership":true,"view":true,"mapRoles":true,"impersonate":true,"manage":true}}	\N	USER
4b97d039-ff23-4d91-91b1-ccdb8b16bc0f	1578965617000	test	CREATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	clients/17d6b9dd-1409-4475-bbf5-ca457212aadc/scope-mappings/realm	[{"id":"e6769c2e-c8b5-43f4-8b4c-327b8af2d12e","name":"x-admin","composite":true,"clientRole":false,"containerId":"test"}]	\N	REALM_SCOPE_MAPPING
b02d21ef-7b48-49dc-b740-44b3c79c5598	1578965209000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	clients/17d6b9dd-1409-4475-bbf5-ca457212aadc	{"id":"17d6b9dd-1409-4475-bbf5-ca457212aadc","clientId":"echo-example","baseUrl":"/realms/test/echo-example/","surrogateAuthRequired":false,"enabled":true,"clientAuthenticatorType":"client-secret","redirectUris":["/realms/test/echo-example/*","http://192.168.64.10/echo/oauth/callback"],"webOrigins":[],"notBefore":0,"bearerOnly":false,"consentRequired":false,"standardFlowEnabled":true,"implicitFlowEnabled":false,"directAccessGrantsEnabled":true,"serviceAccountsEnabled":true,"publicClient":false,"frontchannelLogout":false,"protocol":"openid-connect","attributes":{"saml.assertion.signature":"false","saml.multivalued.roles":"false","saml.force.post.binding":"false","saml.encrypt":"false","saml.server.signature":"false","saml.server.signature.keyinfo.ext":"false","exclude.session.state.from.auth.response":"false","saml_force_name_id_format":"false","saml.client.signature":"false","tls.client.certificate.bound.access.tokens":"false","saml.authnstatement":"false","display.on.consent.screen":"false","saml.onetimeuse.condition":"false"},"authenticationFlowBindingOverrides":{},"fullScopeAllowed":false,"nodeReRegistrationTimeout":-1,"protocolMappers":[{"id":"258b2a8d-69f5-46c8-b9d9-59ec5b6a464b","name":"Audience","protocol":"openid-connect","protocolMapper":"oidc-audience-mapper","consentRequired":false,"config":{"included.client.audience":"echo-example","id.token.claim":"true","access.token.claim":"true"}},{"id":"9e874679-d664-4a23-b074-32393b72c871","name":"Client Host","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientHost","id.token.claim":"true","access.token.claim":"true","claim.name":"clientHost","jsonType.label":"String"}},{"id":"9265349d-d430-4ef8-8479-3df0dc3e547d","name":"Client IP Address","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientAddress","id.token.claim":"true","access.token.claim":"true","claim.name":"clientAddress","jsonType.label":"String"}},{"id":"384fceea-87a1-4791-8b69-d92f88e5efa8","name":"Client ID","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientId","id.token.claim":"true","access.token.claim":"true","claim.name":"clientId","jsonType.label":"String"}}],"defaultClientScopes":["web-origins","role_list","profile","roles","email"],"optionalClientScopes":["address","phone","offline_access","microprofile-jwt"],"access":{"view":true,"configure":true,"manage":true}}	\N	CLIENT
a403f318-3813-4b27-a1e5-7fb2e2967c3a	1578965511000	test	ACTION	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	users/01ed29c7-52c5-43a4-9d29-f466b2c59e82/reset-password	\N	\N	USER
d54b6f21-0127-4ed8-9013-60e7a21b0466	1578965700000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	clients/17d6b9dd-1409-4475-bbf5-ca457212aadc	{"id":"17d6b9dd-1409-4475-bbf5-ca457212aadc","clientId":"echo-example","baseUrl":"/realms/test/echo-example/","surrogateAuthRequired":false,"enabled":true,"clientAuthenticatorType":"client-secret","redirectUris":["/realms/test/echo-example/*","http://192.168.64.10/echo/oauth/callback"],"webOrigins":[],"notBefore":0,"bearerOnly":false,"consentRequired":false,"standardFlowEnabled":true,"implicitFlowEnabled":false,"directAccessGrantsEnabled":true,"serviceAccountsEnabled":true,"publicClient":false,"frontchannelLogout":false,"protocol":"openid-connect","attributes":{"saml.assertion.signature":"false","saml.multivalued.roles":"false","saml.force.post.binding":"false","saml.encrypt":"false","saml.server.signature":"false","saml.server.signature.keyinfo.ext":"false","exclude.session.state.from.auth.response":"false","saml_force_name_id_format":"false","saml.client.signature":"false","tls.client.certificate.bound.access.tokens":"false","saml.authnstatement":"false","display.on.consent.screen":"false","saml.onetimeuse.condition":"false"},"authenticationFlowBindingOverrides":{},"fullScopeAllowed":false,"nodeReRegistrationTimeout":-1,"protocolMappers":[{"id":"258b2a8d-69f5-46c8-b9d9-59ec5b6a464b","name":"Audience","protocol":"openid-connect","protocolMapper":"oidc-audience-mapper","consentRequired":false,"config":{"included.client.audience":"echo-example","id.token.claim":"true","access.token.claim":"true"}},{"id":"9e874679-d664-4a23-b074-32393b72c871","name":"Client Host","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientHost","id.token.claim":"true","access.token.claim":"true","claim.name":"clientHost","jsonType.label":"String"}},{"id":"9265349d-d430-4ef8-8479-3df0dc3e547d","name":"Client IP Address","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientAddress","id.token.claim":"true","access.token.claim":"true","claim.name":"clientAddress","jsonType.label":"String"}},{"id":"384fceea-87a1-4791-8b69-d92f88e5efa8","name":"Client ID","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientId","id.token.claim":"true","access.token.claim":"true","claim.name":"clientId","jsonType.label":"String"}}],"defaultClientScopes":["web-origins","role_list","profile","roles","email"],"optionalClientScopes":["address","phone","offline_access","microprofile-jwt"],"access":{"view":true,"configure":true,"manage":true}}	\N	CLIENT
39c07aa8-d207-4b2d-bca8-3fcc1350f099	1578965804000	test	CREATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	users/2e477043-4363-48ef-bb69-568c0c02b005/role-mappings/realm	[{"id":"e3ebc595-a7b1-4096-b831-bc8f1d7bc663","name":"x-user","composite":false,"clientRole":false,"containerId":"test"}]	\N	REALM_ROLE_MAPPING
10f19179-2732-4762-afb8-6a76df6d155a	1578965209000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	clients/17d6b9dd-1409-4475-bbf5-ca457212aadc	{"id":"17d6b9dd-1409-4475-bbf5-ca457212aadc","clientId":"echo-example","baseUrl":"/realms/test/echo-example/","surrogateAuthRequired":false,"enabled":true,"clientAuthenticatorType":"client-secret","redirectUris":["/realms/test/echo-example/*","http://192.168.64.10/echo/oauth/callback"],"webOrigins":[],"notBefore":0,"bearerOnly":false,"consentRequired":false,"standardFlowEnabled":true,"implicitFlowEnabled":false,"directAccessGrantsEnabled":true,"serviceAccountsEnabled":true,"publicClient":false,"frontchannelLogout":false,"protocol":"openid-connect","attributes":{"saml.assertion.signature":"false","saml.multivalued.roles":"false","saml.force.post.binding":"false","saml.encrypt":"false","saml.server.signature":"false","saml.server.signature.keyinfo.ext":"false","exclude.session.state.from.auth.response":"false","saml_force_name_id_format":"false","saml.client.signature":"false","tls.client.certificate.bound.access.tokens":"false","saml.authnstatement":"false","display.on.consent.screen":"false","saml.onetimeuse.condition":"false"},"authenticationFlowBindingOverrides":{},"fullScopeAllowed":false,"nodeReRegistrationTimeout":-1,"protocolMappers":[{"id":"258b2a8d-69f5-46c8-b9d9-59ec5b6a464b","name":"Audience","protocol":"openid-connect","protocolMapper":"oidc-audience-mapper","consentRequired":false,"config":{"included.client.audience":"echo-example","id.token.claim":"true","access.token.claim":"true"}},{"id":"9e874679-d664-4a23-b074-32393b72c871","name":"Client Host","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientHost","id.token.claim":"true","access.token.claim":"true","claim.name":"clientHost","jsonType.label":"String"}},{"id":"9265349d-d430-4ef8-8479-3df0dc3e547d","name":"Client IP Address","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientAddress","id.token.claim":"true","access.token.claim":"true","claim.name":"clientAddress","jsonType.label":"String"}},{"id":"384fceea-87a1-4791-8b69-d92f88e5efa8","name":"Client ID","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientId","id.token.claim":"true","access.token.claim":"true","claim.name":"clientId","jsonType.label":"String"}}],"defaultClientScopes":["web-origins","role_list","profile","roles","email"],"optionalClientScopes":["address","phone","offline_access","microprofile-jwt"],"access":{"view":true,"configure":true,"manage":true}}	\N	CLIENT
2e91bd4a-a282-4311-a331-016da5794db8	1578965222000	test	CREATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	clients/17d6b9dd-1409-4475-bbf5-ca457212aadc/scope-mappings/realm	[{"id":"e3ebc595-a7b1-4096-b831-bc8f1d7bc663","name":"x-user","composite":false,"clientRole":false,"containerId":"test"}]	\N	REALM_SCOPE_MAPPING
20ffd7ee-6f2c-47b4-afba-90b75f408843	1578965526000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	users/42d209d0-3ca7-4041-87f4-788ca6d9b32f	{"id":"42d209d0-3ca7-4041-87f4-788ca6d9b32f","createdTimestamp":1578964823018,"username":"alphonse.elric@gmail.com","enabled":true,"totp":false,"emailVerified":true,"firstName":"Alphonse","lastName":"Elric","email":"alphonse.elric@gmail.com","attributes":{},"disableableCredentialTypes":[],"requiredActions":[],"notBefore":0,"access":{"manageGroupMembership":true,"view":true,"mapRoles":true,"impersonate":true,"manage":true}}	\N	USER
45dedc97-130e-40e2-b86a-f450981b0668	1578965534000	test	ACTION	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	users/42d209d0-3ca7-4041-87f4-788ca6d9b32f/reset-password	\N	\N	USER
50de9548-afc0-47b2-9a27-2848d922e461	1578965548000	test	ACTION	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	users/2e477043-4363-48ef-bb69-568c0c02b005/reset-password	\N	\N	USER
bb27dc48-076d-44fc-9823-dfe263eece34	1578965721000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	clients/17d6b9dd-1409-4475-bbf5-ca457212aadc	{"id":"17d6b9dd-1409-4475-bbf5-ca457212aadc","clientId":"echo-example","baseUrl":"/realms/test/echo-example/","surrogateAuthRequired":false,"enabled":true,"clientAuthenticatorType":"client-secret","redirectUris":["/realms/test/echo-example/*","http://192.168.64.10/echo/oauth/callback"],"webOrigins":[],"notBefore":0,"bearerOnly":false,"consentRequired":false,"standardFlowEnabled":true,"implicitFlowEnabled":false,"directAccessGrantsEnabled":true,"serviceAccountsEnabled":true,"publicClient":false,"frontchannelLogout":false,"protocol":"openid-connect","attributes":{"saml.assertion.signature":"false","saml.multivalued.roles":"false","saml.force.post.binding":"false","saml.encrypt":"false","saml.server.signature":"false","saml.server.signature.keyinfo.ext":"false","exclude.session.state.from.auth.response":"false","saml_force_name_id_format":"false","saml.client.signature":"false","tls.client.certificate.bound.access.tokens":"false","saml.authnstatement":"false","display.on.consent.screen":"false","saml.onetimeuse.condition":"false"},"authenticationFlowBindingOverrides":{},"fullScopeAllowed":false,"nodeReRegistrationTimeout":-1,"protocolMappers":[{"id":"258b2a8d-69f5-46c8-b9d9-59ec5b6a464b","name":"Audience","protocol":"openid-connect","protocolMapper":"oidc-audience-mapper","consentRequired":false,"config":{"included.client.audience":"echo-example","id.token.claim":"true","access.token.claim":"true"}},{"id":"9e874679-d664-4a23-b074-32393b72c871","name":"Client Host","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientHost","id.token.claim":"true","access.token.claim":"true","claim.name":"clientHost","jsonType.label":"String"}},{"id":"9265349d-d430-4ef8-8479-3df0dc3e547d","name":"Client IP Address","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientAddress","id.token.claim":"true","access.token.claim":"true","claim.name":"clientAddress","jsonType.label":"String"}},{"id":"384fceea-87a1-4791-8b69-d92f88e5efa8","name":"Client ID","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientId","id.token.claim":"true","access.token.claim":"true","claim.name":"clientId","jsonType.label":"String"}}],"defaultClientScopes":["web-origins","role_list","profile","roles","email"],"optionalClientScopes":["address","phone","offline_access","microprofile-jwt"],"access":{"view":true,"configure":true,"manage":true}}	\N	CLIENT
88a9252f-cc9e-40f6-8e2d-714958e0b782	1578965704000	test	UPDATE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	clients/17d6b9dd-1409-4475-bbf5-ca457212aadc	{"id":"17d6b9dd-1409-4475-bbf5-ca457212aadc","clientId":"echo-example","baseUrl":"/realms/test/echo-example/","surrogateAuthRequired":false,"enabled":true,"clientAuthenticatorType":"client-secret","redirectUris":["/realms/test/echo-example/*","http://192.168.64.10/echo/oauth/callback"],"webOrigins":[],"notBefore":0,"bearerOnly":false,"consentRequired":false,"standardFlowEnabled":true,"implicitFlowEnabled":false,"directAccessGrantsEnabled":true,"serviceAccountsEnabled":true,"publicClient":false,"frontchannelLogout":false,"protocol":"openid-connect","attributes":{"saml.assertion.signature":"false","saml.multivalued.roles":"false","saml.force.post.binding":"false","saml.encrypt":"false","saml.server.signature":"false","saml.server.signature.keyinfo.ext":"false","exclude.session.state.from.auth.response":"false","saml_force_name_id_format":"false","saml.client.signature":"false","tls.client.certificate.bound.access.tokens":"false","saml.authnstatement":"false","display.on.consent.screen":"false","saml.onetimeuse.condition":"false"},"authenticationFlowBindingOverrides":{},"fullScopeAllowed":false,"nodeReRegistrationTimeout":-1,"protocolMappers":[{"id":"258b2a8d-69f5-46c8-b9d9-59ec5b6a464b","name":"Audience","protocol":"openid-connect","protocolMapper":"oidc-audience-mapper","consentRequired":false,"config":{"included.client.audience":"echo-example","id.token.claim":"true","access.token.claim":"true"}},{"id":"9e874679-d664-4a23-b074-32393b72c871","name":"Client Host","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientHost","id.token.claim":"true","access.token.claim":"true","claim.name":"clientHost","jsonType.label":"String"}},{"id":"9265349d-d430-4ef8-8479-3df0dc3e547d","name":"Client IP Address","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientAddress","id.token.claim":"true","access.token.claim":"true","claim.name":"clientAddress","jsonType.label":"String"}},{"id":"384fceea-87a1-4791-8b69-d92f88e5efa8","name":"Client ID","protocol":"openid-connect","protocolMapper":"oidc-usersessionmodel-note-mapper","consentRequired":false,"config":{"user.session.note":"clientId","id.token.claim":"true","access.token.claim":"true","claim.name":"clientId","jsonType.label":"String"}}],"defaultClientScopes":["web-origins","role_list","profile","roles","email"],"optionalClientScopes":["address","phone","offline_access","microprofile-jwt"],"access":{"view":true,"configure":true,"manage":true}}	\N	CLIENT
e6fe812b-bfbb-436d-ab0c-2ebdbc588978	1578965718000	test	DELETE	master	71f7395f-46fe-4aaa-a256-82e1a34fd69e	3958aa5c-b056-4cb1-b45c-524251e1c749	192.168.64.1	clients/17d6b9dd-1409-4475-bbf5-ca457212aadc/scope-mappings/realm	[{"id":"e3ebc595-a7b1-4096-b831-bc8f1d7bc663","name":"x-user","composite":false,"clientRole":false,"containerId":"test"}]	\N	REALM_SCOPE_MAPPING
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
f8f1d753-7010-4131-89a7-2df2f7a2de37	a3eca3ee-b481-4a7d-9332-353f2a7e5697
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
09dcbdbf-a537-48eb-a106-e2b327637092	\N	auth-cookie	master	e35478b3-c358-4a4f-b171-182a23bc8612	2	10	f	\N	\N
e4703481-a75f-46ef-8cc9-8ad1fe4e252c	\N	auth-spnego	master	e35478b3-c358-4a4f-b171-182a23bc8612	3	20	f	\N	\N
e8e7ebb1-a700-442b-a5a2-9a5084c46f5c	\N	identity-provider-redirector	master	e35478b3-c358-4a4f-b171-182a23bc8612	2	25	f	\N	\N
e508b14b-83aa-4f58-a408-021fb8bec240	\N	\N	master	e35478b3-c358-4a4f-b171-182a23bc8612	2	30	t	4db48fbb-c5d2-4bb1-beb4-2f702909a851	\N
5008a174-6325-46a0-9340-a7974064447d	\N	auth-username-password-form	master	4db48fbb-c5d2-4bb1-beb4-2f702909a851	0	10	f	\N	\N
dc5afa05-f8f6-45c3-8dfb-e84fc4b78d77	\N	\N	master	4db48fbb-c5d2-4bb1-beb4-2f702909a851	1	20	t	78d374e8-7a9e-4b5f-ae7d-241e5eb5ea4a	\N
99aa9fdc-706e-4531-92bc-aba408af8ed8	\N	conditional-user-configured	master	78d374e8-7a9e-4b5f-ae7d-241e5eb5ea4a	0	10	f	\N	\N
b7cb245f-126a-4a56-9dc7-e313a287b74a	\N	auth-otp-form	master	78d374e8-7a9e-4b5f-ae7d-241e5eb5ea4a	0	20	f	\N	\N
cd0eb2c8-824f-40de-b808-904f618a3ac3	\N	direct-grant-validate-username	master	864a4adf-9bc4-4fef-9145-c75dd0289279	0	10	f	\N	\N
4a3d6f24-bb26-4063-adb2-efa06b59af46	\N	direct-grant-validate-password	master	864a4adf-9bc4-4fef-9145-c75dd0289279	0	20	f	\N	\N
127239f8-a69f-442f-b287-d2d4d8e2aa37	\N	\N	master	864a4adf-9bc4-4fef-9145-c75dd0289279	1	30	t	6814641d-8708-46bb-99ad-59389a80a6f5	\N
c5b97e38-8a34-45c7-93c5-67a16cdea0cf	\N	conditional-user-configured	master	6814641d-8708-46bb-99ad-59389a80a6f5	0	10	f	\N	\N
cc191848-eef2-4c3d-be84-fd44ec0f9341	\N	direct-grant-validate-otp	master	6814641d-8708-46bb-99ad-59389a80a6f5	0	20	f	\N	\N
85fea2eb-7f27-40a3-892f-a26538b61e68	\N	registration-page-form	master	074ee797-1d55-411a-9fc2-35d1f8acb344	0	10	t	b8434bc6-64f9-41b7-982f-7312cb7a8afa	\N
6cdddc24-ec6c-4aa4-a1b1-99d406f55efd	\N	registration-user-creation	master	b8434bc6-64f9-41b7-982f-7312cb7a8afa	0	20	f	\N	\N
13ddd3e5-f2ec-4cc2-8a02-df8dd60efd45	\N	registration-profile-action	master	b8434bc6-64f9-41b7-982f-7312cb7a8afa	0	40	f	\N	\N
e6de2482-5010-475a-8287-4ae104bafd45	\N	registration-password-action	master	b8434bc6-64f9-41b7-982f-7312cb7a8afa	0	50	f	\N	\N
1714a502-4082-4966-b709-be3fb5e1582c	\N	registration-recaptcha-action	master	b8434bc6-64f9-41b7-982f-7312cb7a8afa	3	60	f	\N	\N
686e62c1-0a09-4c95-8b00-3d38b11be430	\N	reset-credentials-choose-user	master	06beb1d7-bdc4-4774-b26f-c1a357aa63f4	0	10	f	\N	\N
4fe1e42d-1360-4d30-90f2-0ccff9760082	\N	reset-credential-email	master	06beb1d7-bdc4-4774-b26f-c1a357aa63f4	0	20	f	\N	\N
952af738-2338-47c0-9e14-6bb25089553f	\N	reset-password	master	06beb1d7-bdc4-4774-b26f-c1a357aa63f4	0	30	f	\N	\N
e84052b9-fb25-44b1-854b-a6c863ec908e	\N	\N	master	06beb1d7-bdc4-4774-b26f-c1a357aa63f4	1	40	t	9d29ef20-a07c-43e9-a204-623492e04740	\N
d34034c7-b008-4318-9b92-f4ac7c607839	\N	conditional-user-configured	master	9d29ef20-a07c-43e9-a204-623492e04740	0	10	f	\N	\N
df965e8a-e0e5-46c8-a621-7e31ab40fa10	\N	reset-otp	master	9d29ef20-a07c-43e9-a204-623492e04740	0	20	f	\N	\N
88369d16-a018-49db-9d6a-4e115798ad74	\N	client-secret	master	54b871c9-a583-4059-95fc-30b97f60691e	2	10	f	\N	\N
bfe6e6c6-cc22-4bf7-9795-914ce5726596	\N	client-jwt	master	54b871c9-a583-4059-95fc-30b97f60691e	2	20	f	\N	\N
26b43ef5-29b9-4822-979e-4a80a659b455	\N	client-secret-jwt	master	54b871c9-a583-4059-95fc-30b97f60691e	2	30	f	\N	\N
d2df625e-4fa5-4164-b5eb-5e85d410b6a5	\N	client-x509	master	54b871c9-a583-4059-95fc-30b97f60691e	2	40	f	\N	\N
60f66199-f88a-4b6c-a314-70c9ef2fcc44	\N	idp-review-profile	master	8fd3abe5-c4b0-463e-b51b-7b30fdbc1f7c	0	10	f	\N	40dfcc80-3c6c-403e-95ac-5d82df3ff080
7b1dc841-a92e-4fd8-b131-0a251f8475dc	\N	\N	master	8fd3abe5-c4b0-463e-b51b-7b30fdbc1f7c	0	20	t	b334504b-ea7c-4f69-8688-642695e38314	\N
b094e3d1-eda2-4c1e-8654-d4de5935f217	\N	idp-create-user-if-unique	master	b334504b-ea7c-4f69-8688-642695e38314	2	10	f	\N	2133ddc0-681d-48fd-81c3-893b40534700
3edacdc6-8e23-4d0a-9fe8-0899762a79dd	\N	\N	master	b334504b-ea7c-4f69-8688-642695e38314	2	20	t	c53b1f2b-8b5d-4ebf-8a07-7d9f0b6fdfbf	\N
aac096cc-96c8-424d-b05c-fd39fd816c81	\N	idp-confirm-link	master	c53b1f2b-8b5d-4ebf-8a07-7d9f0b6fdfbf	0	10	f	\N	\N
d1cee666-d42a-462f-b354-0437e21a6308	\N	\N	master	c53b1f2b-8b5d-4ebf-8a07-7d9f0b6fdfbf	0	20	t	ce56f617-1ff7-477a-abaf-be9135041979	\N
1a0b17ed-edd3-4b7c-a159-ce21dbac9071	\N	idp-email-verification	master	ce56f617-1ff7-477a-abaf-be9135041979	2	10	f	\N	\N
03687d05-75cd-48e9-ab5f-86ab840e34a1	\N	\N	master	ce56f617-1ff7-477a-abaf-be9135041979	2	20	t	e205a7cf-e9a4-4105-9de8-d9844523604d	\N
030c424e-a44b-4ada-a7e3-7dee0ef9aeb9	\N	idp-username-password-form	master	e205a7cf-e9a4-4105-9de8-d9844523604d	0	10	f	\N	\N
b985c6f8-5349-4d0e-9222-2d7329f679ea	\N	\N	master	e205a7cf-e9a4-4105-9de8-d9844523604d	1	20	t	06a50835-69a8-4291-8e21-7a056f72dc7c	\N
560a6b70-00b8-4729-a968-597bb3dd8f08	\N	conditional-user-configured	master	06a50835-69a8-4291-8e21-7a056f72dc7c	0	10	f	\N	\N
22bd4a5b-5c9c-4071-9624-e570943fae35	\N	auth-otp-form	master	06a50835-69a8-4291-8e21-7a056f72dc7c	0	20	f	\N	\N
b3177626-3bd3-47e9-8f6d-7899f00f6579	\N	http-basic-authenticator	master	5643e121-b87f-4ff8-ae61-c70e69aa543c	0	10	f	\N	\N
1154f767-f93c-428c-b59a-822c8a094a04	\N	docker-http-basic-authenticator	master	3c89359b-102a-40c2-be22-e6cd773383e4	0	10	f	\N	\N
288233e4-391f-454a-84f6-6b9abdc25c86	\N	no-cookie-redirect	master	23c55c0d-fb6e-4d2b-a79d-e38a26dfce8c	0	10	f	\N	\N
71e0546f-8ba9-46ce-a320-0980070c58db	\N	\N	master	23c55c0d-fb6e-4d2b-a79d-e38a26dfce8c	0	20	t	4c6f96d7-dd16-44f9-9d06-329e9ca53dfa	\N
d6fb7371-597a-42f9-9435-94df2684ccb0	\N	basic-auth	master	4c6f96d7-dd16-44f9-9d06-329e9ca53dfa	0	10	f	\N	\N
cf5d7e0a-7dc1-4578-81d3-aa336f8c73bc	\N	basic-auth-otp	master	4c6f96d7-dd16-44f9-9d06-329e9ca53dfa	3	20	f	\N	\N
7da13756-062e-41c2-8619-3892c1b12a69	\N	auth-spnego	master	4c6f96d7-dd16-44f9-9d06-329e9ca53dfa	3	30	f	\N	\N
7609630b-a396-4de4-8d19-d05ac07eb1b4	\N	auth-cookie	test	861c2f38-ee98-438b-9072-7e38354436a0	2	10	f	\N	\N
8d149080-8450-4e1d-bd72-551fa1a2c407	\N	auth-spnego	test	861c2f38-ee98-438b-9072-7e38354436a0	3	20	f	\N	\N
45ad4596-2e05-4175-98d7-01c5ad864441	\N	identity-provider-redirector	test	861c2f38-ee98-438b-9072-7e38354436a0	2	25	f	\N	\N
f6113fab-00fa-425b-857a-f02e28e51e07	\N	\N	test	861c2f38-ee98-438b-9072-7e38354436a0	2	30	t	92d90b0a-01a7-458d-ae09-cd43129fa5ea	\N
47d19269-62ec-4089-9e0a-fa52341296c6	\N	auth-username-password-form	test	92d90b0a-01a7-458d-ae09-cd43129fa5ea	0	10	f	\N	\N
44143b4f-37f8-490e-aa5a-61e76e773a46	\N	\N	test	92d90b0a-01a7-458d-ae09-cd43129fa5ea	1	20	t	c86684a3-4389-4d98-a7ff-32835e822ec6	\N
42e6d56e-d0db-4e4f-b270-2df204fa0e47	\N	conditional-user-configured	test	c86684a3-4389-4d98-a7ff-32835e822ec6	0	10	f	\N	\N
b5d12239-2587-4d31-a8ec-ce9ca2ffd0b9	\N	auth-otp-form	test	c86684a3-4389-4d98-a7ff-32835e822ec6	0	20	f	\N	\N
398b76dd-e948-4892-9202-dfd95af5e946	\N	direct-grant-validate-username	test	b7d435b6-179a-4f69-99b7-900e2b4c7136	0	10	f	\N	\N
6717a02e-4360-485f-9b8e-842cfc7b5b69	\N	direct-grant-validate-password	test	b7d435b6-179a-4f69-99b7-900e2b4c7136	0	20	f	\N	\N
0799c349-51cf-49ce-9fbd-8ff399120cd3	\N	\N	test	b7d435b6-179a-4f69-99b7-900e2b4c7136	1	30	t	c62478af-715e-400c-bd2c-cdbdcc4d345f	\N
6b8fc6ff-5bab-4262-919b-2f388e3ea27a	\N	conditional-user-configured	test	c62478af-715e-400c-bd2c-cdbdcc4d345f	0	10	f	\N	\N
f5983032-08a2-45d1-b936-dd74f8d1bf5e	\N	direct-grant-validate-otp	test	c62478af-715e-400c-bd2c-cdbdcc4d345f	0	20	f	\N	\N
38bfd1b4-2a0c-4fb9-9ed0-732ae3532545	\N	registration-page-form	test	0b5ae7c2-1c2b-4445-9f07-b327e925624f	0	10	t	a0e724fb-04e8-426a-8244-e23f70754e6c	\N
016b1f31-1ae5-4f1f-b2fa-fe921786d96d	\N	registration-user-creation	test	a0e724fb-04e8-426a-8244-e23f70754e6c	0	20	f	\N	\N
4d389bac-ac7d-49e9-9e85-625b0883a474	\N	registration-profile-action	test	a0e724fb-04e8-426a-8244-e23f70754e6c	0	40	f	\N	\N
0a05e8b0-ad77-4a99-918e-82fd09566f80	\N	registration-password-action	test	a0e724fb-04e8-426a-8244-e23f70754e6c	0	50	f	\N	\N
9a556905-3721-4f1b-8af4-6ab5266016e7	\N	registration-recaptcha-action	test	a0e724fb-04e8-426a-8244-e23f70754e6c	3	60	f	\N	\N
d5d0bea1-6be9-49fa-b96e-98e17a3d8c8a	\N	reset-credentials-choose-user	test	90c1fd27-8a04-409f-bc90-5d4184e20ead	0	10	f	\N	\N
e5cb7a60-7464-4dfe-93c3-ed23bcd85eba	\N	reset-credential-email	test	90c1fd27-8a04-409f-bc90-5d4184e20ead	0	20	f	\N	\N
2c8b2461-fec9-40d2-be92-48990205321b	\N	reset-password	test	90c1fd27-8a04-409f-bc90-5d4184e20ead	0	30	f	\N	\N
35ce093d-74c7-4801-80e9-6f54f1d50e84	\N	\N	test	90c1fd27-8a04-409f-bc90-5d4184e20ead	1	40	t	5e29a20f-03a1-4174-a75f-165298e9533a	\N
e57152cf-2f27-42b7-a517-68f4f24ad678	\N	conditional-user-configured	test	5e29a20f-03a1-4174-a75f-165298e9533a	0	10	f	\N	\N
6f628e65-6962-46f6-bfe8-eb7ce054ea04	\N	reset-otp	test	5e29a20f-03a1-4174-a75f-165298e9533a	0	20	f	\N	\N
6b28207d-55ff-4f0b-8c87-b7040d7eda1a	\N	client-secret	test	4276738b-ac85-4274-9532-0dc8ebe79a3e	2	10	f	\N	\N
20010e16-211e-4f92-bddd-6a4c3a83675e	\N	client-jwt	test	4276738b-ac85-4274-9532-0dc8ebe79a3e	2	20	f	\N	\N
ff0c4252-cd0d-4904-acef-f28bbb5f0526	\N	client-secret-jwt	test	4276738b-ac85-4274-9532-0dc8ebe79a3e	2	30	f	\N	\N
35f0de8a-e907-4629-bc77-1e6da1253c55	\N	client-x509	test	4276738b-ac85-4274-9532-0dc8ebe79a3e	2	40	f	\N	\N
5ec98006-ebe8-46a4-8a82-80bfdeb7b0f5	\N	idp-review-profile	test	e683bdf4-6018-4333-8a46-1a0d35c5832e	0	10	f	\N	8b26bf46-bc25-4ccc-9024-7d4533d5c534
dfb17e8a-56a4-4be3-b70d-0166a09a212b	\N	\N	test	e683bdf4-6018-4333-8a46-1a0d35c5832e	0	20	t	023e06ab-df21-4ee6-9c87-13e934961da3	\N
9c1dad24-0fb9-4d20-9a30-ecf1801a5f96	\N	idp-create-user-if-unique	test	023e06ab-df21-4ee6-9c87-13e934961da3	2	10	f	\N	b8094e33-5b9c-49a0-98e4-fcab61350146
7dd7f8f5-d12c-4cc2-8437-55e3fb489c05	\N	\N	test	023e06ab-df21-4ee6-9c87-13e934961da3	2	20	t	be5ee6af-a15d-410f-b466-6e614cde7d61	\N
900178fc-4006-4601-bd2b-7ec7228fcfc4	\N	idp-confirm-link	test	be5ee6af-a15d-410f-b466-6e614cde7d61	0	10	f	\N	\N
e3cf2c73-3360-462a-8eac-e582e385aaa1	\N	\N	test	be5ee6af-a15d-410f-b466-6e614cde7d61	0	20	t	97ab45d5-b15d-428b-9578-2e80a5db1439	\N
43896ec6-c745-4a72-b7fb-05c2d7a0270f	\N	idp-email-verification	test	97ab45d5-b15d-428b-9578-2e80a5db1439	2	10	f	\N	\N
559d266c-a529-4f4c-a4b3-ba41a1c6a3b2	\N	\N	test	97ab45d5-b15d-428b-9578-2e80a5db1439	2	20	t	52ccc412-6618-4571-a3f7-763b3d38d1f0	\N
667718c2-2f8f-43a9-b45a-a44c6472993e	\N	idp-username-password-form	test	52ccc412-6618-4571-a3f7-763b3d38d1f0	0	10	f	\N	\N
797069de-1b2a-43ef-bef5-875d715847ba	\N	\N	test	52ccc412-6618-4571-a3f7-763b3d38d1f0	1	20	t	05c8a79d-2c64-4523-a788-e14cd9a2cf5a	\N
4585b97e-524c-4e3c-9bdc-982aee0dc469	\N	conditional-user-configured	test	05c8a79d-2c64-4523-a788-e14cd9a2cf5a	0	10	f	\N	\N
6b462b19-b4d7-4a1e-8d1c-73c14058547e	\N	auth-otp-form	test	05c8a79d-2c64-4523-a788-e14cd9a2cf5a	0	20	f	\N	\N
0e66a303-7e01-4bc1-ade3-bb7ffd8a60eb	\N	http-basic-authenticator	test	e58b5276-407a-4126-8651-f56319d290e7	0	10	f	\N	\N
6def5516-bc01-434e-ad02-dda1c43f5a81	\N	docker-http-basic-authenticator	test	ce555d1c-89b3-4c86-847b-e6344e5b112f	0	10	f	\N	\N
b1d965c5-f7b7-4ef0-9365-c67376efb3f0	\N	no-cookie-redirect	test	2cd9032f-ace4-4f51-940c-9238be43832a	0	10	f	\N	\N
31a407e8-a34e-4864-9584-bde9270563dc	\N	\N	test	2cd9032f-ace4-4f51-940c-9238be43832a	0	20	t	0bc96034-6102-4398-bb3e-cc003e282570	\N
8bca2ece-3bed-41e9-bc22-06acba4b30e8	\N	basic-auth	test	0bc96034-6102-4398-bb3e-cc003e282570	0	10	f	\N	\N
f58827b8-8e38-4b4f-9bfc-ee5c351cca5a	\N	basic-auth-otp	test	0bc96034-6102-4398-bb3e-cc003e282570	3	20	f	\N	\N
9e4e6c43-1aee-412c-b5dd-d37e836f74a6	\N	auth-spnego	test	0bc96034-6102-4398-bb3e-cc003e282570	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
e35478b3-c358-4a4f-b171-182a23bc8612	browser	browser based authentication	master	basic-flow	t	t
4db48fbb-c5d2-4bb1-beb4-2f702909a851	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
78d374e8-7a9e-4b5f-ae7d-241e5eb5ea4a	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
864a4adf-9bc4-4fef-9145-c75dd0289279	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
6814641d-8708-46bb-99ad-59389a80a6f5	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
074ee797-1d55-411a-9fc2-35d1f8acb344	registration	registration flow	master	basic-flow	t	t
b8434bc6-64f9-41b7-982f-7312cb7a8afa	registration form	registration form	master	form-flow	f	t
06beb1d7-bdc4-4774-b26f-c1a357aa63f4	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
9d29ef20-a07c-43e9-a204-623492e04740	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	master	basic-flow	f	t
54b871c9-a583-4059-95fc-30b97f60691e	clients	Base authentication for clients	master	client-flow	t	t
8fd3abe5-c4b0-463e-b51b-7b30fdbc1f7c	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
b334504b-ea7c-4f69-8688-642695e38314	User creation or linking	Flow for the existing/non-existing user alternatives	master	basic-flow	f	t
c53b1f2b-8b5d-4ebf-8a07-7d9f0b6fdfbf	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
ce56f617-1ff7-477a-abaf-be9135041979	Account verification options	Method with which to verity the existing account	master	basic-flow	f	t
e205a7cf-e9a4-4105-9de8-d9844523604d	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
06a50835-69a8-4291-8e21-7a056f72dc7c	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	master	basic-flow	f	t
5643e121-b87f-4ff8-ae61-c70e69aa543c	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
3c89359b-102a-40c2-be22-e6cd773383e4	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
23c55c0d-fb6e-4d2b-a79d-e38a26dfce8c	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
4c6f96d7-dd16-44f9-9d06-329e9ca53dfa	Authentication Options	Authentication options.	master	basic-flow	f	t
861c2f38-ee98-438b-9072-7e38354436a0	browser	browser based authentication	test	basic-flow	t	t
92d90b0a-01a7-458d-ae09-cd43129fa5ea	forms	Username, password, otp and other auth forms.	test	basic-flow	f	t
c86684a3-4389-4d98-a7ff-32835e822ec6	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	test	basic-flow	f	t
b7d435b6-179a-4f69-99b7-900e2b4c7136	direct grant	OpenID Connect Resource Owner Grant	test	basic-flow	t	t
c62478af-715e-400c-bd2c-cdbdcc4d345f	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	test	basic-flow	f	t
0b5ae7c2-1c2b-4445-9f07-b327e925624f	registration	registration flow	test	basic-flow	t	t
a0e724fb-04e8-426a-8244-e23f70754e6c	registration form	registration form	test	form-flow	f	t
90c1fd27-8a04-409f-bc90-5d4184e20ead	reset credentials	Reset credentials for a user if they forgot their password or something	test	basic-flow	t	t
5e29a20f-03a1-4174-a75f-165298e9533a	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	test	basic-flow	f	t
4276738b-ac85-4274-9532-0dc8ebe79a3e	clients	Base authentication for clients	test	client-flow	t	t
e683bdf4-6018-4333-8a46-1a0d35c5832e	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	test	basic-flow	t	t
023e06ab-df21-4ee6-9c87-13e934961da3	User creation or linking	Flow for the existing/non-existing user alternatives	test	basic-flow	f	t
be5ee6af-a15d-410f-b466-6e614cde7d61	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	test	basic-flow	f	t
97ab45d5-b15d-428b-9578-2e80a5db1439	Account verification options	Method with which to verity the existing account	test	basic-flow	f	t
52ccc412-6618-4571-a3f7-763b3d38d1f0	Verify Existing Account by Re-authentication	Reauthentication of existing account	test	basic-flow	f	t
05c8a79d-2c64-4523-a788-e14cd9a2cf5a	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	test	basic-flow	f	t
e58b5276-407a-4126-8651-f56319d290e7	saml ecp	SAML ECP Profile Authentication Flow	test	basic-flow	t	t
ce555d1c-89b3-4c86-847b-e6344e5b112f	docker auth	Used by Docker clients to authenticate against the IDP	test	basic-flow	t	t
2cd9032f-ace4-4f51-940c-9238be43832a	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	test	basic-flow	t	t
0bc96034-6102-4398-bb3e-cc003e282570	Authentication Options	Authentication options.	test	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
40dfcc80-3c6c-403e-95ac-5d82df3ff080	review profile config	master
2133ddc0-681d-48fd-81c3-893b40534700	create unique user config	master
8b26bf46-bc25-4ccc-9024-7d4533d5c534	review profile config	test
b8094e33-5b9c-49a0-98e4-fcab61350146	create unique user config	test
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
40dfcc80-3c6c-403e-95ac-5d82df3ff080	missing	update.profile.on.first.login
2133ddc0-681d-48fd-81c3-893b40534700	false	require.password.update.after.registration
8b26bf46-bc25-4ccc-9024-7d4533d5c534	missing	update.profile.on.first.login
b8094e33-5b9c-49a0-98e4-fcab61350146	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled) FROM stdin;
fddadf01-eb47-448a-8162-1d070c54bd57	t	t	master-realm	0	f	b919c920-636f-4773-a70a-89e99e2ca8b3	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	t	f	account	0	f	8e4232c2-a43d-49e9-9415-ff237f15fca9	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f
a1149490-4070-4b5b-92a7-c8e2b3833d45	t	f	broker	0	f	53754882-1801-485c-b2cd-ac215a925056	\N	f	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f
71f7395f-46fe-4aaa-a256-82e1a34fd69e	t	f	security-admin-console	0	t	f06b5427-bab4-4e93-805d-ceb578348885	/admin/master/console/	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f
11856b4e-d6af-440f-85a8-4899ff5e9ce1	t	f	admin-cli	0	t	4f620bc3-b6fe-49c8-9403-b6123e724483	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t
d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	f	realm-management	0	f	c949f41f-8b84-48fa-a2df-02d9230a41a2	\N	t	\N	f	test	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f
9585c931-950f-4432-a86f-d9434e6bd696	t	f	broker	0	f	642c7e80-ad15-42a6-bcad-162646f4398e	\N	f	\N	f	test	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f
6f3709e4-c0f4-4712-80ef-cc52c18e3d5a	t	f	admin-cli	0	t	fa1ca82e-c4cb-419f-b30c-f4e8ffe3d3c0	\N	f	\N	f	test	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t
447f0d0b-3aa9-4446-8ef4-543579bf3623	t	t	flask-oidc-example	1578776392	f	1756a117-0d16-49c9-9416-a1ee123bbf62	/realms/test/flask-oidc-example/	f		f	test	openid-connect	-1	f	t	\N	t	client-secret	${authBaseUrl}	\N	\N	t	f	t
f49b838f-f76a-494f-b435-ca4d272b55f2	t	t	hello-world-app	0	f	ff9e93d0-10bd-4016-aff9-8a270ad7baa8	/realms/test/hello-world-app/	f		f	test	openid-connect	0	f	f	hello-world-app	t	client-secret	${authBaseUrl}	\N	\N	t	f	f
f6aebd7e-8c73-4b26-a315-cb50139df39e	t	t	amestris-realm	0	f	b981cb80-bfb1-4a85-8f60-2a3fbb4b4c25	\N	t	\N	f	master	\N	0	f	f	test Realm	f	client-secret	\N	\N	\N	t	f	f
d74f2587-42a1-431c-b509-d7f4acd67b6b	t	f	security-admin-console	0	t	1009e947-67bc-4aff-aa95-e3ba32e50a0e	/admin/amestris/console/	f	\N	f	test	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f
8034070c-de34-44ed-8d12-43135a7ac5fd	t	f	account	0	f	9aa33eeb-95c5-49b3-8ff1-0e79811f4b0b	/realms/amestris/account/	f	\N	f	test	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f
17d6b9dd-1409-4475-bbf5-ca457212aadc	t	f	echo-example	0	f	7a7ab54b-d295-4ac0-8462-b16566649774	/realms/test/echo-example/	f	\N	f	test	openid-connect	-1	f	f	\N	t	client-secret	\N	\N	\N	t	f	t
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
f49b838f-f76a-494f-b435-ca4d272b55f2	false	saml.server.signature
f49b838f-f76a-494f-b435-ca4d272b55f2	false	saml.server.signature.keyinfo.ext
f49b838f-f76a-494f-b435-ca4d272b55f2	false	saml.assertion.signature
f49b838f-f76a-494f-b435-ca4d272b55f2	false	saml.client.signature
f49b838f-f76a-494f-b435-ca4d272b55f2	false	saml.encrypt
f49b838f-f76a-494f-b435-ca4d272b55f2	false	saml.authnstatement
f49b838f-f76a-494f-b435-ca4d272b55f2	false	saml.onetimeuse.condition
f49b838f-f76a-494f-b435-ca4d272b55f2	false	saml_force_name_id_format
f49b838f-f76a-494f-b435-ca4d272b55f2	false	saml.multivalued.roles
f49b838f-f76a-494f-b435-ca4d272b55f2	false	saml.force.post.binding
f49b838f-f76a-494f-b435-ca4d272b55f2	false	exclude.session.state.from.auth.response
f49b838f-f76a-494f-b435-ca4d272b55f2	false	tls.client.certificate.bound.access.tokens
f49b838f-f76a-494f-b435-ca4d272b55f2	false	display.on.consent.screen
8034070c-de34-44ed-8d12-43135a7ac5fd	false	saml.server.signature
8034070c-de34-44ed-8d12-43135a7ac5fd	false	saml.server.signature.keyinfo.ext
8034070c-de34-44ed-8d12-43135a7ac5fd	false	saml.assertion.signature
8034070c-de34-44ed-8d12-43135a7ac5fd	false	saml.client.signature
8034070c-de34-44ed-8d12-43135a7ac5fd	false	saml.encrypt
8034070c-de34-44ed-8d12-43135a7ac5fd	false	saml.authnstatement
8034070c-de34-44ed-8d12-43135a7ac5fd	false	saml.onetimeuse.condition
8034070c-de34-44ed-8d12-43135a7ac5fd	false	saml_force_name_id_format
8034070c-de34-44ed-8d12-43135a7ac5fd	false	saml.multivalued.roles
8034070c-de34-44ed-8d12-43135a7ac5fd	false	saml.force.post.binding
8034070c-de34-44ed-8d12-43135a7ac5fd	false	exclude.session.state.from.auth.response
8034070c-de34-44ed-8d12-43135a7ac5fd	false	tls.client.certificate.bound.access.tokens
8034070c-de34-44ed-8d12-43135a7ac5fd	false	display.on.consent.screen
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	saml.server.signature
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	saml.server.signature.keyinfo.ext
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	saml.assertion.signature
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	saml.client.signature
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	saml.encrypt
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	saml.authnstatement
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	saml.onetimeuse.condition
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	saml_force_name_id_format
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	saml.multivalued.roles
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	saml.force.post.binding
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	exclude.session.state.from.auth.response
447f0d0b-3aa9-4446-8ef4-543579bf3623	false	tls.client.certificate.bound.access.tokens
447f0d0b-3aa9-4446-8ef4-543579bf3623	true	display.on.consent.screen
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	saml.server.signature
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	saml.server.signature.keyinfo.ext
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	saml.assertion.signature
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	saml.client.signature
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	saml.encrypt
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	saml.authnstatement
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	saml.onetimeuse.condition
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	saml_force_name_id_format
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	saml.multivalued.roles
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	saml.force.post.binding
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	exclude.session.state.from.auth.response
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	tls.client.certificate.bound.access.tokens
17d6b9dd-1409-4475-bbf5-ca457212aadc	false	display.on.consent.screen
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_default_roles (client_id, role_id) FROM stdin;
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	ec305514-3d2b-42dc-9dc6-228b4453a97e
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	a682ef18-1df1-4e67-b538-943ec8da2ca9
8034070c-de34-44ed-8d12-43135a7ac5fd	1df7206c-7798-47ba-9087-2f004d5f70e1
8034070c-de34-44ed-8d12-43135a7ac5fd	5f6c438c-34a1-4690-bbe6-acebd0f5f38b
f49b838f-f76a-494f-b435-ca4d272b55f2	0c9f8992-ad33-4829-ab67-05fa9eed5ec0
f49b838f-f76a-494f-b435-ca4d272b55f2	a11e9f11-7ec9-4292-b253-ffd375b7fe45
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
219d3736-7305-4055-a4c8-6d9f950768e1	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
ebb1e0ea-89bc-4148-bc5b-adee0c53e4cc	role_list	master	SAML role list	saml
fa47aa38-b9cf-4a73-839f-e894454d87e4	profile	master	OpenID Connect built-in scope: profile	openid-connect
267c549c-13a9-4f2d-845c-75d05e051171	email	master	OpenID Connect built-in scope: email	openid-connect
196f3647-0d41-4664-8aa1-4c7a385c9c88	address	master	OpenID Connect built-in scope: address	openid-connect
5e5f45bb-74ae-46f6-9f8a-020f0883232b	phone	master	OpenID Connect built-in scope: phone	openid-connect
6b2cf748-da35-408b-b16b-90eebd69ef2c	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
3afb9eee-0e8d-4395-9d8e-7b64f9294212	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
241da5c9-7145-4fd0-bea3-5dd56572ddb3	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
103e0893-f8bd-4400-8d0d-3dbb4403ed53	offline_access	test	OpenID Connect built-in scope: offline_access	openid-connect
234c5f44-9458-468e-b580-7d2fef1581f4	role_list	test	SAML role list	saml
b76be569-7820-4b0d-b8b5-dcef52a34f13	profile	test	OpenID Connect built-in scope: profile	openid-connect
b6c48a5b-f445-418c-b0cb-3694b520f873	email	test	OpenID Connect built-in scope: email	openid-connect
bc9ba4ac-4607-405c-9ee6-8e5080802f94	address	test	OpenID Connect built-in scope: address	openid-connect
2d8f14f6-8fc2-42bc-9b7d-25db32488e13	phone	test	OpenID Connect built-in scope: phone	openid-connect
5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	roles	test	OpenID Connect scope for add user roles to the access token	openid-connect
7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	web-origins	test	OpenID Connect scope for add allowed web origins to the access token	openid-connect
fecfa920-1e7a-4b90-a979-e14ff74bd213	microprofile-jwt	test	Microprofile - JWT built-in scope	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
219d3736-7305-4055-a4c8-6d9f950768e1	true	display.on.consent.screen
219d3736-7305-4055-a4c8-6d9f950768e1	${offlineAccessScopeConsentText}	consent.screen.text
ebb1e0ea-89bc-4148-bc5b-adee0c53e4cc	true	display.on.consent.screen
ebb1e0ea-89bc-4148-bc5b-adee0c53e4cc	${samlRoleListScopeConsentText}	consent.screen.text
fa47aa38-b9cf-4a73-839f-e894454d87e4	true	display.on.consent.screen
fa47aa38-b9cf-4a73-839f-e894454d87e4	${profileScopeConsentText}	consent.screen.text
fa47aa38-b9cf-4a73-839f-e894454d87e4	true	include.in.token.scope
267c549c-13a9-4f2d-845c-75d05e051171	true	display.on.consent.screen
267c549c-13a9-4f2d-845c-75d05e051171	${emailScopeConsentText}	consent.screen.text
267c549c-13a9-4f2d-845c-75d05e051171	true	include.in.token.scope
196f3647-0d41-4664-8aa1-4c7a385c9c88	true	display.on.consent.screen
196f3647-0d41-4664-8aa1-4c7a385c9c88	${addressScopeConsentText}	consent.screen.text
196f3647-0d41-4664-8aa1-4c7a385c9c88	true	include.in.token.scope
5e5f45bb-74ae-46f6-9f8a-020f0883232b	true	display.on.consent.screen
5e5f45bb-74ae-46f6-9f8a-020f0883232b	${phoneScopeConsentText}	consent.screen.text
5e5f45bb-74ae-46f6-9f8a-020f0883232b	true	include.in.token.scope
6b2cf748-da35-408b-b16b-90eebd69ef2c	true	display.on.consent.screen
6b2cf748-da35-408b-b16b-90eebd69ef2c	${rolesScopeConsentText}	consent.screen.text
6b2cf748-da35-408b-b16b-90eebd69ef2c	false	include.in.token.scope
3afb9eee-0e8d-4395-9d8e-7b64f9294212	false	display.on.consent.screen
3afb9eee-0e8d-4395-9d8e-7b64f9294212		consent.screen.text
3afb9eee-0e8d-4395-9d8e-7b64f9294212	false	include.in.token.scope
241da5c9-7145-4fd0-bea3-5dd56572ddb3	false	display.on.consent.screen
241da5c9-7145-4fd0-bea3-5dd56572ddb3	true	include.in.token.scope
103e0893-f8bd-4400-8d0d-3dbb4403ed53	true	display.on.consent.screen
103e0893-f8bd-4400-8d0d-3dbb4403ed53	${offlineAccessScopeConsentText}	consent.screen.text
234c5f44-9458-468e-b580-7d2fef1581f4	true	display.on.consent.screen
234c5f44-9458-468e-b580-7d2fef1581f4	${samlRoleListScopeConsentText}	consent.screen.text
b76be569-7820-4b0d-b8b5-dcef52a34f13	true	display.on.consent.screen
b76be569-7820-4b0d-b8b5-dcef52a34f13	${profileScopeConsentText}	consent.screen.text
b76be569-7820-4b0d-b8b5-dcef52a34f13	true	include.in.token.scope
b6c48a5b-f445-418c-b0cb-3694b520f873	true	display.on.consent.screen
b6c48a5b-f445-418c-b0cb-3694b520f873	${emailScopeConsentText}	consent.screen.text
b6c48a5b-f445-418c-b0cb-3694b520f873	true	include.in.token.scope
bc9ba4ac-4607-405c-9ee6-8e5080802f94	true	display.on.consent.screen
bc9ba4ac-4607-405c-9ee6-8e5080802f94	${addressScopeConsentText}	consent.screen.text
bc9ba4ac-4607-405c-9ee6-8e5080802f94	true	include.in.token.scope
2d8f14f6-8fc2-42bc-9b7d-25db32488e13	true	display.on.consent.screen
2d8f14f6-8fc2-42bc-9b7d-25db32488e13	${phoneScopeConsentText}	consent.screen.text
2d8f14f6-8fc2-42bc-9b7d-25db32488e13	true	include.in.token.scope
5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	true	display.on.consent.screen
5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	${rolesScopeConsentText}	consent.screen.text
5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	false	include.in.token.scope
7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	false	display.on.consent.screen
7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed		consent.screen.text
7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	false	include.in.token.scope
fecfa920-1e7a-4b90-a979-e14ff74bd213	false	display.on.consent.screen
fecfa920-1e7a-4b90-a979-e14ff74bd213	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	ebb1e0ea-89bc-4148-bc5b-adee0c53e4cc	t
11856b4e-d6af-440f-85a8-4899ff5e9ce1	ebb1e0ea-89bc-4148-bc5b-adee0c53e4cc	t
a1149490-4070-4b5b-92a7-c8e2b3833d45	ebb1e0ea-89bc-4148-bc5b-adee0c53e4cc	t
fddadf01-eb47-448a-8162-1d070c54bd57	ebb1e0ea-89bc-4148-bc5b-adee0c53e4cc	t
71f7395f-46fe-4aaa-a256-82e1a34fd69e	ebb1e0ea-89bc-4148-bc5b-adee0c53e4cc	t
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	fa47aa38-b9cf-4a73-839f-e894454d87e4	t
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	267c549c-13a9-4f2d-845c-75d05e051171	t
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	6b2cf748-da35-408b-b16b-90eebd69ef2c	t
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	3afb9eee-0e8d-4395-9d8e-7b64f9294212	t
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	219d3736-7305-4055-a4c8-6d9f950768e1	f
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	196f3647-0d41-4664-8aa1-4c7a385c9c88	f
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	5e5f45bb-74ae-46f6-9f8a-020f0883232b	f
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	241da5c9-7145-4fd0-bea3-5dd56572ddb3	f
11856b4e-d6af-440f-85a8-4899ff5e9ce1	fa47aa38-b9cf-4a73-839f-e894454d87e4	t
11856b4e-d6af-440f-85a8-4899ff5e9ce1	267c549c-13a9-4f2d-845c-75d05e051171	t
11856b4e-d6af-440f-85a8-4899ff5e9ce1	6b2cf748-da35-408b-b16b-90eebd69ef2c	t
11856b4e-d6af-440f-85a8-4899ff5e9ce1	3afb9eee-0e8d-4395-9d8e-7b64f9294212	t
11856b4e-d6af-440f-85a8-4899ff5e9ce1	219d3736-7305-4055-a4c8-6d9f950768e1	f
11856b4e-d6af-440f-85a8-4899ff5e9ce1	196f3647-0d41-4664-8aa1-4c7a385c9c88	f
11856b4e-d6af-440f-85a8-4899ff5e9ce1	5e5f45bb-74ae-46f6-9f8a-020f0883232b	f
11856b4e-d6af-440f-85a8-4899ff5e9ce1	241da5c9-7145-4fd0-bea3-5dd56572ddb3	f
a1149490-4070-4b5b-92a7-c8e2b3833d45	fa47aa38-b9cf-4a73-839f-e894454d87e4	t
a1149490-4070-4b5b-92a7-c8e2b3833d45	267c549c-13a9-4f2d-845c-75d05e051171	t
a1149490-4070-4b5b-92a7-c8e2b3833d45	6b2cf748-da35-408b-b16b-90eebd69ef2c	t
a1149490-4070-4b5b-92a7-c8e2b3833d45	3afb9eee-0e8d-4395-9d8e-7b64f9294212	t
a1149490-4070-4b5b-92a7-c8e2b3833d45	219d3736-7305-4055-a4c8-6d9f950768e1	f
a1149490-4070-4b5b-92a7-c8e2b3833d45	196f3647-0d41-4664-8aa1-4c7a385c9c88	f
a1149490-4070-4b5b-92a7-c8e2b3833d45	5e5f45bb-74ae-46f6-9f8a-020f0883232b	f
a1149490-4070-4b5b-92a7-c8e2b3833d45	241da5c9-7145-4fd0-bea3-5dd56572ddb3	f
fddadf01-eb47-448a-8162-1d070c54bd57	fa47aa38-b9cf-4a73-839f-e894454d87e4	t
fddadf01-eb47-448a-8162-1d070c54bd57	267c549c-13a9-4f2d-845c-75d05e051171	t
fddadf01-eb47-448a-8162-1d070c54bd57	6b2cf748-da35-408b-b16b-90eebd69ef2c	t
fddadf01-eb47-448a-8162-1d070c54bd57	3afb9eee-0e8d-4395-9d8e-7b64f9294212	t
fddadf01-eb47-448a-8162-1d070c54bd57	219d3736-7305-4055-a4c8-6d9f950768e1	f
fddadf01-eb47-448a-8162-1d070c54bd57	196f3647-0d41-4664-8aa1-4c7a385c9c88	f
fddadf01-eb47-448a-8162-1d070c54bd57	5e5f45bb-74ae-46f6-9f8a-020f0883232b	f
fddadf01-eb47-448a-8162-1d070c54bd57	241da5c9-7145-4fd0-bea3-5dd56572ddb3	f
71f7395f-46fe-4aaa-a256-82e1a34fd69e	fa47aa38-b9cf-4a73-839f-e894454d87e4	t
71f7395f-46fe-4aaa-a256-82e1a34fd69e	267c549c-13a9-4f2d-845c-75d05e051171	t
71f7395f-46fe-4aaa-a256-82e1a34fd69e	6b2cf748-da35-408b-b16b-90eebd69ef2c	t
71f7395f-46fe-4aaa-a256-82e1a34fd69e	3afb9eee-0e8d-4395-9d8e-7b64f9294212	t
71f7395f-46fe-4aaa-a256-82e1a34fd69e	219d3736-7305-4055-a4c8-6d9f950768e1	f
71f7395f-46fe-4aaa-a256-82e1a34fd69e	196f3647-0d41-4664-8aa1-4c7a385c9c88	f
71f7395f-46fe-4aaa-a256-82e1a34fd69e	5e5f45bb-74ae-46f6-9f8a-020f0883232b	f
71f7395f-46fe-4aaa-a256-82e1a34fd69e	241da5c9-7145-4fd0-bea3-5dd56572ddb3	f
f6aebd7e-8c73-4b26-a315-cb50139df39e	ebb1e0ea-89bc-4148-bc5b-adee0c53e4cc	t
f6aebd7e-8c73-4b26-a315-cb50139df39e	fa47aa38-b9cf-4a73-839f-e894454d87e4	t
f6aebd7e-8c73-4b26-a315-cb50139df39e	267c549c-13a9-4f2d-845c-75d05e051171	t
f6aebd7e-8c73-4b26-a315-cb50139df39e	6b2cf748-da35-408b-b16b-90eebd69ef2c	t
f6aebd7e-8c73-4b26-a315-cb50139df39e	3afb9eee-0e8d-4395-9d8e-7b64f9294212	t
f6aebd7e-8c73-4b26-a315-cb50139df39e	219d3736-7305-4055-a4c8-6d9f950768e1	f
f6aebd7e-8c73-4b26-a315-cb50139df39e	196f3647-0d41-4664-8aa1-4c7a385c9c88	f
f6aebd7e-8c73-4b26-a315-cb50139df39e	5e5f45bb-74ae-46f6-9f8a-020f0883232b	f
f6aebd7e-8c73-4b26-a315-cb50139df39e	241da5c9-7145-4fd0-bea3-5dd56572ddb3	f
8034070c-de34-44ed-8d12-43135a7ac5fd	234c5f44-9458-468e-b580-7d2fef1581f4	t
6f3709e4-c0f4-4712-80ef-cc52c18e3d5a	234c5f44-9458-468e-b580-7d2fef1581f4	t
9585c931-950f-4432-a86f-d9434e6bd696	234c5f44-9458-468e-b580-7d2fef1581f4	t
d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	234c5f44-9458-468e-b580-7d2fef1581f4	t
d74f2587-42a1-431c-b509-d7f4acd67b6b	234c5f44-9458-468e-b580-7d2fef1581f4	t
8034070c-de34-44ed-8d12-43135a7ac5fd	b76be569-7820-4b0d-b8b5-dcef52a34f13	t
8034070c-de34-44ed-8d12-43135a7ac5fd	b6c48a5b-f445-418c-b0cb-3694b520f873	t
8034070c-de34-44ed-8d12-43135a7ac5fd	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	t
8034070c-de34-44ed-8d12-43135a7ac5fd	7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	t
8034070c-de34-44ed-8d12-43135a7ac5fd	103e0893-f8bd-4400-8d0d-3dbb4403ed53	f
8034070c-de34-44ed-8d12-43135a7ac5fd	bc9ba4ac-4607-405c-9ee6-8e5080802f94	f
8034070c-de34-44ed-8d12-43135a7ac5fd	2d8f14f6-8fc2-42bc-9b7d-25db32488e13	f
8034070c-de34-44ed-8d12-43135a7ac5fd	fecfa920-1e7a-4b90-a979-e14ff74bd213	f
6f3709e4-c0f4-4712-80ef-cc52c18e3d5a	b76be569-7820-4b0d-b8b5-dcef52a34f13	t
6f3709e4-c0f4-4712-80ef-cc52c18e3d5a	b6c48a5b-f445-418c-b0cb-3694b520f873	t
6f3709e4-c0f4-4712-80ef-cc52c18e3d5a	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	t
6f3709e4-c0f4-4712-80ef-cc52c18e3d5a	7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	t
6f3709e4-c0f4-4712-80ef-cc52c18e3d5a	103e0893-f8bd-4400-8d0d-3dbb4403ed53	f
6f3709e4-c0f4-4712-80ef-cc52c18e3d5a	bc9ba4ac-4607-405c-9ee6-8e5080802f94	f
6f3709e4-c0f4-4712-80ef-cc52c18e3d5a	2d8f14f6-8fc2-42bc-9b7d-25db32488e13	f
6f3709e4-c0f4-4712-80ef-cc52c18e3d5a	fecfa920-1e7a-4b90-a979-e14ff74bd213	f
9585c931-950f-4432-a86f-d9434e6bd696	b76be569-7820-4b0d-b8b5-dcef52a34f13	t
9585c931-950f-4432-a86f-d9434e6bd696	b6c48a5b-f445-418c-b0cb-3694b520f873	t
9585c931-950f-4432-a86f-d9434e6bd696	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	t
9585c931-950f-4432-a86f-d9434e6bd696	7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	t
9585c931-950f-4432-a86f-d9434e6bd696	103e0893-f8bd-4400-8d0d-3dbb4403ed53	f
9585c931-950f-4432-a86f-d9434e6bd696	bc9ba4ac-4607-405c-9ee6-8e5080802f94	f
9585c931-950f-4432-a86f-d9434e6bd696	2d8f14f6-8fc2-42bc-9b7d-25db32488e13	f
9585c931-950f-4432-a86f-d9434e6bd696	fecfa920-1e7a-4b90-a979-e14ff74bd213	f
d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	b76be569-7820-4b0d-b8b5-dcef52a34f13	t
d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	b6c48a5b-f445-418c-b0cb-3694b520f873	t
d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	t
d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	t
d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	103e0893-f8bd-4400-8d0d-3dbb4403ed53	f
d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	bc9ba4ac-4607-405c-9ee6-8e5080802f94	f
d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	2d8f14f6-8fc2-42bc-9b7d-25db32488e13	f
d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	fecfa920-1e7a-4b90-a979-e14ff74bd213	f
d74f2587-42a1-431c-b509-d7f4acd67b6b	b76be569-7820-4b0d-b8b5-dcef52a34f13	t
d74f2587-42a1-431c-b509-d7f4acd67b6b	b6c48a5b-f445-418c-b0cb-3694b520f873	t
d74f2587-42a1-431c-b509-d7f4acd67b6b	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	t
d74f2587-42a1-431c-b509-d7f4acd67b6b	7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	t
d74f2587-42a1-431c-b509-d7f4acd67b6b	103e0893-f8bd-4400-8d0d-3dbb4403ed53	f
d74f2587-42a1-431c-b509-d7f4acd67b6b	bc9ba4ac-4607-405c-9ee6-8e5080802f94	f
d74f2587-42a1-431c-b509-d7f4acd67b6b	2d8f14f6-8fc2-42bc-9b7d-25db32488e13	f
d74f2587-42a1-431c-b509-d7f4acd67b6b	fecfa920-1e7a-4b90-a979-e14ff74bd213	f
f49b838f-f76a-494f-b435-ca4d272b55f2	7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	t
f49b838f-f76a-494f-b435-ca4d272b55f2	234c5f44-9458-468e-b580-7d2fef1581f4	t
f49b838f-f76a-494f-b435-ca4d272b55f2	b76be569-7820-4b0d-b8b5-dcef52a34f13	t
f49b838f-f76a-494f-b435-ca4d272b55f2	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	t
f49b838f-f76a-494f-b435-ca4d272b55f2	b6c48a5b-f445-418c-b0cb-3694b520f873	t
f49b838f-f76a-494f-b435-ca4d272b55f2	bc9ba4ac-4607-405c-9ee6-8e5080802f94	f
f49b838f-f76a-494f-b435-ca4d272b55f2	2d8f14f6-8fc2-42bc-9b7d-25db32488e13	f
f49b838f-f76a-494f-b435-ca4d272b55f2	103e0893-f8bd-4400-8d0d-3dbb4403ed53	f
f49b838f-f76a-494f-b435-ca4d272b55f2	fecfa920-1e7a-4b90-a979-e14ff74bd213	f
447f0d0b-3aa9-4446-8ef4-543579bf3623	234c5f44-9458-468e-b580-7d2fef1581f4	t
447f0d0b-3aa9-4446-8ef4-543579bf3623	b76be569-7820-4b0d-b8b5-dcef52a34f13	t
447f0d0b-3aa9-4446-8ef4-543579bf3623	b6c48a5b-f445-418c-b0cb-3694b520f873	t
447f0d0b-3aa9-4446-8ef4-543579bf3623	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	t
447f0d0b-3aa9-4446-8ef4-543579bf3623	7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	t
447f0d0b-3aa9-4446-8ef4-543579bf3623	103e0893-f8bd-4400-8d0d-3dbb4403ed53	f
447f0d0b-3aa9-4446-8ef4-543579bf3623	bc9ba4ac-4607-405c-9ee6-8e5080802f94	f
447f0d0b-3aa9-4446-8ef4-543579bf3623	2d8f14f6-8fc2-42bc-9b7d-25db32488e13	f
447f0d0b-3aa9-4446-8ef4-543579bf3623	fecfa920-1e7a-4b90-a979-e14ff74bd213	f
17d6b9dd-1409-4475-bbf5-ca457212aadc	234c5f44-9458-468e-b580-7d2fef1581f4	t
17d6b9dd-1409-4475-bbf5-ca457212aadc	b76be569-7820-4b0d-b8b5-dcef52a34f13	t
17d6b9dd-1409-4475-bbf5-ca457212aadc	b6c48a5b-f445-418c-b0cb-3694b520f873	t
17d6b9dd-1409-4475-bbf5-ca457212aadc	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	t
17d6b9dd-1409-4475-bbf5-ca457212aadc	7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	t
17d6b9dd-1409-4475-bbf5-ca457212aadc	103e0893-f8bd-4400-8d0d-3dbb4403ed53	f
17d6b9dd-1409-4475-bbf5-ca457212aadc	bc9ba4ac-4607-405c-9ee6-8e5080802f94	f
17d6b9dd-1409-4475-bbf5-ca457212aadc	2d8f14f6-8fc2-42bc-9b7d-25db32488e13	f
17d6b9dd-1409-4475-bbf5-ca457212aadc	fecfa920-1e7a-4b90-a979-e14ff74bd213	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
219d3736-7305-4055-a4c8-6d9f950768e1	38450e29-581b-40b1-9d1b-40b5f5292639
103e0893-f8bd-4400-8d0d-3dbb4403ed53	0718e5ce-17c2-441e-95e8-3dd6ab741a45
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
ceccac54-79cf-4aef-a18b-88e208b000f0	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
a75021a0-fd0a-419e-99e4-486ee135d3ad	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
95099b91-eade-46f0-a1d9-88d3aceb5900	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
624c0ae1-4e19-436d-888f-0403193ca870	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
e2f9c67b-e4c1-4f14-baed-00ab559851da	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
99e377c8-11b5-4b66-9f5f-8d3561c9429f	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
93ea39ad-6141-49e4-8fd9-d3749c2826cc	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
e56e6818-7cd5-41b4-a84d-06523d532673	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
ffd658c9-2a68-4224-bc56-f5ffd8729454	rsa-generated	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
29656cd7-2083-4684-809a-96d1cf60026a	hmac-generated	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
f50e77af-bb83-4c28-abc9-84103efd3ae1	aes-generated	master	aes-generated	org.keycloak.keys.KeyProvider	master	\N
2ed72bd1-27e7-443b-9e1d-cb4ec28ab9c7	rsa-generated	test	rsa-generated	org.keycloak.keys.KeyProvider	test	\N
66d3947d-9806-4fc2-9444-0f5844b6154f	hmac-generated	test	hmac-generated	org.keycloak.keys.KeyProvider	test	\N
3765c055-564b-4fc9-b4e0-b48c35a81621	aes-generated	test	aes-generated	org.keycloak.keys.KeyProvider	test	\N
45778a80-4fc1-4f8a-8060-2b4c0e8cec42	Trusted Hosts	test	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	test	anonymous
cc816975-7e62-4980-b6cf-c131570a221f	Consent Required	test	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	test	anonymous
80f8d177-51b3-4033-b58c-2a51de8d704c	Full Scope Disabled	test	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	test	anonymous
aa0da687-93a7-4466-8cca-34f4a8112b71	Max Clients Limit	test	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	test	anonymous
be919fb8-3a9d-40b2-807a-7af176e1d39c	Allowed Protocol Mapper Types	test	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	test	anonymous
e462b248-d215-48bb-ab04-780e5ac8848b	Allowed Client Scopes	test	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	test	anonymous
521437b5-259d-42e2-9438-130728c45281	Allowed Protocol Mapper Types	test	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	test	authenticated
7d349226-4ece-4acc-814e-c072624a5269	Allowed Client Scopes	test	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	test	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
bd45866d-0d40-44da-ba07-8fd7394257b6	e56e6818-7cd5-41b4-a84d-06523d532673	allow-default-scopes	true
eaea79b7-97cf-4b0f-a8ea-97fbde4baaa5	624c0ae1-4e19-436d-888f-0403193ca870	max-clients	200
a7b0b6e2-9d2e-4597-9bb7-1c2fafff5eb9	99e377c8-11b5-4b66-9f5f-8d3561c9429f	allow-default-scopes	true
705445d6-18a8-40a7-85e1-78ba7883e04c	e2f9c67b-e4c1-4f14-baed-00ab559851da	allowed-protocol-mapper-types	saml-user-attribute-mapper
d0356bff-3d86-4dfd-9c61-319c1876d4d2	e2f9c67b-e4c1-4f14-baed-00ab559851da	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
6f71f97e-7c48-4124-b93e-b05b037d5194	e2f9c67b-e4c1-4f14-baed-00ab559851da	allowed-protocol-mapper-types	saml-role-list-mapper
aace8162-cd1a-46ca-b66f-d52d4eba7a87	e2f9c67b-e4c1-4f14-baed-00ab559851da	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
f337eb25-998a-4458-81a9-7f1e72b1d51f	e2f9c67b-e4c1-4f14-baed-00ab559851da	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
5da6a854-535a-4bf8-9221-0dc0c5ef728c	e2f9c67b-e4c1-4f14-baed-00ab559851da	allowed-protocol-mapper-types	oidc-full-name-mapper
ebdbe53d-d1e2-4e41-9ee4-6f2c2ce71655	e2f9c67b-e4c1-4f14-baed-00ab559851da	allowed-protocol-mapper-types	saml-user-property-mapper
e0eb1529-c95b-44f0-9d5f-4da2a3ab04ea	e2f9c67b-e4c1-4f14-baed-00ab559851da	allowed-protocol-mapper-types	oidc-address-mapper
58a7bf02-58db-4fbd-9c78-720b5c483cd0	ceccac54-79cf-4aef-a18b-88e208b000f0	client-uris-must-match	true
ddb860ea-768d-4fce-bd1f-0db66396b08e	ceccac54-79cf-4aef-a18b-88e208b000f0	host-sending-registration-request-must-match	true
bc9b38fa-0f3f-499c-8da7-07421475cdec	93ea39ad-6141-49e4-8fd9-d3749c2826cc	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
29ef725d-2f0b-4646-ad66-7b02e1a769db	93ea39ad-6141-49e4-8fd9-d3749c2826cc	allowed-protocol-mapper-types	saml-role-list-mapper
5f011032-2cd1-4f85-b89b-987993c7545b	93ea39ad-6141-49e4-8fd9-d3749c2826cc	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
ac2ec7e3-45a3-431d-9272-05efa3fe8956	93ea39ad-6141-49e4-8fd9-d3749c2826cc	allowed-protocol-mapper-types	oidc-full-name-mapper
b206ffc6-a604-4b9e-8781-55c99dccd3ec	93ea39ad-6141-49e4-8fd9-d3749c2826cc	allowed-protocol-mapper-types	saml-user-property-mapper
7ccbdab3-8112-4c50-8638-b2004bf8cbdb	93ea39ad-6141-49e4-8fd9-d3749c2826cc	allowed-protocol-mapper-types	oidc-address-mapper
b0066bc1-4042-4aef-9d3c-42916a65f777	93ea39ad-6141-49e4-8fd9-d3749c2826cc	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
3b10a544-62bf-4aaa-98e4-10583c0f54b4	93ea39ad-6141-49e4-8fd9-d3749c2826cc	allowed-protocol-mapper-types	saml-user-attribute-mapper
5add6485-6abd-4eb6-b423-755385f5a695	ffd658c9-2a68-4224-bc56-f5ffd8729454	certificate	MIICmzCCAYMCBgFvOtlnbjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTkxMjI1MDIxNzAzWhcNMjkxMjI1MDIxODQzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCIbg6cNVCQyZhddK28I1Zm+w74h31aAbsLC2tNPJwKVemYOY6rbOhz7KSbMKfH1uXRnTkZyT4IXN2gSKByzwoub86xaeX+ZP68qIs4gcU1dYs/yDosxtkX6s5IdC3LxH9fq1mfqSs4cuKuCqrgYBTQk0BahlOUgLoXr6LadzpgTznI6nSaWDCZok5YwK0K8i7iy/FFm6QaI4CIX/J1r3sGwds/P6XBgU1JSHIU6vemHWAB74nr+NQENVurptmesSozYslaaSvKNeB33SAeQqRcRySno2sfj8L8U5VPN+hxzUZwk4EPpDPBY9ZIErK/ebnLpLVAq84IoEtl5Apx/gRnAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAFlVRoezdUfTk7xOhRDlK+qxmuDQgPBNvFrxp+d7b6b/4U0p6oNl73XdHb0PgXicY8fCyiHfczu0XgVtlc0pu3hfh5Y370N8r4v9brdcRO1/mp5U1+Wt144VAjSHawE9pLlswMfgoXJ0sHoYcdqx7/Q5Eftt+hcoYVD9LCvzSKqpDyYjz7EUrzuoCIr2pNeXq/QOnRPYKiN3gcW4+vstHqhxjE8I37EfR57BiB58NCuIEB1HQLXLMK13zAhTxY8N5HBZdSXl3zMFc50I+7+6MhnqfNy6eJErmErNGA5KhkXJ6gt87ggGtOXDcSYRGBXNaOjK49I665mHW5Gh0Gd4HE=
c43fc370-1eb3-47e1-a70d-299dc75b4b71	ffd658c9-2a68-4224-bc56-f5ffd8729454	privateKey	MIIEogIBAAKCAQEAiG4OnDVQkMmYXXStvCNWZvsO+Id9WgG7CwtrTTycClXpmDmOq2zoc+ykmzCnx9bl0Z05Gck+CFzdoEigcs8KLm/OsWnl/mT+vKiLOIHFNXWLP8g6LMbZF+rOSHQty8R/X6tZn6krOHLirgqq4GAU0JNAWoZTlIC6F6+i2nc6YE85yOp0mlgwmaJOWMCtCvIu4svxRZukGiOAiF/yda97BsHbPz+lwYFNSUhyFOr3ph1gAe+J6/jUBDVbq6bZnrEqM2LJWmkryjXgd90gHkKkXEckp6NrH4/C/FOVTzfocc1GcJOBD6QzwWPWSBKyv3m5y6S1QKvOCKBLZeQKcf4EZwIDAQABAoIBAH1lkx42zsdV1CrKDMnpPQhIZ/k9J5UsFAxRwZ1rQQ0q7BsThDPCVWH/t0hBD2XZ+sCQnyQ5WT/8g2RIfNkpvXTzJWriKBiMIaurytL0TBwX3xaP5hCz8GRQWKw1xMYO5Pg9GZJrviMTTZCkk2zKQzd2sObDolzTeLg+ohPlFI3hxUzorMKbjkt/bZCLxnwXbtpJHyu1bKjsryiMmtIysbWpPH0V39OqsQaAkslg95lPu9uIf5777QRADGqxbtR0A45RxPNSranHkWe9GyLsHr7m0NIPJGzPjy2DR83fEI3rNSpTUpabWMbEQ/oMj2sKCsAieImfcOXNsrN3eZHi9kECgYEA5RRJvOHNC8SzmMh5IbIapB4Dq0bkuEDf5uidILfaCRAgUFEUyDAm66z2ShnpPyGIluFLYHkz/lS2l5vfcWug3bknkHlxuGMPscToUg5pUAN9Gs7JrI4LpuzSGExuUr6emNJwgJouATEA+jf2TSZKgw4zCfK6oq3Z2XEolFnH8UcCgYEAmHZ4G3KFa3F7cZhqoqzZhLwsE13sDCaJxP47i0eE6Qw6qTWZDodB4/qnKCNQSdQe2uL5V3JsHT1w3a1AF8eL76rMLiBN3AHsrkZeos53u37doa/zK1x9iPwT4fDNcRzfpJAuqwcujkAcKfmB/hTd4WoYLTS01OPGqOS7EN+n4+ECgYB5eQig4Bua4fNaUPPqqkb2P/QyHqWqDryr9S1c7CDyLVr1PAmJHf+FeXIgWR0WHPIRD+aogZzQgJtSSZVyz1++MzCHq95hqCXqXj/TQ1EU3MS6Mm0+0xPasDm4KM9XkT0ITI7bouZCO3oJNSOmRWe9lwn5fHz7RrT+WMLr56/egQKBgAkJtNMDte8JmiTAwUmFb5uTwBUh0zVhL3eTDpqSEcny5KNVPw6CbCCEolYZyc+mmHGnVNqfONN+6erqM0t1k9EQUexGE/d/0bT/DOsfzC88NQ05rfObFwIA13jkWnljGcralTmkQllCaaj/VnpmaETNkkNTxYh9PDCU5pX4fC5hAoGAf/3KgrINqM60HfcNnkLNsKlO/GL/7KcJeZtsGpBf8Ahsu5dmxMZVTs6LJZt9LrbpE2T01tnr3b1qK3ec/d9S5bK5Og+WRgyTDNHbwLIo2OH2iE4Iza10Lez8Co94t7uDuSh+jEEFMzO5FF4VMNLGbnoAzdZrShksN7aOVaeyzzA=
56e849dd-53d0-4863-9122-bc71b4d89d7b	ffd658c9-2a68-4224-bc56-f5ffd8729454	priority	100
b1c605bf-713b-42db-80a0-e4baa8b3ae22	29656cd7-2083-4684-809a-96d1cf60026a	priority	100
b71d8cf1-5af4-471d-8f52-6b6d6633ef75	29656cd7-2083-4684-809a-96d1cf60026a	secret	Pz0_IuwMikezQbER83DZwPy6b2YiO3dtleN39aqzgX-SnbjDlj0pI9eLi6pyyU2HHLdq66wihky1xpNGY0dyzA
32c1662b-38ef-4a44-88a6-b87becf90fed	29656cd7-2083-4684-809a-96d1cf60026a	algorithm	HS256
29fef39f-fc43-4a26-b7bf-ee0df8ac596b	29656cd7-2083-4684-809a-96d1cf60026a	kid	5127b776-5150-4820-b2d4-04c1edae0373
5d66f941-8e4f-402f-9506-ba2537a1e5f0	f50e77af-bb83-4c28-abc9-84103efd3ae1	priority	100
547ff2ae-aa97-42cb-b8f7-e36542a6f507	f50e77af-bb83-4c28-abc9-84103efd3ae1	secret	Z9roc3t9aFGsr-Ks4ajD1g
2c08fa57-2623-49b2-8686-5e3171b156de	f50e77af-bb83-4c28-abc9-84103efd3ae1	kid	bf5c68e6-adb7-45ef-9d21-69099dde3490
170cde39-6307-46df-8ba9-d72976496872	3765c055-564b-4fc9-b4e0-b48c35a81621	secret	xegPNOFAP6sABwfOmrouZw
674e5692-5158-4b52-b9a5-b0a9770a52d3	3765c055-564b-4fc9-b4e0-b48c35a81621	priority	100
57a67a69-bb6a-43c8-ba84-3451c041fe8f	3765c055-564b-4fc9-b4e0-b48c35a81621	kid	aceef5f8-f29a-4302-86b5-e3ef0c3986e8
d0464a76-2d69-40db-86c7-4aee5f00ae59	2ed72bd1-27e7-443b-9e1d-cb4ec28ab9c7	certificate	MIIClzCCAX8CBgFvPk+5ujANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDAR0ZXN0MB4XDTE5MTIyNTE4MjUwOVoXDTI5MTIyNTE4MjY0OVowDzENMAsGA1UEAwwEdGVzdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ4wkFojotVdfOn6NW8O9LXTMnEqPU9xhWCUNhpge/wcEf188xp/5OjY0G/B1d29gofA3emQmJUPcMy1oBcoEWIfg7u5M46NK+PxlLUuzJOqc1RH+a5WOZuDY2hoklAuL4gQH1gTttPEek11w29mifN4YauiEAtwXY3PfGcT/FY7BQK6A/M0qrXGfMevmkOsCsS81TkjeLP81k+y0lLZTPhT09Aiwb6/YXkkST26UCzxiHi2k0lMxxr7KqBBxg8nH70nhGIOGiBXqUpQqEckust2m5tT+vCpcwmwFZ6EYOz88p4f2rY2W1VWFljp3uUQh84U8djgjAcOcE2rq07b1DcCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEANZ4t1pa0LKCmcj2tr1vMOLpy0LjntEZEl7e6ZPHczobD1pN7SIdkAQZoyRzOEyA2h8BEBe6gTiX0Ebq0qH9YnXIt0LkcqFpStnl+cUAwHqxRmYHmEqANs4VFlAXtZLTQx/Wq3T47P3rhfjqW0d9EhctcnCeu4bg6FPh1l6DU+LFaM06mgVvICJ7CcTeAipBG3uq1oWwQqq/YKRrlXWik4TpdddPjEYFeNyIbenTDnVNLFBatEYdvHcrCo0x0H7WufKs4tq0V31ZkhLn4iPPxa2rsdxS+UmRpT4XUodPpELHF4pbU2T446EKmsb+w3cOuOMz7mD21EkQYhM9ZbuVLFw==
c495a097-febf-459b-8b68-e13fb2a70694	2ed72bd1-27e7-443b-9e1d-cb4ec28ab9c7	privateKey	MIIEpAIBAAKCAQEAnjCQWiOi1V186fo1bw70tdMycSo9T3GFYJQ2GmB7/BwR/XzzGn/k6NjQb8HV3b2Ch8Dd6ZCYlQ9wzLWgFygRYh+Du7kzjo0r4/GUtS7Mk6pzVEf5rlY5m4NjaGiSUC4viBAfWBO208R6TXXDb2aJ83hhq6IQC3Bdjc98ZxP8VjsFAroD8zSqtcZ8x6+aQ6wKxLzVOSN4s/zWT7LSUtlM+FPT0CLBvr9heSRJPbpQLPGIeLaTSUzHGvsqoEHGDycfvSeEYg4aIFepSlCoRyS6y3abm1P68KlzCbAVnoRg7Pzynh/atjZbVVYWWOne5RCHzhTx2OCMBw5wTaurTtvUNwIDAQABAoIBACtH6EbxVxz/niy6S6JeOjABX9y8jNfOnIqHIqJm4aVh3L45UJ5gfbYDlEvvgd9QeYVBDLZZ3JV0Cw3HZ8zOJqttKfLTwjpvf6G3OFO2QTzptvJJWxQK/WoCMdGgQt/zMwgMOTc09aHNMRU+ckFpkbbuqfJ2veMTVFV3fncJbdH9lZBCTyhoPmK7Ez6uU7EdY5AA9MYKOq83FNQ67n0Q3m4mxRmzY529bcqrDrbHv1u9x1S7y+LJVGrEdU35ETdQVZr9v2/fdhJMM3GvAC5FTPKFNOYlntMWz//zGOAnrpE5YBPRES0iGVV5agR+iqYc2syCvDBjcPTWbMgfalgkw1kCgYEA9gu4kizriC4OmPtlW2c6Wo4Woi70lbDIa6rwl5bPIu3JHob3CJQvCoEoMUThoJ2ljhTho2nRXrXhNEybBrbAsgAFvI/waDXbDefGMMoS49rY1ipiJF+EsvvjuMeLJHjolyAWyrRW9eFRWeUwqq3IMXwk2PlrDxy8bX+zxaiB9JUCgYEApJbsb+TgHdkBM8uVENNvJtIeKFFeNFsyasvS6K9XpwV01Q9BqZaYzGGFqS9rreWKuWiDRz1V7YpWZUCkt6ir6m3VLbiE1Ryx5GnF4AVAKkqSuqvbtZO7nQzayO1Ldgihy3pdOaojCKi7i6P1EK+AZ27TqWk1TuHn4ayZrUMcRpsCgYEA4ucQQY23cBC5WY+Ne2uJPvWGHe8bk+hCDDjKQ6HKSDXtoX9p1bmCYDeX70fMo6h+grbzFxaBBMzKcMasuNZUglLO94PueswfxYUXGutf3E14ZpkThOOppr3w1fj/cpUmOihXnHwPLhWqRjK8XMqCslAAUzBA8ODZTEnWadPqdLkCgYB1T1jwG8qdm4ke2LDDkF+95K83/17MpF+X/PSzgh5QXjQ6k6gybrMzoSK6RqFSDbRFmDdRdGclap9PhbahbKgz69qwvr52gwBMFBPEKxnjyskwIcP0dHqZYosiAPfzBg4D0JBXxGs6BcG+srq+DMjRcA2Oxv0G3z79+56A/r9NlwKBgQDklUBbBHyo8aqLBYhprromFhAYQ2VVUGh4L1wbV8NnGfMUwn/TAl3Es40We+ssXrk7mNoZLESiGO65xAfcqUhZ8zqHoUKCjZ0TluSoOeXpkKx79WGtsnpLsfDmBLr5k16Owf703NkusE2VEyc4pV+McntMGVMzKcF1zSQ6GDxGrA==
fc20647b-3b55-4a67-9fee-dd53d5266d33	2ed72bd1-27e7-443b-9e1d-cb4ec28ab9c7	priority	100
4599068d-6d7a-4e9f-b941-165aea7786d9	66d3947d-9806-4fc2-9444-0f5844b6154f	secret	Wspu_HmfpaB5w1eAR02ojjIfSBspXEfvlKivT48y0FXFWzBReopvASBDTpEd2xRuAjH93u16tDsmfr53S4J8HQ
b3a6de87-40bf-436d-88c3-e0b48c1008e8	66d3947d-9806-4fc2-9444-0f5844b6154f	priority	100
14912bb7-ba4e-466e-b6ed-4ffd476c734c	66d3947d-9806-4fc2-9444-0f5844b6154f	algorithm	HS256
9f5215f0-66ff-4398-a0d4-da9a31a67809	66d3947d-9806-4fc2-9444-0f5844b6154f	kid	a4b86c44-fc92-4754-beb5-0c572fd067a5
41dd844e-22c4-494b-9ed0-42d4573848db	7d349226-4ece-4acc-814e-c072624a5269	allow-default-scopes	true
55b30c91-7cdf-4159-b524-8bf6dea24c88	45778a80-4fc1-4f8a-8060-2b4c0e8cec42	host-sending-registration-request-must-match	true
0670c241-82dc-43c9-b2c5-864021c3b45a	45778a80-4fc1-4f8a-8060-2b4c0e8cec42	client-uris-must-match	true
4ace5104-9a26-4a86-b942-d2d65a2c8bd5	aa0da687-93a7-4466-8cca-34f4a8112b71	max-clients	200
914ee3ea-25bd-487f-aee8-4c787ce0f3a4	521437b5-259d-42e2-9438-130728c45281	allowed-protocol-mapper-types	saml-user-property-mapper
ed29446b-ad09-4afb-bc0a-bf05b7769e53	521437b5-259d-42e2-9438-130728c45281	allowed-protocol-mapper-types	oidc-address-mapper
eb3184ad-cedb-43c8-bf31-b32e038a5245	521437b5-259d-42e2-9438-130728c45281	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
fe5eecf3-7240-4af1-9b76-f03346512356	521437b5-259d-42e2-9438-130728c45281	allowed-protocol-mapper-types	oidc-full-name-mapper
f7ecd461-3592-4f65-880b-908927dcfde2	521437b5-259d-42e2-9438-130728c45281	allowed-protocol-mapper-types	saml-user-attribute-mapper
666f240a-3ce0-45cc-bf37-24a1ff9b7fea	521437b5-259d-42e2-9438-130728c45281	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d1376882-0018-4657-bd73-3ea638204cb1	521437b5-259d-42e2-9438-130728c45281	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
aff7ad33-796e-4daf-9051-1e7dfea3949b	521437b5-259d-42e2-9438-130728c45281	allowed-protocol-mapper-types	saml-role-list-mapper
73d29438-7664-446b-b006-fcdc88a81429	e462b248-d215-48bb-ab04-780e5ac8848b	allow-default-scopes	true
d484c5e1-b5fe-4c1a-be85-ae10d778ffeb	be919fb8-3a9d-40b2-807a-7af176e1d39c	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
78631c82-eb59-4833-9bdf-2caf1a464bed	be919fb8-3a9d-40b2-807a-7af176e1d39c	allowed-protocol-mapper-types	saml-user-attribute-mapper
208cecef-0823-4a33-b8c3-a00c13fdf728	be919fb8-3a9d-40b2-807a-7af176e1d39c	allowed-protocol-mapper-types	saml-user-property-mapper
6e1568fa-3676-46c6-861b-8248d112767e	be919fb8-3a9d-40b2-807a-7af176e1d39c	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
bb845d63-8ef8-431f-9c7d-e3ef7242f851	be919fb8-3a9d-40b2-807a-7af176e1d39c	allowed-protocol-mapper-types	oidc-address-mapper
a2038526-a434-408a-a0c0-986a6bd26e3e	be919fb8-3a9d-40b2-807a-7af176e1d39c	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b0921635-33fb-47eb-bc71-99d7ca2397f5	be919fb8-3a9d-40b2-807a-7af176e1d39c	allowed-protocol-mapper-types	oidc-full-name-mapper
3a4b157d-4b28-4a61-8376-d15e78c30e34	be919fb8-3a9d-40b2-807a-7af176e1d39c	allowed-protocol-mapper-types	saml-role-list-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.composite_role (composite, child_role) FROM stdin;
1b8ab441-1d09-4ee0-9692-754a438e6595	6bb8e154-1a11-4fd7-9578-107ac4d97001
1b8ab441-1d09-4ee0-9692-754a438e6595	f6778d4b-b540-436f-82c5-bd05e1c72aa3
1b8ab441-1d09-4ee0-9692-754a438e6595	06a966a1-5fa2-441d-8c90-2494814936c6
1b8ab441-1d09-4ee0-9692-754a438e6595	2dcf9ee3-5739-4937-99b9-0a0638f9cdaf
1b8ab441-1d09-4ee0-9692-754a438e6595	0e24ecff-5b5f-413e-9d3c-1652e978283f
1b8ab441-1d09-4ee0-9692-754a438e6595	b93a53fc-54a1-472b-af0f-5cd9d1d4942a
1b8ab441-1d09-4ee0-9692-754a438e6595	dc323f53-1284-45d2-8514-69f00f4c8d5c
1b8ab441-1d09-4ee0-9692-754a438e6595	cac57a69-7a78-412c-b8d0-2ca3f4b1121a
1b8ab441-1d09-4ee0-9692-754a438e6595	eff9f943-21da-41db-a5fd-71aaaa95edc4
1b8ab441-1d09-4ee0-9692-754a438e6595	d6278edd-3c7f-45a9-85c2-23606a17ff74
1b8ab441-1d09-4ee0-9692-754a438e6595	6d17321d-a3a2-46b9-ac82-833294f2636b
1b8ab441-1d09-4ee0-9692-754a438e6595	50e0ff0a-97c0-4277-a561-9be9291b09ac
1b8ab441-1d09-4ee0-9692-754a438e6595	c85cf65e-4531-4aac-9c12-0b9bf5cfe37b
1b8ab441-1d09-4ee0-9692-754a438e6595	87844a1c-76f3-4cb8-b64d-357900350dd5
1b8ab441-1d09-4ee0-9692-754a438e6595	cb20a688-731c-4138-8048-56a0259bc30c
1b8ab441-1d09-4ee0-9692-754a438e6595	a3bd1046-c29a-4742-bd58-e8ceaa6ff034
1b8ab441-1d09-4ee0-9692-754a438e6595	a567b266-2c0c-4df9-b856-34be7760d31c
1b8ab441-1d09-4ee0-9692-754a438e6595	d7fcd2c7-517d-4ea8-9989-674c1d10cacd
2dcf9ee3-5739-4937-99b9-0a0638f9cdaf	cb20a688-731c-4138-8048-56a0259bc30c
2dcf9ee3-5739-4937-99b9-0a0638f9cdaf	d7fcd2c7-517d-4ea8-9989-674c1d10cacd
0e24ecff-5b5f-413e-9d3c-1652e978283f	a3bd1046-c29a-4742-bd58-e8ceaa6ff034
a682ef18-1df1-4e67-b538-943ec8da2ca9	df7d476a-42bf-4fde-a665-a1414e0c198f
1b8ab441-1d09-4ee0-9692-754a438e6595	594fb5c8-822e-4337-a94e-871e042f803e
1b8ab441-1d09-4ee0-9692-754a438e6595	285187ee-1d2a-4707-9c97-02b9a8b1d842
1b8ab441-1d09-4ee0-9692-754a438e6595	a9e186e0-ae42-4832-a516-2e9c5b2da50d
1b8ab441-1d09-4ee0-9692-754a438e6595	41501763-023e-44f9-8a79-261e0e615312
1b8ab441-1d09-4ee0-9692-754a438e6595	780745ae-ad6e-4a6f-8af9-a97597093e30
1b8ab441-1d09-4ee0-9692-754a438e6595	efdc263b-b222-42ff-95ab-ec9730b3d427
1b8ab441-1d09-4ee0-9692-754a438e6595	d2e30464-6b90-4e1f-b930-62a771502c30
1b8ab441-1d09-4ee0-9692-754a438e6595	8dc99e09-3574-4e15-879c-dc4ddb44662a
1b8ab441-1d09-4ee0-9692-754a438e6595	50f8dcb1-1a45-4d9c-9935-3581b364458c
1b8ab441-1d09-4ee0-9692-754a438e6595	f246f70c-3a95-474e-a234-df06961a7c18
1b8ab441-1d09-4ee0-9692-754a438e6595	0a3dfa1d-6a2b-4a09-812c-1e2182ad0724
1b8ab441-1d09-4ee0-9692-754a438e6595	0c597ceb-7946-4a14-9822-64d577a0da2d
1b8ab441-1d09-4ee0-9692-754a438e6595	38cdd5d9-e22e-476f-bc48-8649bd42a460
1b8ab441-1d09-4ee0-9692-754a438e6595	01eee3c4-2e61-4b0a-8713-aab968ee78a1
1b8ab441-1d09-4ee0-9692-754a438e6595	d5d3175c-257d-4cc0-812b-9be403aca93f
1b8ab441-1d09-4ee0-9692-754a438e6595	eeb59571-41f0-4669-ab55-3a9456c7cf3c
1b8ab441-1d09-4ee0-9692-754a438e6595	d215dd75-ce81-4328-9b62-976720780a74
1b8ab441-1d09-4ee0-9692-754a438e6595	998678c5-9ee2-4ff1-a3a0-899a0edd4e91
41501763-023e-44f9-8a79-261e0e615312	d5d3175c-257d-4cc0-812b-9be403aca93f
41501763-023e-44f9-8a79-261e0e615312	998678c5-9ee2-4ff1-a3a0-899a0edd4e91
780745ae-ad6e-4a6f-8af9-a97597093e30	eeb59571-41f0-4669-ab55-3a9456c7cf3c
e539d037-ad59-4543-a0d3-e6f349f82a91	35a01167-3b51-4044-9ebe-0560070f60da
e539d037-ad59-4543-a0d3-e6f349f82a91	6812369e-a014-447f-a781-35102eec77a9
e539d037-ad59-4543-a0d3-e6f349f82a91	1b9aaebc-e1f2-44e9-8121-a45ffe434487
e539d037-ad59-4543-a0d3-e6f349f82a91	b10527b3-0e6e-4d5a-b3d6-89b67ad8c736
e539d037-ad59-4543-a0d3-e6f349f82a91	55228928-2a60-4e87-89cd-64d0cfb74f9c
e539d037-ad59-4543-a0d3-e6f349f82a91	67db95a5-f5c1-4dac-99fe-416e2e068066
e539d037-ad59-4543-a0d3-e6f349f82a91	40ccc2b2-67b4-41a4-a0cc-b3ffda021223
e539d037-ad59-4543-a0d3-e6f349f82a91	5557702e-1554-4c36-b69a-7e89fad586b2
e539d037-ad59-4543-a0d3-e6f349f82a91	c81eec9c-b3c1-48c8-a522-5fd36d1ca268
e539d037-ad59-4543-a0d3-e6f349f82a91	fff0ef6e-103c-4a78-aff3-7d2d2a74d484
e539d037-ad59-4543-a0d3-e6f349f82a91	652fa8f1-8baf-4a0c-aa1e-f4102082d9cd
e539d037-ad59-4543-a0d3-e6f349f82a91	7a27437e-7495-4e46-93b4-2249810b88a0
e539d037-ad59-4543-a0d3-e6f349f82a91	89458e27-7d0d-485d-bd3a-5c25458bb5df
e539d037-ad59-4543-a0d3-e6f349f82a91	4112b12d-2b20-4165-b199-0f0ce97630cb
e539d037-ad59-4543-a0d3-e6f349f82a91	190e59d1-0302-489f-bc7b-8a9ff58b9546
e539d037-ad59-4543-a0d3-e6f349f82a91	a7fe00f2-625c-4b2b-98ee-8f2ffcfc1312
e539d037-ad59-4543-a0d3-e6f349f82a91	4267212a-3e66-4590-83ec-04485adb394b
1b9aaebc-e1f2-44e9-8121-a45ffe434487	4112b12d-2b20-4165-b199-0f0ce97630cb
1b9aaebc-e1f2-44e9-8121-a45ffe434487	4267212a-3e66-4590-83ec-04485adb394b
b10527b3-0e6e-4d5a-b3d6-89b67ad8c736	190e59d1-0302-489f-bc7b-8a9ff58b9546
1b8ab441-1d09-4ee0-9692-754a438e6595	92c9bc7c-5f6b-4e06-a275-dde8237e5e00
5f6c438c-34a1-4690-bbe6-acebd0f5f38b	2e5da527-8349-4385-91fe-6a000aa5aa1d
e539d037-ad59-4543-a0d3-e6f349f82a91	fb0f6105-6496-4b42-be8f-f480aedccd26
e6769c2e-c8b5-43f4-8b4c-327b8af2d12e	e3ebc595-a7b1-4096-b831-bc8f1d7bc663
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
597f675a-f198-46d5-ba91-aba823f38a54	\N	password	3958aa5c-b056-4cb1-b45c-524251e1c749	1577240325414	\N	{"value":"C87jTd9wauS8y8WFSHsMKbNM5ttGaBNOoE6YziCBHOoUraY5N954Ny3On5X2A8tYdsY9Pj6KvmGzhCxfU3p6eA==","salt":"KotSXUieWyk7iYrAICuaaw=="}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}	10
5f0bcb80-a842-4eed-aa16-930d56b744dc	\N	password	42d209d0-3ca7-4041-87f4-788ca6d9b32f	1578965534488	\N	{"value":"T/n/FViKARG4/OzW3aJ7QA6BfHDUjJSpVgzXtx3weSGq4BRrvjxHIGlHLgvoQAcEdQTGEToVLSlJgubo8cvJCA==","salt":"xw/iYHFzHG5p11tlDzrJTQ=="}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}	10
d5131635-c9e4-496a-9b42-614d025c53ba	\N	password	2e477043-4363-48ef-bb69-568c0c02b005	1578965548854	\N	{"value":"AEqE2VmstdB5nR6J+y4Nx+QwnGD1Cx8okv3hXmnfRpbxAmid/t5oOB9KP+bqYf2YKXTkY7lFBycta3o2lK2Btg==","salt":"OBudoXAACEm14CJkZHAm6w=="}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}	10
0c346568-bc60-483d-a123-49d6e46e4c8e	\N	password	01ed29c7-52c5-43a4-9d29-f466b2c59e82	1578965561099	\N	{"value":"GgfnFviRaHjy9+G1SJClBq5R2Vemq9gxgf/j8ObmsFRmvLcnf3tOSNCQ4aZhJ2fpIYcj5RrCoh5zcg/JMxTsMg==","salt":"7727G38xpToxjK1LF7pSUA=="}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2019-12-25 02:18:24.113837	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7240303336
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2019-12-25 02:18:24.145889	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	7240303336
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2019-12-25 02:18:24.285642	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	7240303336
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2019-12-25 02:18:24.317612	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	7240303336
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2019-12-25 02:18:24.565334	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7240303336
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2019-12-25 02:18:24.573454	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	7240303336
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2019-12-25 02:18:24.74213	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7240303336
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2019-12-25 02:18:24.770708	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	7240303336
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2019-12-25 02:18:24.789544	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	7240303336
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2019-12-25 02:18:25.095439	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	7240303336
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2019-12-25 02:18:25.32383	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7240303336
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2019-12-25 02:18:25.333996	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7240303336
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2019-12-25 02:18:25.840372	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	7240303336
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-12-25 02:18:26.006547	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	7240303336
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-12-25 02:18:26.016214	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7240303336
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-12-25 02:18:26.022728	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	7240303336
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-12-25 02:18:26.03161	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	7240303336
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2019-12-25 02:18:26.405733	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	7240303336
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2019-12-25 02:18:26.560675	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7240303336
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2019-12-25 02:18:26.572676	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7240303336
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-12-25 02:18:27.554654	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7240303336
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2019-12-25 02:18:26.581192	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	7240303336
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2019-12-25 02:18:26.589784	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	7240303336
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2019-12-25 02:18:26.667295	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	7240303336
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2019-12-25 02:18:26.675747	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7240303336
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2019-12-25 02:18:26.679759	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	7240303336
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2019-12-25 02:18:26.728435	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	7240303336
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2019-12-25 02:18:26.891437	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	7240303336
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2019-12-25 02:18:26.904848	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7240303336
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2019-12-25 02:18:27.045627	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	7240303336
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2019-12-25 02:18:27.06545	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	7240303336
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2019-12-25 02:18:27.101997	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	7240303336
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2019-12-25 02:18:27.112619	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	7240303336
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-12-25 02:18:27.123605	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	7240303336
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-12-25 02:18:27.130931	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7240303336
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-12-25 02:18:27.18465	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	7240303336
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2019-12-25 02:18:27.240548	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	7240303336
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-12-25 02:18:27.253573	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	7240303336
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2019-12-25 02:18:27.259471	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	7240303336
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2019-12-25 02:18:27.277789	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	7240303336
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-12-25 02:18:27.281961	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7240303336
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-12-25 02:18:27.285145	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	7240303336
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2019-12-25 02:18:27.29248	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	7240303336
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-12-25 02:18:27.511508	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	7240303336
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2019-12-25 02:18:27.540443	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	7240303336
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-12-25 02:18:27.562291	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	7240303336
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-12-25 02:18:27.566396	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	7240303336
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-12-25 02:18:27.621869	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	7240303336
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-12-25 02:18:27.646061	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	7240303336
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2019-12-25 02:18:27.710226	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	7240303336
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2019-12-25 02:18:27.766885	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	7240303336
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2019-12-25 02:18:27.773415	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	7240303336
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2019-12-25 02:18:27.778012	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	7240303336
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2019-12-25 02:18:27.78384	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	7240303336
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-12-25 02:18:27.793784	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	7240303336
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-12-25 02:18:27.802208	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	7240303336
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-12-25 02:18:27.867971	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	7240303336
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-12-25 02:18:28.131575	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	7240303336
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2019-12-25 02:18:28.218898	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	7240303336
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2019-12-25 02:18:28.231626	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	7240303336
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2019-12-25 02:18:28.249227	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	7240303336
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2019-12-25 02:18:28.25736	62	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	7240303336
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2019-12-25 02:18:28.277566	63	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7240303336
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2019-12-25 02:18:28.289824	64	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	7240303336
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2019-12-25 02:18:28.299348	65	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	7240303336
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2019-12-25 02:18:28.32135	66	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	7240303336
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2019-12-25 02:18:28.333506	67	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	7240303336
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2019-12-25 02:18:28.381923	68	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	7240303336
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2019-12-25 02:18:28.420713	69	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	7240303336
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2019-12-25 02:18:28.430426	70	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	7240303336
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2019-12-25 02:18:28.446739	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	7240303336
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2019-12-25 02:18:28.464184	72	EXECUTED	7:ec9707ae4d4f0b7452fee20128083879	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7240303336
8.0.0-updating-credential-data-not-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2019-12-25 02:18:28.474289	73	EXECUTED	7:03b3f4b264c3c68ba082250a80b74216	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7240303336
8.0.0-updating-credential-data-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2019-12-25 02:18:28.47767	74	MARK_RAN	7:64c5728f5ca1f5aa4392217701c4fe23	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	7240303336
8.0.0-credential-cleanup	keycloak	META-INF/jpa-changelog-8.0.0.xml	2019-12-25 02:18:28.504576	75	EXECUTED	7:41f3566ac5177459e1ed3ce8f0ad35d2	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	3.5.4	\N	\N	7240303336
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2019-12-25 02:18:28.51885	76	EXECUTED	7:a73379915c23bfad3e8f5c6d5c0aa4bd	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	3.5.4	\N	\N	7240303336
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	219d3736-7305-4055-a4c8-6d9f950768e1	f
master	ebb1e0ea-89bc-4148-bc5b-adee0c53e4cc	t
master	fa47aa38-b9cf-4a73-839f-e894454d87e4	t
master	267c549c-13a9-4f2d-845c-75d05e051171	t
master	196f3647-0d41-4664-8aa1-4c7a385c9c88	f
master	5e5f45bb-74ae-46f6-9f8a-020f0883232b	f
master	6b2cf748-da35-408b-b16b-90eebd69ef2c	t
master	3afb9eee-0e8d-4395-9d8e-7b64f9294212	t
master	241da5c9-7145-4fd0-bea3-5dd56572ddb3	f
test	103e0893-f8bd-4400-8d0d-3dbb4403ed53	f
test	234c5f44-9458-468e-b580-7d2fef1581f4	t
test	b76be569-7820-4b0d-b8b5-dcef52a34f13	t
test	b6c48a5b-f445-418c-b0cb-3694b520f873	t
test	bc9ba4ac-4607-405c-9ee6-8e5080802f94	f
test	2d8f14f6-8fc2-42bc-9b7d-25db32488e13	f
test	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d	t
test	7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed	t
test	fecfa920-1e7a-4b90-a979-e14ff74bd213	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
db44dfbe-7a60-473a-82f2-0596f395216e	echo-example	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","code_id":"21c79ff4-34b1-46a0-a33f-0087db7922a7","username":"edward.elric@gmail.com"}	invalid_user_credentials	192.168.64.1	test	\N	1578965474574	LOGIN_ERROR	01ed29c7-52c5-43a4-9d29-f466b2c59e82
cd4872a9-ab5e-4024-8197-6e3f6737cf40	echo-example	{"auth_method":"openid-connect","custom_required_action":"UPDATE_PASSWORD","response_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","remember_me":"false","code_id":"21c79ff4-34b1-46a0-a33f-0087db7922a7","response_mode":"query","username":"edward.elric@gmail.com"}	\N	192.168.64.1	test	\N	1578965561105	UPDATE_PASSWORD	01ed29c7-52c5-43a4-9d29-f466b2c59e82
1dccc1e9-3691-4068-b2ee-a322af4cf41c	echo-example	{"auth_method":"openid-connect","custom_required_action":"UPDATE_PASSWORD","response_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","remember_me":"false","consent":"no_consent_required","code_id":"21c79ff4-34b1-46a0-a33f-0087db7922a7","response_mode":"query","username":"edward.elric@gmail.com"}	\N	192.168.64.1	test	21c79ff4-34b1-46a0-a33f-0087db7922a7	1578965561116	LOGIN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
6d2dd6bd-2088-4eef-a2fa-d88bfa64abf6	echo-example	{"token_id":"ba77ae98-17e0-485c-b589-c33c6f8a4f70","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"b6262eaf-515f-4bb0-a850-405d8f5d950a","code_id":"21c79ff4-34b1-46a0-a33f-0087db7922a7","client_auth_method":"client-secret"}	\N	172.17.0.1	test	21c79ff4-34b1-46a0-a33f-0087db7922a7	1578965561158	CODE_TO_TOKEN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
fab0f3a3-9ee4-46d4-b5e4-e56620fe1aa1	echo-example	{"client_auth_method":"client-secret"}	\N	172.17.0.1	test	21c79ff4-34b1-46a0-a33f-0087db7922a7	1578965638263	LOGOUT	01ed29c7-52c5-43a4-9d29-f466b2c59e82
f2c9ac65-f896-43b4-82f3-481b4aad8d25	echo-example	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","consent":"no_consent_required","code_id":"e1050020-3d27-4005-b40f-436b1bb3d223","username":"edward.elric@gmail.com"}	\N	192.168.64.1	test	e1050020-3d27-4005-b40f-436b1bb3d223	1578965669363	LOGIN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
7bd458d0-e692-4179-a074-f347b6799fe0	echo-example	{"token_id":"fece52e8-25a6-4a8d-a989-e359605a0188","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"9e8cdacf-b4e9-4d64-afc5-70435bce6096","code_id":"e1050020-3d27-4005-b40f-436b1bb3d223","client_auth_method":"client-secret"}	\N	172.17.0.1	test	e1050020-3d27-4005-b40f-436b1bb3d223	1578965669508	CODE_TO_TOKEN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
e208fc64-df91-4862-993f-c5acf8688d71	echo-example	{"client_auth_method":"client-secret"}	\N	172.17.0.1	test	e1050020-3d27-4005-b40f-436b1bb3d223	1578965745235	LOGOUT	01ed29c7-52c5-43a4-9d29-f466b2c59e82
d43c9d7c-d775-47ce-9e31-14b73b9d0107	echo-example	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","consent":"no_consent_required","code_id":"7c1ee613-90af-42b8-84dd-c558d9e1d9cf","username":"edward.elric@gmail.com"}	\N	192.168.64.1	test	7c1ee613-90af-42b8-84dd-c558d9e1d9cf	1578965757979	LOGIN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
a3684fef-6316-4732-936f-b080a198890d	echo-example	{"token_id":"1c6c2802-a19d-4ebd-bd88-46d190b7907a","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"eb44f8dc-86c8-4b43-8b3c-d24bd9889481","code_id":"7c1ee613-90af-42b8-84dd-c558d9e1d9cf","client_auth_method":"client-secret"}	\N	172.17.0.1	test	7c1ee613-90af-42b8-84dd-c558d9e1d9cf	1578965758037	CODE_TO_TOKEN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
72b6762a-5540-4b2e-8f88-3806e7089631	echo-example	{"client_auth_method":"client-secret"}	\N	172.17.0.1	test	7c1ee613-90af-42b8-84dd-c558d9e1d9cf	1578965769693	LOGOUT	01ed29c7-52c5-43a4-9d29-f466b2c59e82
7b1ef5d7-5fb6-40e0-adc8-531b45b88f23	echo-example	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","consent":"no_consent_required","code_id":"9c3d6da6-812e-48c4-95a9-06d9f0f618a9","username":"winry.rockbell@gmail.com"}	\N	192.168.64.1	test	9c3d6da6-812e-48c4-95a9-06d9f0f618a9	1578965788373	LOGIN	2e477043-4363-48ef-bb69-568c0c02b005
8834278a-03ab-44e2-b543-951901fcbbf2	echo-example	{"token_id":"17dbbc34-629a-4042-8377-6462ef495912","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"3da47c16-f78c-40fa-9dd3-11662d5d2d9c","code_id":"9c3d6da6-812e-48c4-95a9-06d9f0f618a9","client_auth_method":"client-secret"}	\N	172.17.0.1	test	9c3d6da6-812e-48c4-95a9-06d9f0f618a9	1578965788446	CODE_TO_TOKEN	2e477043-4363-48ef-bb69-568c0c02b005
bc0ec022-6a72-484a-9338-c1939f5b6238	echo-example	{"client_auth_method":"client-secret"}	\N	172.17.0.1	test	9c3d6da6-812e-48c4-95a9-06d9f0f618a9	1578965823616	LOGOUT	2e477043-4363-48ef-bb69-568c0c02b005
1239cef7-136f-403c-8b92-e160f65306f3	echo-example	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","consent":"no_consent_required","code_id":"031efd48-d8ea-442b-9b50-cd64a82a1552","username":"winry.rockbell@gmail.com"}	\N	192.168.64.1	test	031efd48-d8ea-442b-9b50-cd64a82a1552	1578965837674	LOGIN	2e477043-4363-48ef-bb69-568c0c02b005
3f25157f-313e-499f-b84d-f449146d2176	echo-example	{"token_id":"f1e50846-353b-4fe1-97fa-6e2343842a9a","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"ad7efd26-ffc2-4e22-bd76-c1a02885a2db","code_id":"031efd48-d8ea-442b-9b50-cd64a82a1552","client_auth_method":"client-secret"}	\N	172.17.0.1	test	031efd48-d8ea-442b-9b50-cd64a82a1552	1578965837740	CODE_TO_TOKEN	2e477043-4363-48ef-bb69-568c0c02b005
78a45849-d751-4586-9601-2f4db061d509	echo-example	{"auth_method":"openid-connect","auth_type":"code","response_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","consent":"no_consent_required","code_id":"031efd48-d8ea-442b-9b50-cd64a82a1552","response_mode":"query","username":"winry.rockbell@gmail.com"}	\N	192.168.64.1	test	031efd48-d8ea-442b-9b50-cd64a82a1552	1578967081887	LOGIN	2e477043-4363-48ef-bb69-568c0c02b005
ebbf3d7f-0367-493d-a00d-23dcea5ae8e0	echo-example	{"token_id":"8b7f55ca-0bfe-479a-8340-b58173ae5c49","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"2d60a31b-419f-473f-a80e-8929dd41051e","code_id":"031efd48-d8ea-442b-9b50-cd64a82a1552","client_auth_method":"client-secret"}	\N	172.17.0.1	test	031efd48-d8ea-442b-9b50-cd64a82a1552	1578967081998	CODE_TO_TOKEN	2e477043-4363-48ef-bb69-568c0c02b005
4f9ecfcf-9e19-470d-bf6e-d2e5a64a00dd	echo-example	{"client_auth_method":"client-secret"}	\N	172.17.0.1	test	031efd48-d8ea-442b-9b50-cd64a82a1552	1578967190081	LOGOUT	2e477043-4363-48ef-bb69-568c0c02b005
fe2554d5-6c28-406a-98f0-430b5db30437	echo-example	{"client_auth_method":"client-secret"}	\N	172.17.0.1	test	22c6dfba-3ac6-450a-a7c9-0ed160b25259	1578968737344	LOGOUT	2e477043-4363-48ef-bb69-568c0c02b005
b6de188e-bd34-4190-9599-13753334aece	echo-example	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","consent":"no_consent_required","code_id":"c1a10378-5eaf-4f56-9917-61b55702abd6","username":"edward.elric@gmail.com"}	\N	192.168.64.1	test	c1a10378-5eaf-4f56-9917-61b55702abd6	1578967201651	LOGIN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
161f0153-1711-4b0b-aff3-dd2103d63665	echo-example	{"token_id":"4f2b9471-c25a-4a54-ad55-b8f66c19fd0c","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"31875c59-4b08-424c-98f8-b1493841436c","code_id":"c1a10378-5eaf-4f56-9917-61b55702abd6","client_auth_method":"client-secret"}	\N	172.17.0.1	test	c1a10378-5eaf-4f56-9917-61b55702abd6	1578967201944	CODE_TO_TOKEN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
4c0d8494-b098-49d9-a7d0-76f17120d928	echo-example	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","consent":"no_consent_required","code_id":"3fd4bb17-2c12-41dd-bd9f-7cf7bebd784f","username":"winry.rockbell@gmail.com"}	\N	192.168.64.1	test	3fd4bb17-2c12-41dd-bd9f-7cf7bebd784f	1578967979905	LOGIN	2e477043-4363-48ef-bb69-568c0c02b005
66035c6f-a2d6-42d9-bd28-30b32440a326	echo-example	{"token_id":"438012c0-149e-4bef-b29b-ac77152871ac","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"9c31c457-f7fe-45de-9ec4-79041f13d041","code_id":"3fd4bb17-2c12-41dd-bd9f-7cf7bebd784f","client_auth_method":"client-secret"}	\N	172.17.0.1	test	3fd4bb17-2c12-41dd-bd9f-7cf7bebd784f	1578967980262	CODE_TO_TOKEN	2e477043-4363-48ef-bb69-568c0c02b005
53377ae5-8396-49d6-8c75-8d3c3324f4a7	flask-oidc-example	{"auth_method":"openid-connect","response_type":"code","redirect_uri":"http://192.168.64.10/flask-oidc/oidc_callback","remember_me":"false","consent":"consent_granted","code_id":"3fd4bb17-2c12-41dd-bd9f-7cf7bebd784f","response_mode":"query","username":"winry.rockbell@gmail.com"}	\N	192.168.64.1	test	\N	1578968080499	LOGIN	2e477043-4363-48ef-bb69-568c0c02b005
a44906a8-828b-4933-a5f6-786e2256bc54	flask-oidc-example	{"token_id":"78e30727-3e1a-4ecb-bbd7-5d6b02f70b42","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"d263910c-be84-4693-9870-2b648d748c97","code_id":"3fd4bb17-2c12-41dd-bd9f-7cf7bebd784f","client_auth_method":"client-secret"}	\N	172.17.0.1	test	3fd4bb17-2c12-41dd-bd9f-7cf7bebd784f	1578968080614	CODE_TO_TOKEN	2e477043-4363-48ef-bb69-568c0c02b005
85e59d20-5a54-4938-8108-ffbbd4a8b3d4	flask-oidc-example	{"auth_method":"openid-connect","auth_type":"code","response_type":"code","redirect_uri":"http://192.168.64.10/flask-oidc/oidc_callback","consent":"persistent_consent","code_id":"3fd4bb17-2c12-41dd-bd9f-7cf7bebd784f","response_mode":"query","username":"winry.rockbell@gmail.com"}	\N	192.168.64.1	test	3fd4bb17-2c12-41dd-bd9f-7cf7bebd784f	1578968155229	LOGIN	2e477043-4363-48ef-bb69-568c0c02b005
cc61b2da-fdac-4691-98b4-6099b0ee999a	flask-oidc-example	{"token_id":"d81cbc03-b0df-490f-80fd-17e471850754","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"d6e51b7c-cf76-4828-adab-a4356baeb15f","code_id":"3fd4bb17-2c12-41dd-bd9f-7cf7bebd784f","client_auth_method":"client-secret"}	\N	172.17.0.1	test	3fd4bb17-2c12-41dd-bd9f-7cf7bebd784f	1578968155290	CODE_TO_TOKEN	2e477043-4363-48ef-bb69-568c0c02b005
5419ff65-821c-4d89-bb00-fc5d6fe28337	echo-example	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","consent":"no_consent_required","code_id":"f5a68b57-51d7-477f-a046-5bfbe9d79d77","username":"winry.rockbell@gmail.com"}	\N	192.168.64.1	test	f5a68b57-51d7-477f-a046-5bfbe9d79d77	1578968377305	LOGIN	2e477043-4363-48ef-bb69-568c0c02b005
e42c66a8-b142-4ebe-936d-f638cfdad4f1	echo-example	{"token_id":"a2d6bcdc-0580-4ef0-9150-a78689097a97","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"39897932-5ebe-47e7-8d30-1a92e4983ede","code_id":"f5a68b57-51d7-477f-a046-5bfbe9d79d77","client_auth_method":"client-secret"}	\N	172.17.0.1	test	f5a68b57-51d7-477f-a046-5bfbe9d79d77	1578968377488	CODE_TO_TOKEN	2e477043-4363-48ef-bb69-568c0c02b005
343ef81e-2265-4fef-b507-297981f963ca	echo-example	{"client_auth_method":"client-secret"}	\N	172.17.0.1	test	f5a68b57-51d7-477f-a046-5bfbe9d79d77	1578968395606	LOGOUT	2e477043-4363-48ef-bb69-568c0c02b005
1b66b87f-e05d-4681-ae73-16c33e1e3f87	echo-example	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","consent":"no_consent_required","code_id":"8015bfeb-d0a7-4aed-8e6d-6711a2d5e986","username":"edward.elric@gmail.com"}	\N	192.168.64.1	test	8015bfeb-d0a7-4aed-8e6d-6711a2d5e986	1578968416177	LOGIN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
7187d6d4-96c7-471b-8875-bab1cbb9c7c4	echo-example	{"token_id":"50073f50-fe72-4797-bcf5-30f03df00dcd","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"4effa2bc-3b73-4b2d-9651-d1a890b16915","code_id":"8015bfeb-d0a7-4aed-8e6d-6711a2d5e986","client_auth_method":"client-secret"}	\N	172.17.0.1	test	8015bfeb-d0a7-4aed-8e6d-6711a2d5e986	1578968416309	CODE_TO_TOKEN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
9a4bf9c5-6084-4540-95a1-362e2c7449f1	echo-example	{"client_auth_method":"client-secret"}	\N	172.17.0.1	test	8015bfeb-d0a7-4aed-8e6d-6711a2d5e986	1578968434992	LOGOUT	01ed29c7-52c5-43a4-9d29-f466b2c59e82
48c81e4f-9f3f-4f2c-bd3e-a65d50617d2e	flask-oidc-example	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://192.168.64.10/flask-oidc/oidc_callback","consent":"persistent_consent","code_id":"22c6dfba-3ac6-450a-a7c9-0ed160b25259","username":"winry.rockbell@gmail.com"}	\N	192.168.64.1	test	22c6dfba-3ac6-450a-a7c9-0ed160b25259	1578968623790	LOGIN	2e477043-4363-48ef-bb69-568c0c02b005
96567c5a-e458-4909-8970-adfb75a146a7	flask-oidc-example	{"token_id":"47928913-b018-4714-bd66-9b732fa2e8cc","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"7f964b02-fd71-43d2-b2e2-b20e7e3b5b1d","code_id":"22c6dfba-3ac6-450a-a7c9-0ed160b25259","client_auth_method":"client-secret"}	\N	172.17.0.1	test	22c6dfba-3ac6-450a-a7c9-0ed160b25259	1578968623908	CODE_TO_TOKEN	2e477043-4363-48ef-bb69-568c0c02b005
c771f12e-6abf-4b54-a6a7-cb9c30cc662f	echo-example	{"auth_method":"openid-connect","auth_type":"code","response_type":"code","redirect_uri":"http://192.168.64.10/echo/oauth/callback","consent":"no_consent_required","code_id":"22c6dfba-3ac6-450a-a7c9-0ed160b25259","response_mode":"query","username":"winry.rockbell@gmail.com"}	\N	192.168.64.1	test	22c6dfba-3ac6-450a-a7c9-0ed160b25259	1578968671277	LOGIN	2e477043-4363-48ef-bb69-568c0c02b005
39d6a666-91e1-478f-9ef5-90a23ad0ed14	echo-example	{"token_id":"2edd5269-d2eb-4cf4-a55c-920085d0785a","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"9055c6e0-e6d0-4ec3-b60a-5426a8a210f1","code_id":"22c6dfba-3ac6-450a-a7c9-0ed160b25259","client_auth_method":"client-secret"}	\N	172.17.0.1	test	22c6dfba-3ac6-450a-a7c9-0ed160b25259	1578968671326	CODE_TO_TOKEN	2e477043-4363-48ef-bb69-568c0c02b005
9e093838-d1a0-4a89-8344-58e976296091	flask-oidc-example	{"auth_method":"openid-connect","response_type":"code","redirect_uri":"http://192.168.64.10/flask-oidc/oidc_callback","remember_me":"false","consent":"consent_granted","code_id":"7d83980b-4483-4b9f-80fe-1e55c5a0c1a4","response_mode":"query","username":"edward.elric@gmail.com"}	\N	192.168.64.1	test	\N	1578968789984	LOGIN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
8d0fe512-0830-4808-b089-309de09f5bdc	flask-oidc-example	{"token_id":"ee861657-f988-4eb5-b6ec-afa48fdee040","grant_type":"authorization_code","refresh_token_type":"Refresh","scope":"openid email profile","refresh_token_id":"e8622857-3548-476e-a436-98bd8fccd822","code_id":"7d83980b-4483-4b9f-80fe-1e55c5a0c1a4","client_auth_method":"client-secret"}	\N	172.17.0.1	test	7d83980b-4483-4b9f-80fe-1e55c5a0c1a4	1578968790060	CODE_TO_TOKEN	01ed29c7-52c5-43a4-9d29-f466b2c59e82
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
e6769c2e-c8b5-43f4-8b4c-327b8af2d12e	35b232fc-2ea7-458b-875f-bc4aa987bb65
e3ebc595-a7b1-4096-b831-bc8f1d7bc663	35b232fc-2ea7-458b-875f-bc4aa987bb65
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
35b232fc-2ea7-458b-875f-bc4aa987bb65	default	\N	test
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
1b8ab441-1d09-4ee0-9692-754a438e6595	master	f	${role_admin}	admin	master	\N	master
6bb8e154-1a11-4fd7-9578-107ac4d97001	master	f	${role_create-realm}	create-realm	master	\N	master
f6778d4b-b540-436f-82c5-bd05e1c72aa3	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_create-client}	create-client	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
06a966a1-5fa2-441d-8c90-2494814936c6	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_view-realm}	view-realm	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
2dcf9ee3-5739-4937-99b9-0a0638f9cdaf	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_view-users}	view-users	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
0e24ecff-5b5f-413e-9d3c-1652e978283f	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_view-clients}	view-clients	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
b93a53fc-54a1-472b-af0f-5cd9d1d4942a	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_view-events}	view-events	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
dc323f53-1284-45d2-8514-69f00f4c8d5c	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_view-identity-providers}	view-identity-providers	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
cac57a69-7a78-412c-b8d0-2ca3f4b1121a	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_view-authorization}	view-authorization	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
eff9f943-21da-41db-a5fd-71aaaa95edc4	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_manage-realm}	manage-realm	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
d6278edd-3c7f-45a9-85c2-23606a17ff74	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_manage-users}	manage-users	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
6d17321d-a3a2-46b9-ac82-833294f2636b	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_manage-clients}	manage-clients	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
50e0ff0a-97c0-4277-a561-9be9291b09ac	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_manage-events}	manage-events	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
c85cf65e-4531-4aac-9c12-0b9bf5cfe37b	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_manage-identity-providers}	manage-identity-providers	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
87844a1c-76f3-4cb8-b64d-357900350dd5	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_manage-authorization}	manage-authorization	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
cb20a688-731c-4138-8048-56a0259bc30c	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_query-users}	query-users	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
a3bd1046-c29a-4742-bd58-e8ceaa6ff034	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_query-clients}	query-clients	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
a567b266-2c0c-4df9-b856-34be7760d31c	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_query-realms}	query-realms	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
d7fcd2c7-517d-4ea8-9989-674c1d10cacd	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_query-groups}	query-groups	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
ec305514-3d2b-42dc-9dc6-228b4453a97e	e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	t	${role_view-profile}	view-profile	master	e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	\N
a682ef18-1df1-4e67-b538-943ec8da2ca9	e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	t	${role_manage-account}	manage-account	master	e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	\N
df7d476a-42bf-4fde-a665-a1414e0c198f	e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	t	${role_manage-account-links}	manage-account-links	master	e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	\N
b1396229-120f-4d0d-b6f8-96388dc92e26	a1149490-4070-4b5b-92a7-c8e2b3833d45	t	${role_read-token}	read-token	master	a1149490-4070-4b5b-92a7-c8e2b3833d45	\N
594fb5c8-822e-4337-a94e-871e042f803e	fddadf01-eb47-448a-8162-1d070c54bd57	t	${role_impersonation}	impersonation	master	fddadf01-eb47-448a-8162-1d070c54bd57	\N
38450e29-581b-40b1-9d1b-40b5f5292639	master	f	${role_offline-access}	offline_access	master	\N	master
178285ba-f0de-4e87-80c8-863562a4cf4b	master	f	${role_uma_authorization}	uma_authorization	master	\N	master
285187ee-1d2a-4707-9c97-02b9a8b1d842	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_create-client}	create-client	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
a9e186e0-ae42-4832-a516-2e9c5b2da50d	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_view-realm}	view-realm	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
41501763-023e-44f9-8a79-261e0e615312	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_view-users}	view-users	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
780745ae-ad6e-4a6f-8af9-a97597093e30	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_view-clients}	view-clients	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
efdc263b-b222-42ff-95ab-ec9730b3d427	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_view-events}	view-events	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
d2e30464-6b90-4e1f-b930-62a771502c30	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_view-identity-providers}	view-identity-providers	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
8dc99e09-3574-4e15-879c-dc4ddb44662a	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_view-authorization}	view-authorization	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
50f8dcb1-1a45-4d9c-9935-3581b364458c	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_manage-realm}	manage-realm	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
f246f70c-3a95-474e-a234-df06961a7c18	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_manage-users}	manage-users	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
0a3dfa1d-6a2b-4a09-812c-1e2182ad0724	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_manage-clients}	manage-clients	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
0c597ceb-7946-4a14-9822-64d577a0da2d	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_manage-events}	manage-events	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
38cdd5d9-e22e-476f-bc48-8649bd42a460	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_manage-identity-providers}	manage-identity-providers	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
01eee3c4-2e61-4b0a-8713-aab968ee78a1	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_manage-authorization}	manage-authorization	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
d5d3175c-257d-4cc0-812b-9be403aca93f	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_query-users}	query-users	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
eeb59571-41f0-4669-ab55-3a9456c7cf3c	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_query-clients}	query-clients	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
d215dd75-ce81-4328-9b62-976720780a74	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_query-realms}	query-realms	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
998678c5-9ee2-4ff1-a3a0-899a0edd4e91	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_query-groups}	query-groups	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
e539d037-ad59-4543-a0d3-e6f349f82a91	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_realm-admin}	realm-admin	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
35a01167-3b51-4044-9ebe-0560070f60da	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_create-client}	create-client	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
6812369e-a014-447f-a781-35102eec77a9	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_view-realm}	view-realm	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
1b9aaebc-e1f2-44e9-8121-a45ffe434487	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_view-users}	view-users	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
b10527b3-0e6e-4d5a-b3d6-89b67ad8c736	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_view-clients}	view-clients	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
55228928-2a60-4e87-89cd-64d0cfb74f9c	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_view-events}	view-events	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
67db95a5-f5c1-4dac-99fe-416e2e068066	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_view-identity-providers}	view-identity-providers	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
40ccc2b2-67b4-41a4-a0cc-b3ffda021223	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_view-authorization}	view-authorization	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
5557702e-1554-4c36-b69a-7e89fad586b2	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_manage-realm}	manage-realm	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
c81eec9c-b3c1-48c8-a522-5fd36d1ca268	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_manage-users}	manage-users	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
fff0ef6e-103c-4a78-aff3-7d2d2a74d484	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_manage-clients}	manage-clients	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
652fa8f1-8baf-4a0c-aa1e-f4102082d9cd	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_manage-events}	manage-events	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
7a27437e-7495-4e46-93b4-2249810b88a0	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_manage-identity-providers}	manage-identity-providers	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
89458e27-7d0d-485d-bd3a-5c25458bb5df	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_manage-authorization}	manage-authorization	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
4112b12d-2b20-4165-b199-0f0ce97630cb	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_query-users}	query-users	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
190e59d1-0302-489f-bc7b-8a9ff58b9546	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_query-clients}	query-clients	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
a7fe00f2-625c-4b2b-98ee-8f2ffcfc1312	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_query-realms}	query-realms	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
4267212a-3e66-4590-83ec-04485adb394b	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_query-groups}	query-groups	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
1df7206c-7798-47ba-9087-2f004d5f70e1	8034070c-de34-44ed-8d12-43135a7ac5fd	t	${role_view-profile}	view-profile	test	8034070c-de34-44ed-8d12-43135a7ac5fd	\N
5f6c438c-34a1-4690-bbe6-acebd0f5f38b	8034070c-de34-44ed-8d12-43135a7ac5fd	t	${role_manage-account}	manage-account	test	8034070c-de34-44ed-8d12-43135a7ac5fd	\N
2e5da527-8349-4385-91fe-6a000aa5aa1d	8034070c-de34-44ed-8d12-43135a7ac5fd	t	${role_manage-account-links}	manage-account-links	test	8034070c-de34-44ed-8d12-43135a7ac5fd	\N
92c9bc7c-5f6b-4e06-a275-dde8237e5e00	f6aebd7e-8c73-4b26-a315-cb50139df39e	t	${role_impersonation}	impersonation	master	f6aebd7e-8c73-4b26-a315-cb50139df39e	\N
fb0f6105-6496-4b42-be8f-f480aedccd26	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	t	${role_impersonation}	impersonation	test	d2b3f0ff-16e4-4483-a4cd-bfd328dfee66	\N
523dbb88-ffff-4cf8-b676-0c2c8fc3b510	9585c931-950f-4432-a86f-d9434e6bd696	t	${role_read-token}	read-token	test	9585c931-950f-4432-a86f-d9434e6bd696	\N
0718e5ce-17c2-441e-95e8-3dd6ab741a45	test	f	${role_offline-access}	offline_access	test	\N	test
4149235c-9fc0-4948-96a1-e9d3dc7fcb3a	test	f	${role_uma_authorization}	uma_authorization	test	\N	test
0c9f8992-ad33-4829-ab67-05fa9eed5ec0	f49b838f-f76a-494f-b435-ca4d272b55f2	t	\N	view-profile	test	f49b838f-f76a-494f-b435-ca4d272b55f2	\N
a11e9f11-7ec9-4292-b253-ffd375b7fe45	f49b838f-f76a-494f-b435-ca4d272b55f2	t	\N	manage-account	test	f49b838f-f76a-494f-b435-ca4d272b55f2	\N
910b4ae0-0600-4801-86f0-d29cf39306ac	447f0d0b-3aa9-4446-8ef4-543579bf3623	t	\N	uma_protection	test	447f0d0b-3aa9-4446-8ef4-543579bf3623	\N
92f43ce7-eb00-41c7-b4df-1511272184b7	447f0d0b-3aa9-4446-8ef4-543579bf3623	t	\N	asdasd	test	447f0d0b-3aa9-4446-8ef4-543579bf3623	\N
17426a0a-3452-4ea7-be7a-9fc482141867	f49b838f-f76a-494f-b435-ca4d272b55f2	t	\N	uma_protection	test	f49b838f-f76a-494f-b435-ca4d272b55f2	\N
268718c4-8a59-42fb-875d-d9989bf435a1	17d6b9dd-1409-4475-bbf5-ca457212aadc	t	\N	uma_protection	test	17d6b9dd-1409-4475-bbf5-ca457212aadc	\N
e3ebc595-a7b1-4096-b831-bc8f1d7bc663	test	f	\N	x-user	test	\N	test
e6769c2e-c8b5-43f4-8b4c-327b8af2d12e	test	f	\N	x-admin	test	\N	test
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.migration_model (id, version, update_time) FROM stdin;
l74f6	8.0.1	1577240318
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
a3eca3ee-b481-4a7d-9332-353f2a7e5697	code	// by default, grants any permission associated with this policy\n$evaluation.grant();\n
f8f1d753-7010-4131-89a7-2df2f7a2de37	defaultResourceType	urn:hello-world-app:resources:default
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
64ec5c08-f87f-4b8f-ba2e-7f33ac3c6453	locale	openid-connect	oidc-usermodel-attribute-mapper	71f7395f-46fe-4aaa-a256-82e1a34fd69e	\N
c53e8b84-af49-43f6-aba3-189be2f09271	role list	saml	saml-role-list-mapper	\N	ebb1e0ea-89bc-4148-bc5b-adee0c53e4cc
7687b21a-74ea-4eac-b95e-26d595b7fd0a	full name	openid-connect	oidc-full-name-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
846859fd-0b45-440f-abb7-2205948f9f0f	family name	openid-connect	oidc-usermodel-property-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
238e68bb-9143-40a8-a812-ba298226bebe	given name	openid-connect	oidc-usermodel-property-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
01f00f1d-6273-45d7-bf24-2023a103c51b	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
f09ac4e0-af2b-4e84-9c50-5d154461d40f	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
d289a105-a96c-4178-a827-7e1e7b58fdfc	username	openid-connect	oidc-usermodel-property-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
3103a594-1468-4f4d-8ce7-c5a11c47619c	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
98cc328b-3524-46fd-8a46-5fce40fc3f61	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
c666395f-a5b1-444f-96f3-d0d5e0ce7e38	website	openid-connect	oidc-usermodel-attribute-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
098faecb-1d75-469f-b246-a0cf25aaed75	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
18fa97b2-dcc9-4012-b708-dd3d4d1b4fcc	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
1a9af1d6-92a7-40a7-8d3c-9969de85a7a0	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
8d6f61ac-8ef7-4fca-ad7e-cdf9802f0009	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
72f4f9f2-e701-40ff-a4ba-bf9eca339259	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	fa47aa38-b9cf-4a73-839f-e894454d87e4
a8987cf1-2c63-4e35-abec-8f34f1c86896	email	openid-connect	oidc-usermodel-property-mapper	\N	267c549c-13a9-4f2d-845c-75d05e051171
3515edb0-a483-426f-b14d-77e927589181	email verified	openid-connect	oidc-usermodel-property-mapper	\N	267c549c-13a9-4f2d-845c-75d05e051171
8c668163-79ec-46a9-b2a6-173f07fdfb5b	address	openid-connect	oidc-address-mapper	\N	196f3647-0d41-4664-8aa1-4c7a385c9c88
b5fd4859-c474-4208-80d5-c6ec833819dc	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	5e5f45bb-74ae-46f6-9f8a-020f0883232b
2d704e94-65c7-488f-900c-74136f4196d3	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	5e5f45bb-74ae-46f6-9f8a-020f0883232b
ca6f1a2a-cf36-407c-a484-a7f044509d29	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	6b2cf748-da35-408b-b16b-90eebd69ef2c
f3222155-7637-4b24-bdda-4ea888dedbfb	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	6b2cf748-da35-408b-b16b-90eebd69ef2c
e9de0c33-7476-4f85-a196-de73733bdf12	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	6b2cf748-da35-408b-b16b-90eebd69ef2c
6a84a471-d4f6-44f6-aef6-6ddca49ee838	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	3afb9eee-0e8d-4395-9d8e-7b64f9294212
54ca0167-cce2-4694-8027-fae5758278c3	upn	openid-connect	oidc-usermodel-property-mapper	\N	241da5c9-7145-4fd0-bea3-5dd56572ddb3
149e5d60-24ee-4227-b324-27dd04603404	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	241da5c9-7145-4fd0-bea3-5dd56572ddb3
e688b15c-787e-49ee-9a89-62b07cd14a1e	role list	saml	saml-role-list-mapper	\N	234c5f44-9458-468e-b580-7d2fef1581f4
2f42e166-04b9-474d-9e1a-a9f73b42b582	full name	openid-connect	oidc-full-name-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
717e954e-8479-4b1b-8917-bf4154747fa3	family name	openid-connect	oidc-usermodel-property-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
d4fbfe3e-557a-48ee-9fb3-9fb9a6e7ec10	given name	openid-connect	oidc-usermodel-property-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
c5f8aa4b-0e39-4467-9556-a845677b2003	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
3cd200fd-4461-4483-a0ca-dc91e46d408c	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
dd982476-330e-433e-8523-865458179170	username	openid-connect	oidc-usermodel-property-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
80373e8b-6344-40c2-b320-7bd88d43e74e	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
52a8f6a5-823d-48b8-a333-b3b904bbf971	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
6a4255d3-14d2-46ab-bcb9-1bc6136af3b3	website	openid-connect	oidc-usermodel-attribute-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
14631a99-7bc9-4e3d-9159-f8918aed0d25	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
170d29fe-0996-413f-ae29-1a268a4f63ae	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
db452c2f-565c-4a31-92a9-c493deaf9008	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
5f64f0e3-07b9-40b9-8f31-b6ea69c1a57e	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
5b25c528-608f-417b-8392-f6038b74658c	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	b76be569-7820-4b0d-b8b5-dcef52a34f13
0415be9e-4a47-4a70-bf64-c89e29d55026	email	openid-connect	oidc-usermodel-property-mapper	\N	b6c48a5b-f445-418c-b0cb-3694b520f873
9234cdc4-bca6-4c6a-a12f-db7a60becda5	email verified	openid-connect	oidc-usermodel-property-mapper	\N	b6c48a5b-f445-418c-b0cb-3694b520f873
d81e26e7-cfa9-4c54-8c08-4ac4aa55cca8	address	openid-connect	oidc-address-mapper	\N	bc9ba4ac-4607-405c-9ee6-8e5080802f94
c9456cef-9cad-4242-a978-dd51bc40a84f	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	2d8f14f6-8fc2-42bc-9b7d-25db32488e13
12ce3a83-f93f-44cf-9103-68cbfbda12df	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	2d8f14f6-8fc2-42bc-9b7d-25db32488e13
dd63beac-d066-4820-b860-9de7b6504503	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d
0e0a29f1-dda4-4233-9861-2b99f57be30c	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d
0f23e1d6-ade2-4d23-af91-a09800e266a7	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d
414c1bb8-758a-4dc0-8308-13f6cc9b6524	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	7b0b98ae-6ec8-4482-a6e6-4d6080d0dfed
eb858d9e-8043-49e5-8b0a-b8a6179affb4	upn	openid-connect	oidc-usermodel-property-mapper	\N	fecfa920-1e7a-4b90-a979-e14ff74bd213
871688bf-f345-42b7-936b-315969ed2519	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	fecfa920-1e7a-4b90-a979-e14ff74bd213
3d7142a0-4b44-4c7b-b5b4-c69602e94b92	locale	openid-connect	oidc-usermodel-attribute-mapper	d74f2587-42a1-431c-b509-d7f4acd67b6b	\N
d4d05d01-1264-4b63-b176-94f5d4be4add	Audience	openid-connect	oidc-audience-mapper	f49b838f-f76a-494f-b435-ca4d272b55f2	\N
74ff7d45-db8f-452f-83de-422135acbdb4	Audience	openid-connect	oidc-audience-mapper	447f0d0b-3aa9-4446-8ef4-543579bf3623	\N
ec04818d-3771-4cc4-ab2e-704a331aee57	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	447f0d0b-3aa9-4446-8ef4-543579bf3623	\N
ecaf5672-5352-4247-812e-e16ff1ed97d5	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	447f0d0b-3aa9-4446-8ef4-543579bf3623	\N
4c6a4c85-0aeb-49af-9140-c42385737eb4	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	447f0d0b-3aa9-4446-8ef4-543579bf3623	\N
c6ebee1f-6f68-4b28-86ee-75488314f90f	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	f49b838f-f76a-494f-b435-ca4d272b55f2	\N
bea8dbc0-ef37-4f6e-afa8-acaf489dcc94	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	f49b838f-f76a-494f-b435-ca4d272b55f2	\N
a5f4a327-9bbe-4b59-a1c2-b83528e62113	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	f49b838f-f76a-494f-b435-ca4d272b55f2	\N
384fceea-87a1-4791-8b69-d92f88e5efa8	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	17d6b9dd-1409-4475-bbf5-ca457212aadc	\N
9e874679-d664-4a23-b074-32393b72c871	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	17d6b9dd-1409-4475-bbf5-ca457212aadc	\N
9265349d-d430-4ef8-8479-3df0dc3e547d	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	17d6b9dd-1409-4475-bbf5-ca457212aadc	\N
258b2a8d-69f5-46c8-b9d9-59ec5b6a464b	Audience	openid-connect	oidc-audience-mapper	17d6b9dd-1409-4475-bbf5-ca457212aadc	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
64ec5c08-f87f-4b8f-ba2e-7f33ac3c6453	true	userinfo.token.claim
64ec5c08-f87f-4b8f-ba2e-7f33ac3c6453	locale	user.attribute
64ec5c08-f87f-4b8f-ba2e-7f33ac3c6453	true	id.token.claim
64ec5c08-f87f-4b8f-ba2e-7f33ac3c6453	true	access.token.claim
64ec5c08-f87f-4b8f-ba2e-7f33ac3c6453	locale	claim.name
64ec5c08-f87f-4b8f-ba2e-7f33ac3c6453	String	jsonType.label
c53e8b84-af49-43f6-aba3-189be2f09271	false	single
c53e8b84-af49-43f6-aba3-189be2f09271	Basic	attribute.nameformat
c53e8b84-af49-43f6-aba3-189be2f09271	Role	attribute.name
7687b21a-74ea-4eac-b95e-26d595b7fd0a	true	userinfo.token.claim
7687b21a-74ea-4eac-b95e-26d595b7fd0a	true	id.token.claim
7687b21a-74ea-4eac-b95e-26d595b7fd0a	true	access.token.claim
846859fd-0b45-440f-abb7-2205948f9f0f	true	userinfo.token.claim
846859fd-0b45-440f-abb7-2205948f9f0f	lastName	user.attribute
846859fd-0b45-440f-abb7-2205948f9f0f	true	id.token.claim
846859fd-0b45-440f-abb7-2205948f9f0f	true	access.token.claim
846859fd-0b45-440f-abb7-2205948f9f0f	family_name	claim.name
846859fd-0b45-440f-abb7-2205948f9f0f	String	jsonType.label
238e68bb-9143-40a8-a812-ba298226bebe	true	userinfo.token.claim
238e68bb-9143-40a8-a812-ba298226bebe	firstName	user.attribute
238e68bb-9143-40a8-a812-ba298226bebe	true	id.token.claim
238e68bb-9143-40a8-a812-ba298226bebe	true	access.token.claim
238e68bb-9143-40a8-a812-ba298226bebe	given_name	claim.name
238e68bb-9143-40a8-a812-ba298226bebe	String	jsonType.label
01f00f1d-6273-45d7-bf24-2023a103c51b	true	userinfo.token.claim
01f00f1d-6273-45d7-bf24-2023a103c51b	middleName	user.attribute
01f00f1d-6273-45d7-bf24-2023a103c51b	true	id.token.claim
01f00f1d-6273-45d7-bf24-2023a103c51b	true	access.token.claim
01f00f1d-6273-45d7-bf24-2023a103c51b	middle_name	claim.name
01f00f1d-6273-45d7-bf24-2023a103c51b	String	jsonType.label
f09ac4e0-af2b-4e84-9c50-5d154461d40f	true	userinfo.token.claim
f09ac4e0-af2b-4e84-9c50-5d154461d40f	nickname	user.attribute
f09ac4e0-af2b-4e84-9c50-5d154461d40f	true	id.token.claim
f09ac4e0-af2b-4e84-9c50-5d154461d40f	true	access.token.claim
f09ac4e0-af2b-4e84-9c50-5d154461d40f	nickname	claim.name
f09ac4e0-af2b-4e84-9c50-5d154461d40f	String	jsonType.label
d289a105-a96c-4178-a827-7e1e7b58fdfc	true	userinfo.token.claim
d289a105-a96c-4178-a827-7e1e7b58fdfc	username	user.attribute
d289a105-a96c-4178-a827-7e1e7b58fdfc	true	id.token.claim
d289a105-a96c-4178-a827-7e1e7b58fdfc	true	access.token.claim
d289a105-a96c-4178-a827-7e1e7b58fdfc	preferred_username	claim.name
d289a105-a96c-4178-a827-7e1e7b58fdfc	String	jsonType.label
3103a594-1468-4f4d-8ce7-c5a11c47619c	true	userinfo.token.claim
3103a594-1468-4f4d-8ce7-c5a11c47619c	profile	user.attribute
3103a594-1468-4f4d-8ce7-c5a11c47619c	true	id.token.claim
3103a594-1468-4f4d-8ce7-c5a11c47619c	true	access.token.claim
3103a594-1468-4f4d-8ce7-c5a11c47619c	profile	claim.name
3103a594-1468-4f4d-8ce7-c5a11c47619c	String	jsonType.label
98cc328b-3524-46fd-8a46-5fce40fc3f61	true	userinfo.token.claim
98cc328b-3524-46fd-8a46-5fce40fc3f61	picture	user.attribute
98cc328b-3524-46fd-8a46-5fce40fc3f61	true	id.token.claim
98cc328b-3524-46fd-8a46-5fce40fc3f61	true	access.token.claim
98cc328b-3524-46fd-8a46-5fce40fc3f61	picture	claim.name
98cc328b-3524-46fd-8a46-5fce40fc3f61	String	jsonType.label
c666395f-a5b1-444f-96f3-d0d5e0ce7e38	true	userinfo.token.claim
c666395f-a5b1-444f-96f3-d0d5e0ce7e38	website	user.attribute
c666395f-a5b1-444f-96f3-d0d5e0ce7e38	true	id.token.claim
c666395f-a5b1-444f-96f3-d0d5e0ce7e38	true	access.token.claim
c666395f-a5b1-444f-96f3-d0d5e0ce7e38	website	claim.name
c666395f-a5b1-444f-96f3-d0d5e0ce7e38	String	jsonType.label
098faecb-1d75-469f-b246-a0cf25aaed75	true	userinfo.token.claim
098faecb-1d75-469f-b246-a0cf25aaed75	gender	user.attribute
098faecb-1d75-469f-b246-a0cf25aaed75	true	id.token.claim
098faecb-1d75-469f-b246-a0cf25aaed75	true	access.token.claim
098faecb-1d75-469f-b246-a0cf25aaed75	gender	claim.name
098faecb-1d75-469f-b246-a0cf25aaed75	String	jsonType.label
18fa97b2-dcc9-4012-b708-dd3d4d1b4fcc	true	userinfo.token.claim
18fa97b2-dcc9-4012-b708-dd3d4d1b4fcc	birthdate	user.attribute
18fa97b2-dcc9-4012-b708-dd3d4d1b4fcc	true	id.token.claim
18fa97b2-dcc9-4012-b708-dd3d4d1b4fcc	true	access.token.claim
18fa97b2-dcc9-4012-b708-dd3d4d1b4fcc	birthdate	claim.name
18fa97b2-dcc9-4012-b708-dd3d4d1b4fcc	String	jsonType.label
1a9af1d6-92a7-40a7-8d3c-9969de85a7a0	true	userinfo.token.claim
1a9af1d6-92a7-40a7-8d3c-9969de85a7a0	zoneinfo	user.attribute
1a9af1d6-92a7-40a7-8d3c-9969de85a7a0	true	id.token.claim
1a9af1d6-92a7-40a7-8d3c-9969de85a7a0	true	access.token.claim
1a9af1d6-92a7-40a7-8d3c-9969de85a7a0	zoneinfo	claim.name
1a9af1d6-92a7-40a7-8d3c-9969de85a7a0	String	jsonType.label
8d6f61ac-8ef7-4fca-ad7e-cdf9802f0009	true	userinfo.token.claim
8d6f61ac-8ef7-4fca-ad7e-cdf9802f0009	locale	user.attribute
8d6f61ac-8ef7-4fca-ad7e-cdf9802f0009	true	id.token.claim
8d6f61ac-8ef7-4fca-ad7e-cdf9802f0009	true	access.token.claim
8d6f61ac-8ef7-4fca-ad7e-cdf9802f0009	locale	claim.name
8d6f61ac-8ef7-4fca-ad7e-cdf9802f0009	String	jsonType.label
72f4f9f2-e701-40ff-a4ba-bf9eca339259	true	userinfo.token.claim
72f4f9f2-e701-40ff-a4ba-bf9eca339259	updatedAt	user.attribute
72f4f9f2-e701-40ff-a4ba-bf9eca339259	true	id.token.claim
72f4f9f2-e701-40ff-a4ba-bf9eca339259	true	access.token.claim
72f4f9f2-e701-40ff-a4ba-bf9eca339259	updated_at	claim.name
72f4f9f2-e701-40ff-a4ba-bf9eca339259	String	jsonType.label
a8987cf1-2c63-4e35-abec-8f34f1c86896	true	userinfo.token.claim
a8987cf1-2c63-4e35-abec-8f34f1c86896	email	user.attribute
a8987cf1-2c63-4e35-abec-8f34f1c86896	true	id.token.claim
a8987cf1-2c63-4e35-abec-8f34f1c86896	true	access.token.claim
a8987cf1-2c63-4e35-abec-8f34f1c86896	email	claim.name
a8987cf1-2c63-4e35-abec-8f34f1c86896	String	jsonType.label
3515edb0-a483-426f-b14d-77e927589181	true	userinfo.token.claim
3515edb0-a483-426f-b14d-77e927589181	emailVerified	user.attribute
3515edb0-a483-426f-b14d-77e927589181	true	id.token.claim
3515edb0-a483-426f-b14d-77e927589181	true	access.token.claim
3515edb0-a483-426f-b14d-77e927589181	email_verified	claim.name
3515edb0-a483-426f-b14d-77e927589181	boolean	jsonType.label
8c668163-79ec-46a9-b2a6-173f07fdfb5b	formatted	user.attribute.formatted
8c668163-79ec-46a9-b2a6-173f07fdfb5b	country	user.attribute.country
8c668163-79ec-46a9-b2a6-173f07fdfb5b	postal_code	user.attribute.postal_code
8c668163-79ec-46a9-b2a6-173f07fdfb5b	true	userinfo.token.claim
8c668163-79ec-46a9-b2a6-173f07fdfb5b	street	user.attribute.street
8c668163-79ec-46a9-b2a6-173f07fdfb5b	true	id.token.claim
8c668163-79ec-46a9-b2a6-173f07fdfb5b	region	user.attribute.region
8c668163-79ec-46a9-b2a6-173f07fdfb5b	true	access.token.claim
8c668163-79ec-46a9-b2a6-173f07fdfb5b	locality	user.attribute.locality
b5fd4859-c474-4208-80d5-c6ec833819dc	true	userinfo.token.claim
b5fd4859-c474-4208-80d5-c6ec833819dc	phoneNumber	user.attribute
b5fd4859-c474-4208-80d5-c6ec833819dc	true	id.token.claim
b5fd4859-c474-4208-80d5-c6ec833819dc	true	access.token.claim
b5fd4859-c474-4208-80d5-c6ec833819dc	phone_number	claim.name
b5fd4859-c474-4208-80d5-c6ec833819dc	String	jsonType.label
2d704e94-65c7-488f-900c-74136f4196d3	true	userinfo.token.claim
2d704e94-65c7-488f-900c-74136f4196d3	phoneNumberVerified	user.attribute
2d704e94-65c7-488f-900c-74136f4196d3	true	id.token.claim
2d704e94-65c7-488f-900c-74136f4196d3	true	access.token.claim
2d704e94-65c7-488f-900c-74136f4196d3	phone_number_verified	claim.name
2d704e94-65c7-488f-900c-74136f4196d3	boolean	jsonType.label
ca6f1a2a-cf36-407c-a484-a7f044509d29	true	multivalued
ca6f1a2a-cf36-407c-a484-a7f044509d29	foo	user.attribute
ca6f1a2a-cf36-407c-a484-a7f044509d29	true	access.token.claim
ca6f1a2a-cf36-407c-a484-a7f044509d29	realm_access.roles	claim.name
ca6f1a2a-cf36-407c-a484-a7f044509d29	String	jsonType.label
f3222155-7637-4b24-bdda-4ea888dedbfb	true	multivalued
f3222155-7637-4b24-bdda-4ea888dedbfb	foo	user.attribute
f3222155-7637-4b24-bdda-4ea888dedbfb	true	access.token.claim
f3222155-7637-4b24-bdda-4ea888dedbfb	resource_access.${client_id}.roles	claim.name
f3222155-7637-4b24-bdda-4ea888dedbfb	String	jsonType.label
54ca0167-cce2-4694-8027-fae5758278c3	true	userinfo.token.claim
54ca0167-cce2-4694-8027-fae5758278c3	username	user.attribute
54ca0167-cce2-4694-8027-fae5758278c3	true	id.token.claim
54ca0167-cce2-4694-8027-fae5758278c3	true	access.token.claim
54ca0167-cce2-4694-8027-fae5758278c3	upn	claim.name
54ca0167-cce2-4694-8027-fae5758278c3	String	jsonType.label
149e5d60-24ee-4227-b324-27dd04603404	true	multivalued
149e5d60-24ee-4227-b324-27dd04603404	foo	user.attribute
149e5d60-24ee-4227-b324-27dd04603404	true	id.token.claim
149e5d60-24ee-4227-b324-27dd04603404	true	access.token.claim
149e5d60-24ee-4227-b324-27dd04603404	groups	claim.name
149e5d60-24ee-4227-b324-27dd04603404	String	jsonType.label
d4d05d01-1264-4b63-b176-94f5d4be4add	hello-world-app	included.client.audience
d4d05d01-1264-4b63-b176-94f5d4be4add	false	id.token.claim
d4d05d01-1264-4b63-b176-94f5d4be4add	true	access.token.claim
e688b15c-787e-49ee-9a89-62b07cd14a1e	false	single
e688b15c-787e-49ee-9a89-62b07cd14a1e	Basic	attribute.nameformat
e688b15c-787e-49ee-9a89-62b07cd14a1e	Role	attribute.name
2f42e166-04b9-474d-9e1a-a9f73b42b582	true	userinfo.token.claim
2f42e166-04b9-474d-9e1a-a9f73b42b582	true	id.token.claim
2f42e166-04b9-474d-9e1a-a9f73b42b582	true	access.token.claim
717e954e-8479-4b1b-8917-bf4154747fa3	true	userinfo.token.claim
717e954e-8479-4b1b-8917-bf4154747fa3	lastName	user.attribute
717e954e-8479-4b1b-8917-bf4154747fa3	true	id.token.claim
717e954e-8479-4b1b-8917-bf4154747fa3	true	access.token.claim
717e954e-8479-4b1b-8917-bf4154747fa3	family_name	claim.name
717e954e-8479-4b1b-8917-bf4154747fa3	String	jsonType.label
d4fbfe3e-557a-48ee-9fb3-9fb9a6e7ec10	true	userinfo.token.claim
d4fbfe3e-557a-48ee-9fb3-9fb9a6e7ec10	firstName	user.attribute
d4fbfe3e-557a-48ee-9fb3-9fb9a6e7ec10	true	id.token.claim
d4fbfe3e-557a-48ee-9fb3-9fb9a6e7ec10	true	access.token.claim
d4fbfe3e-557a-48ee-9fb3-9fb9a6e7ec10	given_name	claim.name
d4fbfe3e-557a-48ee-9fb3-9fb9a6e7ec10	String	jsonType.label
c5f8aa4b-0e39-4467-9556-a845677b2003	true	userinfo.token.claim
c5f8aa4b-0e39-4467-9556-a845677b2003	middleName	user.attribute
c5f8aa4b-0e39-4467-9556-a845677b2003	true	id.token.claim
c5f8aa4b-0e39-4467-9556-a845677b2003	true	access.token.claim
c5f8aa4b-0e39-4467-9556-a845677b2003	middle_name	claim.name
c5f8aa4b-0e39-4467-9556-a845677b2003	String	jsonType.label
3cd200fd-4461-4483-a0ca-dc91e46d408c	true	userinfo.token.claim
3cd200fd-4461-4483-a0ca-dc91e46d408c	nickname	user.attribute
3cd200fd-4461-4483-a0ca-dc91e46d408c	true	id.token.claim
3cd200fd-4461-4483-a0ca-dc91e46d408c	true	access.token.claim
3cd200fd-4461-4483-a0ca-dc91e46d408c	nickname	claim.name
3cd200fd-4461-4483-a0ca-dc91e46d408c	String	jsonType.label
dd982476-330e-433e-8523-865458179170	true	userinfo.token.claim
dd982476-330e-433e-8523-865458179170	username	user.attribute
dd982476-330e-433e-8523-865458179170	true	id.token.claim
dd982476-330e-433e-8523-865458179170	true	access.token.claim
dd982476-330e-433e-8523-865458179170	preferred_username	claim.name
dd982476-330e-433e-8523-865458179170	String	jsonType.label
80373e8b-6344-40c2-b320-7bd88d43e74e	true	userinfo.token.claim
80373e8b-6344-40c2-b320-7bd88d43e74e	profile	user.attribute
80373e8b-6344-40c2-b320-7bd88d43e74e	true	id.token.claim
80373e8b-6344-40c2-b320-7bd88d43e74e	true	access.token.claim
80373e8b-6344-40c2-b320-7bd88d43e74e	profile	claim.name
80373e8b-6344-40c2-b320-7bd88d43e74e	String	jsonType.label
52a8f6a5-823d-48b8-a333-b3b904bbf971	true	userinfo.token.claim
52a8f6a5-823d-48b8-a333-b3b904bbf971	picture	user.attribute
52a8f6a5-823d-48b8-a333-b3b904bbf971	true	id.token.claim
52a8f6a5-823d-48b8-a333-b3b904bbf971	true	access.token.claim
52a8f6a5-823d-48b8-a333-b3b904bbf971	picture	claim.name
52a8f6a5-823d-48b8-a333-b3b904bbf971	String	jsonType.label
6a4255d3-14d2-46ab-bcb9-1bc6136af3b3	true	userinfo.token.claim
6a4255d3-14d2-46ab-bcb9-1bc6136af3b3	website	user.attribute
6a4255d3-14d2-46ab-bcb9-1bc6136af3b3	true	id.token.claim
6a4255d3-14d2-46ab-bcb9-1bc6136af3b3	true	access.token.claim
6a4255d3-14d2-46ab-bcb9-1bc6136af3b3	website	claim.name
6a4255d3-14d2-46ab-bcb9-1bc6136af3b3	String	jsonType.label
14631a99-7bc9-4e3d-9159-f8918aed0d25	true	userinfo.token.claim
14631a99-7bc9-4e3d-9159-f8918aed0d25	gender	user.attribute
14631a99-7bc9-4e3d-9159-f8918aed0d25	true	id.token.claim
14631a99-7bc9-4e3d-9159-f8918aed0d25	true	access.token.claim
14631a99-7bc9-4e3d-9159-f8918aed0d25	gender	claim.name
14631a99-7bc9-4e3d-9159-f8918aed0d25	String	jsonType.label
170d29fe-0996-413f-ae29-1a268a4f63ae	true	userinfo.token.claim
170d29fe-0996-413f-ae29-1a268a4f63ae	birthdate	user.attribute
170d29fe-0996-413f-ae29-1a268a4f63ae	true	id.token.claim
170d29fe-0996-413f-ae29-1a268a4f63ae	true	access.token.claim
170d29fe-0996-413f-ae29-1a268a4f63ae	birthdate	claim.name
170d29fe-0996-413f-ae29-1a268a4f63ae	String	jsonType.label
db452c2f-565c-4a31-92a9-c493deaf9008	true	userinfo.token.claim
db452c2f-565c-4a31-92a9-c493deaf9008	zoneinfo	user.attribute
db452c2f-565c-4a31-92a9-c493deaf9008	true	id.token.claim
db452c2f-565c-4a31-92a9-c493deaf9008	true	access.token.claim
db452c2f-565c-4a31-92a9-c493deaf9008	zoneinfo	claim.name
db452c2f-565c-4a31-92a9-c493deaf9008	String	jsonType.label
5f64f0e3-07b9-40b9-8f31-b6ea69c1a57e	true	userinfo.token.claim
5f64f0e3-07b9-40b9-8f31-b6ea69c1a57e	locale	user.attribute
5f64f0e3-07b9-40b9-8f31-b6ea69c1a57e	true	id.token.claim
5f64f0e3-07b9-40b9-8f31-b6ea69c1a57e	true	access.token.claim
5f64f0e3-07b9-40b9-8f31-b6ea69c1a57e	locale	claim.name
5f64f0e3-07b9-40b9-8f31-b6ea69c1a57e	String	jsonType.label
5b25c528-608f-417b-8392-f6038b74658c	true	userinfo.token.claim
5b25c528-608f-417b-8392-f6038b74658c	updatedAt	user.attribute
5b25c528-608f-417b-8392-f6038b74658c	true	id.token.claim
5b25c528-608f-417b-8392-f6038b74658c	true	access.token.claim
5b25c528-608f-417b-8392-f6038b74658c	updated_at	claim.name
5b25c528-608f-417b-8392-f6038b74658c	String	jsonType.label
0415be9e-4a47-4a70-bf64-c89e29d55026	true	userinfo.token.claim
0415be9e-4a47-4a70-bf64-c89e29d55026	email	user.attribute
0415be9e-4a47-4a70-bf64-c89e29d55026	true	id.token.claim
0415be9e-4a47-4a70-bf64-c89e29d55026	true	access.token.claim
0415be9e-4a47-4a70-bf64-c89e29d55026	email	claim.name
0415be9e-4a47-4a70-bf64-c89e29d55026	String	jsonType.label
9234cdc4-bca6-4c6a-a12f-db7a60becda5	true	userinfo.token.claim
9234cdc4-bca6-4c6a-a12f-db7a60becda5	emailVerified	user.attribute
9234cdc4-bca6-4c6a-a12f-db7a60becda5	true	id.token.claim
9234cdc4-bca6-4c6a-a12f-db7a60becda5	true	access.token.claim
9234cdc4-bca6-4c6a-a12f-db7a60becda5	email_verified	claim.name
9234cdc4-bca6-4c6a-a12f-db7a60becda5	boolean	jsonType.label
d81e26e7-cfa9-4c54-8c08-4ac4aa55cca8	formatted	user.attribute.formatted
d81e26e7-cfa9-4c54-8c08-4ac4aa55cca8	country	user.attribute.country
d81e26e7-cfa9-4c54-8c08-4ac4aa55cca8	postal_code	user.attribute.postal_code
d81e26e7-cfa9-4c54-8c08-4ac4aa55cca8	true	userinfo.token.claim
d81e26e7-cfa9-4c54-8c08-4ac4aa55cca8	street	user.attribute.street
d81e26e7-cfa9-4c54-8c08-4ac4aa55cca8	true	id.token.claim
d81e26e7-cfa9-4c54-8c08-4ac4aa55cca8	region	user.attribute.region
d81e26e7-cfa9-4c54-8c08-4ac4aa55cca8	true	access.token.claim
d81e26e7-cfa9-4c54-8c08-4ac4aa55cca8	locality	user.attribute.locality
c9456cef-9cad-4242-a978-dd51bc40a84f	true	userinfo.token.claim
c9456cef-9cad-4242-a978-dd51bc40a84f	phoneNumber	user.attribute
c9456cef-9cad-4242-a978-dd51bc40a84f	true	id.token.claim
c9456cef-9cad-4242-a978-dd51bc40a84f	true	access.token.claim
c9456cef-9cad-4242-a978-dd51bc40a84f	phone_number	claim.name
c9456cef-9cad-4242-a978-dd51bc40a84f	String	jsonType.label
12ce3a83-f93f-44cf-9103-68cbfbda12df	true	userinfo.token.claim
12ce3a83-f93f-44cf-9103-68cbfbda12df	phoneNumberVerified	user.attribute
12ce3a83-f93f-44cf-9103-68cbfbda12df	true	id.token.claim
12ce3a83-f93f-44cf-9103-68cbfbda12df	true	access.token.claim
12ce3a83-f93f-44cf-9103-68cbfbda12df	phone_number_verified	claim.name
12ce3a83-f93f-44cf-9103-68cbfbda12df	boolean	jsonType.label
dd63beac-d066-4820-b860-9de7b6504503	true	multivalued
dd63beac-d066-4820-b860-9de7b6504503	foo	user.attribute
dd63beac-d066-4820-b860-9de7b6504503	true	access.token.claim
dd63beac-d066-4820-b860-9de7b6504503	realm_access.roles	claim.name
dd63beac-d066-4820-b860-9de7b6504503	String	jsonType.label
0e0a29f1-dda4-4233-9861-2b99f57be30c	true	multivalued
0e0a29f1-dda4-4233-9861-2b99f57be30c	foo	user.attribute
0e0a29f1-dda4-4233-9861-2b99f57be30c	true	access.token.claim
0e0a29f1-dda4-4233-9861-2b99f57be30c	resource_access.${client_id}.roles	claim.name
0e0a29f1-dda4-4233-9861-2b99f57be30c	String	jsonType.label
eb858d9e-8043-49e5-8b0a-b8a6179affb4	true	userinfo.token.claim
eb858d9e-8043-49e5-8b0a-b8a6179affb4	username	user.attribute
eb858d9e-8043-49e5-8b0a-b8a6179affb4	true	id.token.claim
eb858d9e-8043-49e5-8b0a-b8a6179affb4	true	access.token.claim
eb858d9e-8043-49e5-8b0a-b8a6179affb4	upn	claim.name
eb858d9e-8043-49e5-8b0a-b8a6179affb4	String	jsonType.label
871688bf-f345-42b7-936b-315969ed2519	true	multivalued
871688bf-f345-42b7-936b-315969ed2519	foo	user.attribute
871688bf-f345-42b7-936b-315969ed2519	true	id.token.claim
871688bf-f345-42b7-936b-315969ed2519	true	access.token.claim
871688bf-f345-42b7-936b-315969ed2519	groups	claim.name
871688bf-f345-42b7-936b-315969ed2519	String	jsonType.label
3d7142a0-4b44-4c7b-b5b4-c69602e94b92	true	userinfo.token.claim
3d7142a0-4b44-4c7b-b5b4-c69602e94b92	locale	user.attribute
3d7142a0-4b44-4c7b-b5b4-c69602e94b92	true	id.token.claim
3d7142a0-4b44-4c7b-b5b4-c69602e94b92	true	access.token.claim
3d7142a0-4b44-4c7b-b5b4-c69602e94b92	locale	claim.name
3d7142a0-4b44-4c7b-b5b4-c69602e94b92	String	jsonType.label
74ff7d45-db8f-452f-83de-422135acbdb4	flask-oidc-example	included.client.audience
74ff7d45-db8f-452f-83de-422135acbdb4	false	id.token.claim
74ff7d45-db8f-452f-83de-422135acbdb4	true	access.token.claim
ec04818d-3771-4cc4-ab2e-704a331aee57	clientId	user.session.note
ec04818d-3771-4cc4-ab2e-704a331aee57	true	id.token.claim
ec04818d-3771-4cc4-ab2e-704a331aee57	true	access.token.claim
ec04818d-3771-4cc4-ab2e-704a331aee57	clientId	claim.name
ec04818d-3771-4cc4-ab2e-704a331aee57	String	jsonType.label
ecaf5672-5352-4247-812e-e16ff1ed97d5	clientHost	user.session.note
ecaf5672-5352-4247-812e-e16ff1ed97d5	true	id.token.claim
ecaf5672-5352-4247-812e-e16ff1ed97d5	true	access.token.claim
ecaf5672-5352-4247-812e-e16ff1ed97d5	clientHost	claim.name
ecaf5672-5352-4247-812e-e16ff1ed97d5	String	jsonType.label
4c6a4c85-0aeb-49af-9140-c42385737eb4	clientAddress	user.session.note
4c6a4c85-0aeb-49af-9140-c42385737eb4	true	id.token.claim
4c6a4c85-0aeb-49af-9140-c42385737eb4	true	access.token.claim
4c6a4c85-0aeb-49af-9140-c42385737eb4	clientAddress	claim.name
4c6a4c85-0aeb-49af-9140-c42385737eb4	String	jsonType.label
c6ebee1f-6f68-4b28-86ee-75488314f90f	clientId	user.session.note
c6ebee1f-6f68-4b28-86ee-75488314f90f	true	id.token.claim
c6ebee1f-6f68-4b28-86ee-75488314f90f	true	access.token.claim
c6ebee1f-6f68-4b28-86ee-75488314f90f	clientId	claim.name
c6ebee1f-6f68-4b28-86ee-75488314f90f	String	jsonType.label
bea8dbc0-ef37-4f6e-afa8-acaf489dcc94	clientHost	user.session.note
bea8dbc0-ef37-4f6e-afa8-acaf489dcc94	true	id.token.claim
bea8dbc0-ef37-4f6e-afa8-acaf489dcc94	true	access.token.claim
bea8dbc0-ef37-4f6e-afa8-acaf489dcc94	clientHost	claim.name
bea8dbc0-ef37-4f6e-afa8-acaf489dcc94	String	jsonType.label
a5f4a327-9bbe-4b59-a1c2-b83528e62113	clientAddress	user.session.note
a5f4a327-9bbe-4b59-a1c2-b83528e62113	true	id.token.claim
a5f4a327-9bbe-4b59-a1c2-b83528e62113	true	access.token.claim
a5f4a327-9bbe-4b59-a1c2-b83528e62113	clientAddress	claim.name
a5f4a327-9bbe-4b59-a1c2-b83528e62113	String	jsonType.label
384fceea-87a1-4791-8b69-d92f88e5efa8	clientId	user.session.note
384fceea-87a1-4791-8b69-d92f88e5efa8	true	id.token.claim
384fceea-87a1-4791-8b69-d92f88e5efa8	true	access.token.claim
384fceea-87a1-4791-8b69-d92f88e5efa8	clientId	claim.name
384fceea-87a1-4791-8b69-d92f88e5efa8	String	jsonType.label
9e874679-d664-4a23-b074-32393b72c871	clientHost	user.session.note
9e874679-d664-4a23-b074-32393b72c871	true	id.token.claim
9e874679-d664-4a23-b074-32393b72c871	true	access.token.claim
9e874679-d664-4a23-b074-32393b72c871	clientHost	claim.name
9e874679-d664-4a23-b074-32393b72c871	String	jsonType.label
9265349d-d430-4ef8-8479-3df0dc3e547d	clientAddress	user.session.note
9265349d-d430-4ef8-8479-3df0dc3e547d	true	id.token.claim
9265349d-d430-4ef8-8479-3df0dc3e547d	true	access.token.claim
9265349d-d430-4ef8-8479-3df0dc3e547d	clientAddress	claim.name
9265349d-d430-4ef8-8479-3df0dc3e547d	String	jsonType.label
258b2a8d-69f5-46c8-b9d9-59ec5b6a464b	echo-example	included.client.audience
258b2a8d-69f5-46c8-b9d9-59ec5b6a464b	true	id.token.claim
258b2a8d-69f5-46c8-b9d9-59ec5b6a464b	true	access.token.claim
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	fddadf01-eb47-448a-8162-1d070c54bd57	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	e35478b3-c358-4a4f-b171-182a23bc8612	074ee797-1d55-411a-9fc2-35d1f8acb344	864a4adf-9bc4-4fef-9145-c75dd0289279	06beb1d7-bdc4-4774-b26f-c1a357aa63f4	54b871c9-a583-4059-95fc-30b97f60691e	2592000	f	900	t	f	3c89359b-102a-40c2-be22-e6cd773383e4	0	f	0	0
test	60	300	300	\N	\N	\N	t	t	86400	\N	amestris	1578804821	\N	t	f	f	f	EXTERNAL	1800	36000	f	f	f6aebd7e-8c73-4b26-a315-cb50139df39e	1800	f	\N	t	t	t	f	0	1	30	6	HmacSHA1	totp	861c2f38-ee98-438b-9072-7e38354436a0	0b5ae7c2-1c2b-4445-9f07-b327e925624f	b7d435b6-179a-4f69-99b7-900e2b4c7136	90c1fd27-8a04-409f-bc90-5d4184e20ead	4276738b-ac85-4274-9532-0dc8ebe79a3e	2592000	f	900	t	f	ce555d1c-89b3-4c86-847b-e6344e5b112f	0	f	0	0
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.realm_attribute (name, value, realm_id) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly		master
_browser_header.xContentTypeOptions	nosniff	master
_browser_header.xRobotsTag	none	master
_browser_header.xFrameOptions	SAMEORIGIN	master
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	master
_browser_header.xXSSProtection	1; mode=block	master
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	master
bruteForceProtected	false	master
permanentLockout	false	master
maxFailureWaitSeconds	900	master
minimumQuickLoginWaitSeconds	60	master
waitIncrementSeconds	60	master
quickLoginCheckMilliSeconds	1000	master
maxDeltaTimeSeconds	43200	master
failureFactor	30	master
displayName	Keycloak	master
displayNameHtml	<div class="kc-logo-text"><span>Keycloak</span></div>	master
offlineSessionMaxLifespanEnabled	false	master
offlineSessionMaxLifespan	5184000	master
_browser_header.contentSecurityPolicyReportOnly		test
_browser_header.xContentTypeOptions	nosniff	test
_browser_header.xRobotsTag	none	test
_browser_header.xFrameOptions	SAMEORIGIN	test
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	test
_browser_header.xXSSProtection	1; mode=block	test
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	test
bruteForceProtected	false	test
permanentLockout	false	test
maxFailureWaitSeconds	900	test
minimumQuickLoginWaitSeconds	60	test
waitIncrementSeconds	60	test
quickLoginCheckMilliSeconds	1000	test
maxDeltaTimeSeconds	43200	test
failureFactor	30	test
offlineSessionMaxLifespanEnabled	false	test
offlineSessionMaxLifespan	5184000	test
actionTokenGeneratedByAdminLifespan	43200	test
actionTokenGeneratedByUserLifespan	300	test
webAuthnPolicyRpEntityName	keycloak	test
webAuthnPolicySignatureAlgorithms	ES256	test
webAuthnPolicyRpId		test
webAuthnPolicyAttestationConveyancePreference	not specified	test
webAuthnPolicyAuthenticatorAttachment	not specified	test
webAuthnPolicyRequireResidentKey	not specified	test
webAuthnPolicyUserVerificationRequirement	not specified	test
webAuthnPolicyCreateTimeout	0	test
webAuthnPolicyAvoidSameAuthenticatorRegister	false	test
displayName	Amestris	test
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.realm_default_roles (realm_id, role_id) FROM stdin;
master	38450e29-581b-40b1-9d1b-40b5f5292639
master	178285ba-f0de-4e87-80c8-863562a4cf4b
test	0718e5ce-17c2-441e-95e8-3dd6ab741a45
test	4149235c-9fc0-4948-96a1-e9d3dc7fcb3a
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
test	SEND_RESET_PASSWORD
test	UPDATE_CONSENT_ERROR
test	GRANT_CONSENT
test	REVOKE_GRANT
test	REMOVE_TOTP
test	UPDATE_TOTP
test	LOGIN_ERROR
test	CLIENT_LOGIN
test	RESET_PASSWORD_ERROR
test	IMPERSONATE_ERROR
test	CUSTOM_REQUIRED_ACTION
test	CODE_TO_TOKEN_ERROR
test	RESTART_AUTHENTICATION
test	IMPERSONATE
test	UPDATE_PROFILE_ERROR
test	UPDATE_PASSWORD_ERROR
test	LOGIN
test	CLIENT_INITIATED_ACCOUNT_LINKING
test	TOKEN_EXCHANGE
test	LOGOUT
test	REGISTER
test	CLIENT_REGISTER
test	IDENTITY_PROVIDER_LINK_ACCOUNT
test	UPDATE_PASSWORD
test	CLIENT_DELETE
test	FEDERATED_IDENTITY_LINK_ERROR
test	IDENTITY_PROVIDER_FIRST_LOGIN
test	CLIENT_DELETE_ERROR
test	VERIFY_EMAIL
test	RESTART_AUTHENTICATION_ERROR
test	CLIENT_LOGIN_ERROR
test	TOKEN_EXCHANGE_ERROR
test	EXECUTE_ACTIONS
test	REMOVE_FEDERATED_IDENTITY_ERROR
test	PERMISSION_TOKEN
test	SEND_IDENTITY_PROVIDER_LINK_ERROR
test	EXECUTE_ACTION_TOKEN_ERROR
test	SEND_VERIFY_EMAIL
test	EXECUTE_ACTIONS_ERROR
test	REMOVE_FEDERATED_IDENTITY
test	IDENTITY_PROVIDER_POST_LOGIN
test	IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR
test	UPDATE_EMAIL
test	REGISTER_ERROR
test	REVOKE_GRANT_ERROR
test	EXECUTE_ACTION_TOKEN
test	UPDATE_EMAIL_ERROR
test	LOGOUT_ERROR
test	CLIENT_UPDATE_ERROR
test	UPDATE_PROFILE
test	CLIENT_REGISTER_ERROR
test	FEDERATED_IDENTITY_LINK
test	SEND_IDENTITY_PROVIDER_LINK
test	SEND_VERIFY_EMAIL_ERROR
test	RESET_PASSWORD
test	CLIENT_INITIATED_ACCOUNT_LINKING_ERROR
test	UPDATE_CONSENT
test	REMOVE_TOTP_ERROR
test	VERIFY_EMAIL_ERROR
test	SEND_RESET_PASSWORD_ERROR
test	CLIENT_UPDATE
test	CUSTOM_REQUIRED_ACTION_ERROR
test	IDENTITY_PROVIDER_POST_LOGIN_ERROR
test	UPDATE_TOTP_ERROR
test	CODE_TO_TOKEN
test	IDENTITY_PROVIDER_FIRST_LOGIN_ERROR
test	GRANT_CONSENT_ERROR
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
test	jboss-logging
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	test
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.redirect_uris (client_id, value) FROM stdin;
e2aa0e6f-0fb3-4e47-a633-bcdb5ead5488	/realms/master/account/*
71f7395f-46fe-4aaa-a256-82e1a34fd69e	/admin/master/console/*
447f0d0b-3aa9-4446-8ef4-543579bf3623	/realms/test/flask-oidc-example/*
447f0d0b-3aa9-4446-8ef4-543579bf3623	http://192.168.64.10/flask-oidc/oidc_callback
f49b838f-f76a-494f-b435-ca4d272b55f2	/realms/test/hello-world-app/*
f49b838f-f76a-494f-b435-ca4d272b55f2	http://192.168.64.10/hello-node/oauth/callback
d74f2587-42a1-431c-b509-d7f4acd67b6b	/admin/amestris/console/*
8034070c-de34-44ed-8d12-43135a7ac5fd	/realms/amestris/account/*
17d6b9dd-1409-4475-bbf5-ca457212aadc	/realms/test/echo-example/*
17d6b9dd-1409-4475-bbf5-ca457212aadc	http://192.168.64.10/echo/oauth/callback
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
912cb168-d231-4b8e-88f8-ac34c5c086a0	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
18ba4e53-f958-4135-86ad-c853bfc3123e	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
97f9177c-6d84-437b-acd1-dd4a87eadaeb	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
8ed0fab6-5b6d-4232-aa27-cd69a23c4349	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
82d7ac31-aacb-4e72-b16b-c08774d4759b	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
4e2a13b3-5a49-4e2f-8632-c568b06807ff	VERIFY_EMAIL	Verify Email	test	t	f	VERIFY_EMAIL	50
4cc0e731-2786-42ec-90fb-b4040a481cd8	UPDATE_PROFILE	Update Profile	test	t	f	UPDATE_PROFILE	40
949cafb4-e485-4a7f-8ede-efe2c717bc2a	CONFIGURE_TOTP	Configure OTP	test	t	f	CONFIGURE_TOTP	10
f539da74-18c1-46db-b3ce-5c86092470b9	UPDATE_PASSWORD	Update Password	test	t	f	UPDATE_PASSWORD	30
e7c3220e-183e-4842-9a4b-aa825e0a40d1	terms_and_conditions	Terms and Conditions	test	f	f	terms_and_conditions	20
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
f49b838f-f76a-494f-b435-ca4d272b55f2	t	0	1
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
a3eca3ee-b481-4a7d-9332-353f2a7e5697	Default Policy	A policy that grants access only for users within this realm	js	0	0	f49b838f-f76a-494f-b435-ca4d272b55f2	\N
f8f1d753-7010-4131-89a7-2df2f7a2de37	Default Permission	A permission that applies to the default resource type	resource	1	0	f49b838f-f76a-494f-b435-ca4d272b55f2	\N
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
1843b874-6233-45be-bd36-b7eed16ab8ab	Default Resource	urn:hello-world-app:resources:default	\N	f49b838f-f76a-494f-b435-ca4d272b55f2	f49b838f-f76a-494f-b435-ca4d272b55f2	f	\N
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.resource_uris (resource_id, value) FROM stdin;
1843b874-6233-45be-bd36-b7eed16ab8ab	/*
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
17d6b9dd-1409-4475-bbf5-ca457212aadc	e6769c2e-c8b5-43f4-8b4c-327b8af2d12e
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
bd33d8e5-58a0-4b7f-aee1-2533f3f0eb32	447f0d0b-3aa9-4446-8ef4-543579bf3623	2e477043-4363-48ef-bb69-568c0c02b005	1578968080463	1578968080497	\N	\N
f0ef4c69-c40d-404e-b66f-489af0ac8996	447f0d0b-3aa9-4446-8ef4-543579bf3623	01ed29c7-52c5-43a4-9d29-f466b2c59e82	1578968789974	1578968789983	\N	\N
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
bd33d8e5-58a0-4b7f-aee1-2533f3f0eb32	447f0d0b-3aa9-4446-8ef4-543579bf3623
bd33d8e5-58a0-4b7f-aee1-2533f3f0eb32	b6c48a5b-f445-418c-b0cb-3694b520f873
bd33d8e5-58a0-4b7f-aee1-2533f3f0eb32	b76be569-7820-4b0d-b8b5-dcef52a34f13
bd33d8e5-58a0-4b7f-aee1-2533f3f0eb32	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d
f0ef4c69-c40d-404e-b66f-489af0ac8996	447f0d0b-3aa9-4446-8ef4-543579bf3623
f0ef4c69-c40d-404e-b66f-489af0ac8996	b6c48a5b-f445-418c-b0cb-3694b520f873
f0ef4c69-c40d-404e-b66f-489af0ac8996	b76be569-7820-4b0d-b8b5-dcef52a34f13
f0ef4c69-c40d-404e-b66f-489af0ac8996	5f7cad6a-fcfb-4c64-90ed-db3d4a31460d
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
3958aa5c-b056-4cb1-b45c-524251e1c749	\N	f5e65334-855e-4bac-bfd7-7fa87053cbb2	f	t	\N	\N	\N	master	admin	1577240325084	\N	0
374a3978-fe05-4eb8-83c1-85d03b70b369	\N	013c1289-d348-4731-8c56-aea967f6e8df	f	t	\N	\N	\N	test	service-account-flask-oidc-example	1578783920526	447f0d0b-3aa9-4446-8ef4-543579bf3623	0
50514603-7708-4e0d-91c3-a320c0dbe9d6	\N	9ad45670-31cf-433e-84bc-718c5965db73	f	t	\N	\N	\N	test	service-account-hello-world-app	1578788896606	f49b838f-f76a-494f-b435-ca4d272b55f2	0
e93b69b4-69a8-427f-a85f-49a0864dd483	\N	de7cdb56-39ea-44b4-8373-14d8a334b519	f	t	\N	\N	\N	test	service-account-echo-example	1578833954649	17d6b9dd-1409-4475-bbf5-ca457212aadc	0
01ed29c7-52c5-43a4-9d29-f466b2c59e82	edward.elric@gmail.com	edward.elric@gmail.com	t	t	\N	Edward	Elric	test	edward.elric@gmail.com	1578964757304	\N	0
42d209d0-3ca7-4041-87f4-788ca6d9b32f	alphonse.elric@gmail.com	alphonse.elric@gmail.com	t	t	\N	Alphonse	Elric	test	alphonse.elric@gmail.com	1578964823018	\N	0
2e477043-4363-48ef-bb69-568c0c02b005	winry.rockbell@gmail.com	winry.rockbell@gmail.com	t	t	\N	Winry	Rockbell	test	winry.rockbell@gmail.com	1578964916788	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
42d209d0-3ca7-4041-87f4-788ca6d9b32f	UPDATE_PASSWORD
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
38450e29-581b-40b1-9d1b-40b5f5292639	3958aa5c-b056-4cb1-b45c-524251e1c749
ec305514-3d2b-42dc-9dc6-228b4453a97e	3958aa5c-b056-4cb1-b45c-524251e1c749
178285ba-f0de-4e87-80c8-863562a4cf4b	3958aa5c-b056-4cb1-b45c-524251e1c749
a682ef18-1df1-4e67-b538-943ec8da2ca9	3958aa5c-b056-4cb1-b45c-524251e1c749
1b8ab441-1d09-4ee0-9692-754a438e6595	3958aa5c-b056-4cb1-b45c-524251e1c749
a11e9f11-7ec9-4292-b253-ffd375b7fe45	374a3978-fe05-4eb8-83c1-85d03b70b369
0718e5ce-17c2-441e-95e8-3dd6ab741a45	374a3978-fe05-4eb8-83c1-85d03b70b369
4149235c-9fc0-4948-96a1-e9d3dc7fcb3a	374a3978-fe05-4eb8-83c1-85d03b70b369
5f6c438c-34a1-4690-bbe6-acebd0f5f38b	374a3978-fe05-4eb8-83c1-85d03b70b369
0c9f8992-ad33-4829-ab67-05fa9eed5ec0	374a3978-fe05-4eb8-83c1-85d03b70b369
1df7206c-7798-47ba-9087-2f004d5f70e1	374a3978-fe05-4eb8-83c1-85d03b70b369
910b4ae0-0600-4801-86f0-d29cf39306ac	374a3978-fe05-4eb8-83c1-85d03b70b369
a11e9f11-7ec9-4292-b253-ffd375b7fe45	50514603-7708-4e0d-91c3-a320c0dbe9d6
0718e5ce-17c2-441e-95e8-3dd6ab741a45	50514603-7708-4e0d-91c3-a320c0dbe9d6
4149235c-9fc0-4948-96a1-e9d3dc7fcb3a	50514603-7708-4e0d-91c3-a320c0dbe9d6
5f6c438c-34a1-4690-bbe6-acebd0f5f38b	50514603-7708-4e0d-91c3-a320c0dbe9d6
0c9f8992-ad33-4829-ab67-05fa9eed5ec0	50514603-7708-4e0d-91c3-a320c0dbe9d6
1df7206c-7798-47ba-9087-2f004d5f70e1	50514603-7708-4e0d-91c3-a320c0dbe9d6
17426a0a-3452-4ea7-be7a-9fc482141867	50514603-7708-4e0d-91c3-a320c0dbe9d6
a11e9f11-7ec9-4292-b253-ffd375b7fe45	e93b69b4-69a8-427f-a85f-49a0864dd483
0718e5ce-17c2-441e-95e8-3dd6ab741a45	e93b69b4-69a8-427f-a85f-49a0864dd483
4149235c-9fc0-4948-96a1-e9d3dc7fcb3a	e93b69b4-69a8-427f-a85f-49a0864dd483
5f6c438c-34a1-4690-bbe6-acebd0f5f38b	e93b69b4-69a8-427f-a85f-49a0864dd483
0c9f8992-ad33-4829-ab67-05fa9eed5ec0	e93b69b4-69a8-427f-a85f-49a0864dd483
1df7206c-7798-47ba-9087-2f004d5f70e1	e93b69b4-69a8-427f-a85f-49a0864dd483
268718c4-8a59-42fb-875d-d9989bf435a1	e93b69b4-69a8-427f-a85f-49a0864dd483
a11e9f11-7ec9-4292-b253-ffd375b7fe45	01ed29c7-52c5-43a4-9d29-f466b2c59e82
0718e5ce-17c2-441e-95e8-3dd6ab741a45	01ed29c7-52c5-43a4-9d29-f466b2c59e82
4149235c-9fc0-4948-96a1-e9d3dc7fcb3a	01ed29c7-52c5-43a4-9d29-f466b2c59e82
5f6c438c-34a1-4690-bbe6-acebd0f5f38b	01ed29c7-52c5-43a4-9d29-f466b2c59e82
0c9f8992-ad33-4829-ab67-05fa9eed5ec0	01ed29c7-52c5-43a4-9d29-f466b2c59e82
1df7206c-7798-47ba-9087-2f004d5f70e1	01ed29c7-52c5-43a4-9d29-f466b2c59e82
e6769c2e-c8b5-43f4-8b4c-327b8af2d12e	01ed29c7-52c5-43a4-9d29-f466b2c59e82
a11e9f11-7ec9-4292-b253-ffd375b7fe45	42d209d0-3ca7-4041-87f4-788ca6d9b32f
0718e5ce-17c2-441e-95e8-3dd6ab741a45	42d209d0-3ca7-4041-87f4-788ca6d9b32f
4149235c-9fc0-4948-96a1-e9d3dc7fcb3a	42d209d0-3ca7-4041-87f4-788ca6d9b32f
5f6c438c-34a1-4690-bbe6-acebd0f5f38b	42d209d0-3ca7-4041-87f4-788ca6d9b32f
0c9f8992-ad33-4829-ab67-05fa9eed5ec0	42d209d0-3ca7-4041-87f4-788ca6d9b32f
1df7206c-7798-47ba-9087-2f004d5f70e1	42d209d0-3ca7-4041-87f4-788ca6d9b32f
e6769c2e-c8b5-43f4-8b4c-327b8af2d12e	42d209d0-3ca7-4041-87f4-788ca6d9b32f
a11e9f11-7ec9-4292-b253-ffd375b7fe45	2e477043-4363-48ef-bb69-568c0c02b005
0718e5ce-17c2-441e-95e8-3dd6ab741a45	2e477043-4363-48ef-bb69-568c0c02b005
4149235c-9fc0-4948-96a1-e9d3dc7fcb3a	2e477043-4363-48ef-bb69-568c0c02b005
5f6c438c-34a1-4690-bbe6-acebd0f5f38b	2e477043-4363-48ef-bb69-568c0c02b005
0c9f8992-ad33-4829-ab67-05fa9eed5ec0	2e477043-4363-48ef-bb69-568c0c02b005
1df7206c-7798-47ba-9087-2f004d5f70e1	2e477043-4363-48ef-bb69-568c0c02b005
e3ebc595-a7b1-4096-b831-bc8f1d7bc663	2e477043-4363-48ef-bb69-568c0c02b005
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak_user
--

COPY public.web_origins (client_id, value) FROM stdin;
71f7395f-46fe-4aaa-a256-82e1a34fd69e	+
d74f2587-42a1-431c-b509-d7f4acd67b6b	+
447f0d0b-3aa9-4446-8ef4-543579bf3623	/*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: client_default_roles constr_client_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT constr_client_default_roles PRIMARY KEY (client_id, role_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: realm_default_roles constraint_realm_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT constraint_realm_default_roles PRIMARY KEY (realm_id, role_id);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client_default_roles uk_8aelwnibji49avxsrtuf6xjow; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT uk_8aelwnibji49avxsrtuf6xjow UNIQUE (role_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: realm_default_roles uk_h4wpd7w4hsoolni3h0sw7btje; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT uk_h4wpd7w4hsoolni3h0sw7btje UNIQUE (role_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_def_roles_client; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_client_def_roles_client ON public.client_default_roles USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_def_roles_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_realm_def_roles_realm ON public.realm_default_roles USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak_user
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_default_roles fk_8aelwnibji49avxsrtuf6xjow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_8aelwnibji49avxsrtuf6xjow FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_client fk_c_cli_scope_client; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_scope_client fk_c_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_role; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_roles fk_evudb1ppw84oxfax2drs03icc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_evudb1ppw84oxfax2drs03icc FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: keycloak_group fk_group_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT fk_group_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_role; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_default_roles fk_h4wpd7w4hsoolni3h0sw7btje; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_h4wpd7w4hsoolni3h0sw7btje FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: keycloak_role fk_kjho5le2c0ral09fl8cm9wfw9; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_kjho5le2c0ral09fl8cm9wfw9 FOREIGN KEY (client) REFERENCES public.client(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_default_roles fk_nuilts7klwqw2h8m2b5joytky; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_nuilts7klwqw2h8m2b5joytky FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_p3rh9grku11kqfrs4fltt7rnq; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_p3rh9grku11kqfrs4fltt7rnq FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client fk_p56ctinxxb9gsk57fo49f9tac; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_p56ctinxxb9gsk57fo49f9tac FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope fk_realm_cli_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fk_realm_cli_scope FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: realm fk_traf444kk6qrkms7n56aiwq5y; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT fk_traf444kk6qrkms7n56aiwq5y FOREIGN KEY (master_admin_client) REFERENCES public.client(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak_user
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

