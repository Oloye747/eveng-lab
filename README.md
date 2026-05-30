# eveng-lab

Production-style EVE-NG cyber range built with Terraform for real-world security validation, adversary simulation, detection engineering, and pre-production infrastructure testing.

This project is designed to simulate an enterprise environment with segmented networks, identity services, user endpoints, application tiers, security tooling, and isolated red team infrastructure. The goal is to support realistic offensive, defensive, and purple-team workflows in a safe, controlled lab.

## Objective

Turn a basic network lab into a production-style cyber range that can be used for:

- pre-production security validation
- penetration testing and adversary emulation
- Active Directory and hybrid identity attack-path testing
- SIEM, EDR, and IDS detection tuning
- incident response rehearsals
- web application and API security testing
- ransomware and lateral movement simulation
- cloud and hybrid architecture security exercises

## Design principles

- infrastructure as code first
- segmented enterprise-style architecture
- realistic identity, endpoint, and application workflows
- safe isolation for offensive tooling
- centralized telemetry and monitoring
- repeatable lab deployment and teardown
- production-style controls, logging, and governance

## Target architecture

The cyber range is organized into production-style zones:

- `preprod-mgmt-net` - management and administration
- `preprod-identity-net` - Active Directory, DNS, DHCP, PKI
- `preprod-user-net` - user workstations and endpoint activity
- `preprod-app-net` - internal application and API services
- `preprod-dmz-net` - internet-facing reverse proxy and web tier
- `preprod-security-net` - SIEM, IDS, EDR, NSM, scanning
- `preprod-redteam-net` - isolated offensive tooling and emulation
- `preprod-backup-net` - optional backup and recovery validation

### Example IP plan

- `preprod-mgmt-net` = `10.10.10.0/24`
- `preprod-identity-net` = `10.10.15.0/24`
- `preprod-user-net` = `10.10.20.0/24`
- `preprod-app-net` = `10.10.30.0/24`
- `preprod-dmz-net` = `10.10.40.0/24`
- `preprod-security-net` = `10.10.50.0/24`
- `preprod-redteam-net` = `10.10.60.0/24`
- `preprod-backup-net` = `10.10.70.0/24`

## Core components

### Management zone

- `fw-01` - perimeter firewall / router
- `jump-01` - hardened admin jump box
- `ansible-01` - automation and configuration management
- `git-runner-01` - CI/CD runner for validation and deployment
- `monitor-01` - management access and health monitoring

### Identity zone

- `dc-01` - Active Directory Domain Services
- `dns-01` - DNS
- `dhcp-01` - DHCP
- `ca-01` - optional certificate services
- `entra-sync-01` - optional hybrid identity simulation

### User zone

- `win11-01`
- `win11-02`
- `win11-03`
- `linux-user-01`

These systems generate realistic traffic and user behavior such as:

- browser activity
- SMB access
- RDP
- PowerShell
- email and attachments
- mapped drive usage
- domain authentication flows

### Application zone

- `proxy-01` - Nginx or HAProxy reverse proxy
- `web-01` - front-end application
- `api-01` - API service
- `app-01` - application tier
- `db-01` - database backend
- `files-01` - internal file service

### DMZ zone

- `waf-01` - optional web application firewall
- `bastion-01` - remote access gateway
- `public-web-01` - internet-facing application

### Security operations zone

- `siem-01` - Wazuh or Splunk
- `log-01` - ELK / OpenSearch log pipeline
- `ids-01` - Suricata or Snort
- `nsm-01` - Zeek network telemetry
- `dfir-01` - Velociraptor / forensic tools
- `scanner-01` - OpenVAS / vulnerability scanning
- `edr-mgmt-01` - optional endpoint security controller

### Red team zone

- `kali-01` - operator workstation
- `msf-01` - Metasploit Framework host
- `c2-01` - isolated command-and-control controller for lab-only exercises
- `phish-01` - isolated phishing simulation host
- `redirector-01` - optional redirector simulation node

## Production-style controls

This range is built to reflect real-world security architecture, not just a flat lab.

### Network controls

- segmented zones with controlled routing
- default-deny inter-zone policy
- ACL enforcement between user, app, identity, and security zones
- dedicated DMZ for internet-facing systems
- logging of north-south and east-west traffic
- optional NAT and egress filtering
- VLAN-style separation where applicable

### Identity controls

- domain-based authentication
- least-privilege access model
- administrative tiering
- service account hardening
- group policy enforcement
- MFA simulation where supported
- privileged access separation

### Logging and monitoring

- centralized log aggregation
- Windows event forwarding
- Sysmon on endpoints and servers
- Suricata or Zeek for network visibility
- SIEM correlation and alerting
- retention and search workflows
- offensive telemetry validation against detections

### Application security controls

- reverse proxy in front of app services
- WAF testing path for web scenarios
- restricted database access from application tier only
- TLS and certificate workflow testing
- authentication and session management testing
- secure logging and app telemetry forwarding

### Recovery and resilience

- snapshot-based rollback
- configuration as code
- repeatable rebuilds
- optional backup network and restore testing
- incident containment and revalidation workflow

## Offensive operations model

This lab supports authorized internal simulations only.

Red team operations are isolated in `preprod-redteam-net` and can be used to validate:

- phishing to endpoint compromise
- web exploit to backend pivot
- credential access and reuse detection
- privilege escalation
- Active Directory abuse paths
- lateral movement
- persistence validation
- detection engineering against known TTPs
- C2 communication monitoring in a controlled environment

Metasploit, C2 infrastructure, and related tooling are kept isolated and are intended for:

- lab-only attack simulation
- ATT&CK-aligned validation
- control and detection testing
- SIEM and EDR tuning
- purple-team exercises

## Real-world use cases

This environment is intended to support scenarios such as:

- phishing to endpoint compromise to AD abuse
- Kerberoasting and credential misuse detection
- suspicious PowerShell activity
- web application exploit to database access
- exposed service and segmentation validation
- ransomware simulation and containment testing
- endpoint-to-domain lateral movement tracking
- cloud-to-hybrid identity control validation
- incident response from alert to triage to containment
- purple-team replay of ATT&CK-mapped activity

## Deployment model

Terraform is used to define and deploy the topology.

Ansible and PowerShell are used to configure the hosts after provisioning.

### Terraform responsibilities

- lab creation
- network definition
- node provisioning
- interface mapping
- repeatable topology deployment
- environment teardown

### Ansible responsibilities

- Linux hardening
- package installation
- reverse proxy deployment
- agent installation
- SIEM and sensor bootstrap
- baseline configuration

### PowerShell responsibilities

- Windows server setup
- Active Directory deployment
- DNS and DHCP configuration
- domain join workflows
- Sysmon installation
- endpoint instrumentation
- GPO automation

## Recommended deployment order

1. Core network and segmentation
   - firewall
   - routing
   - access control
   - zone creation

2. Identity services
   - AD
   - DNS
   - DHCP
   - certificate services if needed

3. Security telemetry
   - SIEM
   - Sysmon
   - IDS / NSM
   - log forwarding

4. Application tier
   - reverse proxy
   - web app
   - API
   - database

5. User endpoints
   - Windows clients
   - Linux workstation
   - domain join and baseline controls

6. Red team infrastructure
   - Kali
   - Metasploit
   - isolated C2
   - phishing simulation host

7. Detection and response playbooks
   - brute force detection
   - suspicious PowerShell
   - web exploit detection
   - privilege escalation detection
   - lateral movement detection

## Repository structure

```text
.
├── provider.tf
├── versions.tf
├── variables.tf
├── main.tf
├── nodes.tf
├── links.tf
├── outputs.tf
├── README.md
├── ansible/
├── powershell/
├── scripts/
└── docs/
