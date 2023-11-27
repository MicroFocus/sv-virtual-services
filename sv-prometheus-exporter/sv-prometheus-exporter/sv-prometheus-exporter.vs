<?xml version="1.0" encoding="utf-8"?>
<vs:virtualService version="5.9.0.1616" id="a447a5f4-b28e-4a2b-a937-5bad22457fdb" name="sv-prometheus-exporter" description="Virtual service using REST" activeConfiguration="be9bace2-7319-4798-b943-11fac1a23129" nonExistentRealService="true" lastModifier="jakub" lastModification="63836716678893" xmlns:vs="http://hp.com/SOAQ/ServiceVirtualization/2010/">
  <vs:projectId ref="{76E4A9DE-177F-4DDF-8DE8-87AC87237CFF}" />
  <vs:projectName>sv-prometheus-exporter</vs:projectName>
  <vs:serviceDescription ref="22d8e31c-8b97-4307-b5f5-5f296289b230" />
  <vs:virtualEndpoint type="HTTP" address="/metrics" realAddress="" isTemporary="false" isDiscovered="false" useRealService="false" id="348c9ae7-6a65-4556-b0d5-465ff11ef355" name=" Endpoint">
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
  <vs:dataModel ref="1d74497a-6084-4608-8681-a0bfb64a0a52" />
  <vs:performanceModel ref="4d61dd21-a7b6-4eec-b433-a832eb1274e2" />
  <vs:performanceModel ref="c32bf285-1baa-4281-8112-1e48a7d46c7f" />
  <vs:performanceModel ref="d7158ed9-1978-4704-8bf3-50db977c06e4" />
  <vs:contentFile ref="d7c512b2-0bfa-4e5e-9a6f-41b21ff681ac" />
  <vs:configuration id="be9bace2-7319-4798-b943-11fac1a23129" name="Prometheus Exporter Configuration">
    <vs:httpAuthentication>None</vs:httpAuthentication>
    <vs:httpAuthenticationAutodetect>True</vs:httpAuthenticationAutodetect>
    <vs:credentialStore id="9f2b3be6-e502-4c6e-832c-987fd01fc606">
      <vs:credentials />
      <vs:identities />
    </vs:credentialStore>
    <vs:securityConfiguration>
      <credentials>
        <userName value="Identity[0].UsernamePassword" />
        <clientCertificate value="Identity[0].Certificate" />
        <serviceCertificate value="ServiceIdentity.Certificate" />
      </credentials>
      <security />
    </vs:securityConfiguration>
    <vs:messageSchemaLocked>False</vs:messageSchemaLocked>
    <vs:enableTrackLearning>True</vs:enableTrackLearning>
    <vs:logMessages>False</vs:logMessages>
  </vs:configuration>
</vs:virtualService>