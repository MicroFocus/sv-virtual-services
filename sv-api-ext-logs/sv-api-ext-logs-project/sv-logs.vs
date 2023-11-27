<?xml version="1.0" encoding="utf-8"?>
<vs:virtualService version="5.9.0.1616" id="4f43d4ae-94a8-41e5-9461-62eeeb1c772f" name="sv-api-ext-logs v2023-06-15" description="Virtual service using REST" activeConfiguration="87d3606c-bdf5-42fb-b119-f581e2e4aada" nonExistentRealService="true" xmlns:vs="http://hp.com/SOAQ/ServiceVirtualization/2010/">
  <vs:projectId ref="{180C6126-3916-486F-A8B8-56EEB13F720B}" />
  <vs:projectName>sv-api-ext-logs-project</vs:projectName>
  <vs:serviceDescription ref="3d41a42f-1fe8-4933-af64-02bbb8d7a11e" />
  <vs:virtualEndpoint type="HTTP" address="/sv-api-ext/log" realAddress="" isTemporary="false" isDiscovered="false" useRealService="false" id="96e3e9dd-8b01-4eb5-a6cf-f9054d3a5805" name=" Endpoint">
    <vs:virtualInputAgent ref="HttpAgent" name="HTTP Gateway" />
    <vs:virtualOutputAgent ref="HttpAgent" name="HTTP Gateway" />
    <vs:realInputAgent ref="HttpAgent" name="HTTP Gateway" />
    <vs:realOutputAgent ref="HttpAgent" name="HTTP Gateway" />
    <vs:properties>
      <entry key="HTTP.AuthenticationAutodetect">True</entry>
      <entry key="HTTP.Custom401UnauthorizedHandling">False</entry>
      <entry key="REST.StrictUriSpecification">False</entry>
    </vs:properties>
  </vs:virtualEndpoint>
  <vs:dataModel ref="e6b936ad-449d-4814-87ad-ccf57dc23bdc" />
  <vs:performanceModel ref="02af0b81-f39c-4f86-b569-17d30b587b1b" />
  <vs:performanceModel ref="b1520177-eac2-4861-9f1d-6f9c5519c826" />
  <vs:performanceModel ref="6e9ef537-1ae2-490b-b6a1-98682973874c" />
  <vs:contentFile ref="4fc4db6b-ac1e-4ab8-be48-f56717b9bf40" />
  <vs:configuration id="87d3606c-bdf5-42fb-b119-f581e2e4aada" name="sv-logs Configuration">
    <vs:httpAuthentication>None</vs:httpAuthentication>
    <vs:httpAuthenticationAutodetect>True</vs:httpAuthenticationAutodetect>
    <vs:credentialStore id="689c57de-3eff-42e7-8334-284ff33c9fec">
      <vs:credentials />
      <vs:identities />
    </vs:credentialStore>
    <vs:securityConfiguration>
      <security />
      <clientSecurity />
      <serviceSecurity />
      <credentials>
        <clientCertificate value="Identity[0].Certificate" />
        <serviceCertificate value="ServiceIdentity.Certificate" />
        <userName value="Identity[0].UsernamePassword" />
      </credentials>
    </vs:securityConfiguration>
    <vs:messageSchemaLocked>False</vs:messageSchemaLocked>
    <vs:enableTrackLearning>True</vs:enableTrackLearning>
    <vs:logMessages>False</vs:logMessages>
  </vs:configuration>
</vs:virtualService>