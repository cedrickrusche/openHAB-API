// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;
import 'openhab.enums.swagger.dart' as enums;
export 'openhab.enums.swagger.dart';

part 'openhab.swagger.chopper.dart';
part 'openhab.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Openhab extends ChopperService {
  static Openhab create({
    ChopperClient? client,
    Authenticator? authenticator,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$Openhab(client);
    }

    final newClient = ChopperClient(
        services: [_$Openhab()],
        converter: $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Openhab(newClient);
  }

  ///Get all available module types.
  ///@param Accept-Language language
  ///@param tags tags for filtering
  ///@param type filtering by action, condition or trigger
  Future<chopper.Response<List<ModuleTypeDTO>>> moduleTypesGet({
    String? acceptLanguage,
    String? tags,
    String? type,
  }) {
    generatedMapping.putIfAbsent(
        ModuleTypeDTO, () => ModuleTypeDTO.fromJsonFactory);

    return _moduleTypesGet(
        acceptLanguage: acceptLanguage, tags: tags, type: type);
  }

  ///Get all available module types.
  ///@param Accept-Language language
  ///@param tags tags for filtering
  ///@param type filtering by action, condition or trigger
  @Get(path: '/module-types')
  Future<chopper.Response<List<ModuleTypeDTO>>> _moduleTypesGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('tags') String? tags,
    @Query('type') String? type,
  });

  ///Gets a module type corresponding to the given UID.
  ///@param Accept-Language language
  ///@param moduleTypeUID moduleTypeUID
  Future<chopper.Response<ModuleTypeDTO>> moduleTypesModuleTypeUIDGet({
    String? acceptLanguage,
    required String? moduleTypeUID,
  }) {
    generatedMapping.putIfAbsent(
        ModuleTypeDTO, () => ModuleTypeDTO.fromJsonFactory);

    return _moduleTypesModuleTypeUIDGet(
        acceptLanguage: acceptLanguage, moduleTypeUID: moduleTypeUID);
  }

  ///Gets a module type corresponding to the given UID.
  ///@param Accept-Language language
  ///@param moduleTypeUID moduleTypeUID
  @Get(path: '/module-types/{moduleTypeUID}')
  Future<chopper.Response<ModuleTypeDTO>> _moduleTypesModuleTypeUIDGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('moduleTypeUID') required String? moduleTypeUID,
  });

  ///Get available rules, optionally filtered by tags and/or prefix.
  ///@param prefix
  ///@param tags
  ///@param summary summary fields only
  Future<chopper.Response<List<EnrichedRuleDTO>>> rulesGet({
    String? prefix,
    List<String>? tags,
    bool? summary,
  }) {
    generatedMapping.putIfAbsent(
        EnrichedRuleDTO, () => EnrichedRuleDTO.fromJsonFactory);

    return _rulesGet(prefix: prefix, tags: tags, summary: summary);
  }

  ///Get available rules, optionally filtered by tags and/or prefix.
  ///@param prefix
  ///@param tags
  ///@param summary summary fields only
  @Get(path: '/rules')
  Future<chopper.Response<List<EnrichedRuleDTO>>> _rulesGet({
    @Query('prefix') String? prefix,
    @Query('tags') List<String>? tags,
    @Query('summary') bool? summary,
  });

  ///Creates a rule.
  Future<chopper.Response> rulesPost({required RuleDTO? body}) {
    return _rulesPost(body: body);
  }

  ///Creates a rule.
  @Post(
    path: '/rules',
    optionalBody: true,
  )
  Future<chopper.Response> _rulesPost({@Body() required RuleDTO? body});

  ///Sets the rule enabled status.
  ///@param ruleUID ruleUID
  Future<chopper.Response> rulesRuleUIDEnablePost({
    required String? ruleUID,
    required String? body,
  }) {
    return _rulesRuleUIDEnablePost(ruleUID: ruleUID, body: body);
  }

  ///Sets the rule enabled status.
  ///@param ruleUID ruleUID
  @Post(
    path: '/rules/{ruleUID}/enable',
    optionalBody: true,
  )
  Future<chopper.Response> _rulesRuleUIDEnablePost({
    @Path('ruleUID') required String? ruleUID,
    @Body() required String? body,
  });

  ///Gets the rule actions.
  ///@param ruleUID ruleUID
  Future<chopper.Response<List<ActionDTO>>> rulesRuleUIDActionsGet(
      {required String? ruleUID}) {
    generatedMapping.putIfAbsent(ActionDTO, () => ActionDTO.fromJsonFactory);

    return _rulesRuleUIDActionsGet(ruleUID: ruleUID);
  }

  ///Gets the rule actions.
  ///@param ruleUID ruleUID
  @Get(path: '/rules/{ruleUID}/actions')
  Future<chopper.Response<List<ActionDTO>>> _rulesRuleUIDActionsGet(
      {@Path('ruleUID') required String? ruleUID});

  ///Gets the rule corresponding to the given UID.
  ///@param ruleUID ruleUID
  Future<chopper.Response<EnrichedRuleDTO>> rulesRuleUIDGet(
      {required String? ruleUID}) {
    generatedMapping.putIfAbsent(
        EnrichedRuleDTO, () => EnrichedRuleDTO.fromJsonFactory);

    return _rulesRuleUIDGet(ruleUID: ruleUID);
  }

  ///Gets the rule corresponding to the given UID.
  ///@param ruleUID ruleUID
  @Get(path: '/rules/{ruleUID}')
  Future<chopper.Response<EnrichedRuleDTO>> _rulesRuleUIDGet(
      {@Path('ruleUID') required String? ruleUID});

  ///Updates an existing rule corresponding to the given UID.
  ///@param ruleUID ruleUID
  Future<chopper.Response> rulesRuleUIDPut({
    required String? ruleUID,
    required RuleDTO? body,
  }) {
    return _rulesRuleUIDPut(ruleUID: ruleUID, body: body);
  }

  ///Updates an existing rule corresponding to the given UID.
  ///@param ruleUID ruleUID
  @Put(
    path: '/rules/{ruleUID}',
    optionalBody: true,
  )
  Future<chopper.Response> _rulesRuleUIDPut({
    @Path('ruleUID') required String? ruleUID,
    @Body() required RuleDTO? body,
  });

  ///Removes an existing rule corresponding to the given UID.
  ///@param ruleUID ruleUID
  Future<chopper.Response> rulesRuleUIDDelete({required String? ruleUID}) {
    return _rulesRuleUIDDelete(ruleUID: ruleUID);
  }

  ///Removes an existing rule corresponding to the given UID.
  ///@param ruleUID ruleUID
  @Delete(path: '/rules/{ruleUID}')
  Future<chopper.Response> _rulesRuleUIDDelete(
      {@Path('ruleUID') required String? ruleUID});

  ///Gets the rule conditions.
  ///@param ruleUID ruleUID
  Future<chopper.Response<List<ConditionDTO>>> rulesRuleUIDConditionsGet(
      {required String? ruleUID}) {
    generatedMapping.putIfAbsent(
        ConditionDTO, () => ConditionDTO.fromJsonFactory);

    return _rulesRuleUIDConditionsGet(ruleUID: ruleUID);
  }

  ///Gets the rule conditions.
  ///@param ruleUID ruleUID
  @Get(path: '/rules/{ruleUID}/conditions')
  Future<chopper.Response<List<ConditionDTO>>> _rulesRuleUIDConditionsGet(
      {@Path('ruleUID') required String? ruleUID});

  ///Gets the rule configuration values.
  ///@param ruleUID ruleUID
  Future<chopper.Response<String>> rulesRuleUIDConfigGet(
      {required String? ruleUID}) {
    return _rulesRuleUIDConfigGet(ruleUID: ruleUID);
  }

  ///Gets the rule configuration values.
  ///@param ruleUID ruleUID
  @Get(path: '/rules/{ruleUID}/config')
  Future<chopper.Response<String>> _rulesRuleUIDConfigGet(
      {@Path('ruleUID') required String? ruleUID});

  ///Sets the rule configuration values.
  ///@param ruleUID ruleUID
  Future<chopper.Response> rulesRuleUIDConfigPut({
    required String? ruleUID,
    required Object? body,
  }) {
    return _rulesRuleUIDConfigPut(ruleUID: ruleUID, body: body);
  }

  ///Sets the rule configuration values.
  ///@param ruleUID ruleUID
  @Put(
    path: '/rules/{ruleUID}/config',
    optionalBody: true,
  )
  Future<chopper.Response> _rulesRuleUIDConfigPut({
    @Path('ruleUID') required String? ruleUID,
    @Body() required Object? body,
  });

  ///Gets the rule's module corresponding to the given Category and ID.
  ///@param ruleUID ruleUID
  ///@param moduleCategory moduleCategory
  ///@param id id
  Future<chopper.Response<ModuleDTO>> rulesRuleUIDModuleCategoryIdGet({
    required String? ruleUID,
    required String? moduleCategory,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(ModuleDTO, () => ModuleDTO.fromJsonFactory);

    return _rulesRuleUIDModuleCategoryIdGet(
        ruleUID: ruleUID, moduleCategory: moduleCategory, id: id);
  }

  ///Gets the rule's module corresponding to the given Category and ID.
  ///@param ruleUID ruleUID
  ///@param moduleCategory moduleCategory
  ///@param id id
  @Get(path: '/rules/{ruleUID}/{moduleCategory}/{id}')
  Future<chopper.Response<ModuleDTO>> _rulesRuleUIDModuleCategoryIdGet({
    @Path('ruleUID') required String? ruleUID,
    @Path('moduleCategory') required String? moduleCategory,
    @Path('id') required String? id,
  });

  ///Gets the module's configuration.
  ///@param ruleUID ruleUID
  ///@param moduleCategory moduleCategory
  ///@param id id
  Future<chopper.Response<String>> rulesRuleUIDModuleCategoryIdConfigGet({
    required String? ruleUID,
    required String? moduleCategory,
    required String? id,
  }) {
    return _rulesRuleUIDModuleCategoryIdConfigGet(
        ruleUID: ruleUID, moduleCategory: moduleCategory, id: id);
  }

  ///Gets the module's configuration.
  ///@param ruleUID ruleUID
  ///@param moduleCategory moduleCategory
  ///@param id id
  @Get(path: '/rules/{ruleUID}/{moduleCategory}/{id}/config')
  Future<chopper.Response<String>> _rulesRuleUIDModuleCategoryIdConfigGet({
    @Path('ruleUID') required String? ruleUID,
    @Path('moduleCategory') required String? moduleCategory,
    @Path('id') required String? id,
  });

  ///Gets the module's configuration parameter.
  ///@param ruleUID ruleUID
  ///@param moduleCategory moduleCategory
  ///@param id id
  ///@param param param
  Future<chopper.Response<String>> rulesRuleUIDModuleCategoryIdConfigParamGet({
    required String? ruleUID,
    required String? moduleCategory,
    required String? id,
    required String? param,
  }) {
    return _rulesRuleUIDModuleCategoryIdConfigParamGet(
        ruleUID: ruleUID, moduleCategory: moduleCategory, id: id, param: param);
  }

  ///Gets the module's configuration parameter.
  ///@param ruleUID ruleUID
  ///@param moduleCategory moduleCategory
  ///@param id id
  ///@param param param
  @Get(path: '/rules/{ruleUID}/{moduleCategory}/{id}/config/{param}')
  Future<chopper.Response<String>> _rulesRuleUIDModuleCategoryIdConfigParamGet({
    @Path('ruleUID') required String? ruleUID,
    @Path('moduleCategory') required String? moduleCategory,
    @Path('id') required String? id,
    @Path('param') required String? param,
  });

  ///Sets the module's configuration parameter value.
  ///@param ruleUID ruleUID
  ///@param moduleCategory moduleCategory
  ///@param id id
  ///@param param param
  Future<chopper.Response> rulesRuleUIDModuleCategoryIdConfigParamPut({
    required String? ruleUID,
    required String? moduleCategory,
    required String? id,
    required String? param,
    required String? body,
  }) {
    return _rulesRuleUIDModuleCategoryIdConfigParamPut(
        ruleUID: ruleUID,
        moduleCategory: moduleCategory,
        id: id,
        param: param,
        body: body);
  }

  ///Sets the module's configuration parameter value.
  ///@param ruleUID ruleUID
  ///@param moduleCategory moduleCategory
  ///@param id id
  ///@param param param
  @Put(
    path: '/rules/{ruleUID}/{moduleCategory}/{id}/config/{param}',
    optionalBody: true,
  )
  Future<chopper.Response> _rulesRuleUIDModuleCategoryIdConfigParamPut({
    @Path('ruleUID') required String? ruleUID,
    @Path('moduleCategory') required String? moduleCategory,
    @Path('id') required String? id,
    @Path('param') required String? param,
    @Body() required String? body,
  });

  ///Gets the rule triggers.
  ///@param ruleUID ruleUID
  Future<chopper.Response<List<TriggerDTO>>> rulesRuleUIDTriggersGet(
      {required String? ruleUID}) {
    generatedMapping.putIfAbsent(TriggerDTO, () => TriggerDTO.fromJsonFactory);

    return _rulesRuleUIDTriggersGet(ruleUID: ruleUID);
  }

  ///Gets the rule triggers.
  ///@param ruleUID ruleUID
  @Get(path: '/rules/{ruleUID}/triggers')
  Future<chopper.Response<List<TriggerDTO>>> _rulesRuleUIDTriggersGet(
      {@Path('ruleUID') required String? ruleUID});

  ///Executes actions of the rule.
  ///@param ruleUID ruleUID
  Future<chopper.Response> rulesRuleUIDRunnowPost({
    required String? ruleUID,
    required Object? body,
  }) {
    return _rulesRuleUIDRunnowPost(ruleUID: ruleUID, body: body);
  }

  ///Executes actions of the rule.
  ///@param ruleUID ruleUID
  @Post(
    path: '/rules/{ruleUID}/runnow',
    optionalBody: true,
  )
  Future<chopper.Response> _rulesRuleUIDRunnowPost({
    @Path('ruleUID') required String? ruleUID,
    @Body() required Object? body,
  });

  ///Simulates the executions of rules filtered by tag 'Schedule' within the given times.
  ///@param from Start time of the simulated rule executions. Will default to the current time. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  ///@param until End time of the simulated rule executions. Will default to 30 days after the start time. Must be less than 180 days after the given start time. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  Future<chopper.Response<List<RuleExecution>>> rulesScheduleSimulationsGet({
    String? from,
    String? until,
  }) {
    generatedMapping.putIfAbsent(
        RuleExecution, () => RuleExecution.fromJsonFactory);

    return _rulesScheduleSimulationsGet(from: from, until: until);
  }

  ///Simulates the executions of rules filtered by tag 'Schedule' within the given times.
  ///@param from Start time of the simulated rule executions. Will default to the current time. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  ///@param until End time of the simulated rule executions. Will default to 30 days after the start time. Must be less than 180 days after the given start time. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  @Get(path: '/rules/schedule/simulations')
  Future<chopper.Response<List<RuleExecution>>> _rulesScheduleSimulationsGet({
    @Query('from') String? from,
    @Query('until') String? until,
  });

  ///Get all available templates.
  ///@param Accept-Language language
  Future<chopper.Response<List<Template>>> templatesGet(
      {String? acceptLanguage}) {
    generatedMapping.putIfAbsent(Template, () => Template.fromJsonFactory);

    return _templatesGet(acceptLanguage: acceptLanguage);
  }

  ///Get all available templates.
  ///@param Accept-Language language
  @Get(path: '/templates')
  Future<chopper.Response<List<Template>>> _templatesGet(
      {@Header('Accept-Language') String? acceptLanguage});

  ///Gets a template corresponding to the given UID.
  ///@param Accept-Language language
  ///@param templateUID templateUID
  Future<chopper.Response<Template>> templatesTemplateUIDGet({
    String? acceptLanguage,
    required String? templateUID,
  }) {
    generatedMapping.putIfAbsent(Template, () => Template.fromJsonFactory);

    return _templatesTemplateUIDGet(
        acceptLanguage: acceptLanguage, templateUID: templateUID);
  }

  ///Gets a template corresponding to the given UID.
  ///@param Accept-Language language
  ///@param templateUID templateUID
  @Get(path: '/templates/{templateUID}')
  Future<chopper.Response<Template>> _templatesTemplateUIDGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('templateUID') required String? templateUID,
  });

  ///A unified unique id.
  Future<chopper.Response<String>> uuidGet() {
    return _uuidGet();
  }

  ///A unified unique id.
  @Get(path: '/uuid')
  Future<chopper.Response<String>> _uuidGet();

  ///Get the default sink if defined or the first available sink.
  ///@param Accept-Language language
  Future<chopper.Response<AudioSinkDTO>> audioDefaultsinkGet(
      {String? acceptLanguage}) {
    generatedMapping.putIfAbsent(
        AudioSinkDTO, () => AudioSinkDTO.fromJsonFactory);

    return _audioDefaultsinkGet(acceptLanguage: acceptLanguage);
  }

  ///Get the default sink if defined or the first available sink.
  ///@param Accept-Language language
  @Get(path: '/audio/defaultsink')
  Future<chopper.Response<AudioSinkDTO>> _audioDefaultsinkGet(
      {@Header('Accept-Language') String? acceptLanguage});

  ///Get the default source if defined or the first available source.
  ///@param Accept-Language language
  Future<chopper.Response<AudioSourceDTO>> audioDefaultsourceGet(
      {String? acceptLanguage}) {
    generatedMapping.putIfAbsent(
        AudioSourceDTO, () => AudioSourceDTO.fromJsonFactory);

    return _audioDefaultsourceGet(acceptLanguage: acceptLanguage);
  }

  ///Get the default source if defined or the first available source.
  ///@param Accept-Language language
  @Get(path: '/audio/defaultsource')
  Future<chopper.Response<AudioSourceDTO>> _audioDefaultsourceGet(
      {@Header('Accept-Language') String? acceptLanguage});

  ///Get the list of all sinks.
  ///@param Accept-Language language
  Future<chopper.Response<List<AudioSinkDTO>>> audioSinksGet(
      {String? acceptLanguage}) {
    generatedMapping.putIfAbsent(
        AudioSinkDTO, () => AudioSinkDTO.fromJsonFactory);

    return _audioSinksGet(acceptLanguage: acceptLanguage);
  }

  ///Get the list of all sinks.
  ///@param Accept-Language language
  @Get(path: '/audio/sinks')
  Future<chopper.Response<List<AudioSinkDTO>>> _audioSinksGet(
      {@Header('Accept-Language') String? acceptLanguage});

  ///Get the list of all sources.
  ///@param Accept-Language language
  Future<chopper.Response<List<AudioSourceDTO>>> audioSourcesGet(
      {String? acceptLanguage}) {
    generatedMapping.putIfAbsent(
        AudioSourceDTO, () => AudioSourceDTO.fromJsonFactory);

    return _audioSourcesGet(acceptLanguage: acceptLanguage);
  }

  ///Get the list of all sources.
  ///@param Accept-Language language
  @Get(path: '/audio/sources')
  Future<chopper.Response<List<AudioSourceDTO>>> _audioSourcesGet(
      {@Header('Accept-Language') String? acceptLanguage});

  ///Delete the session associated with a refresh token.
  Future<chopper.Response> authLogoutPost(
      {required AuthLogoutPost$RequestBody? body}) {
    return _authLogoutPost(body: body);
  }

  ///Delete the session associated with a refresh token.
  @Post(
    path: '/auth/logout',
    optionalBody: true,
  )
  Future<chopper.Response> _authLogoutPost(
      {@Body() required AuthLogoutPost$RequestBody? body});

  ///List the API tokens associated to the authenticated user.
  Future<chopper.Response<List<UserApiTokenDTO>>> authApitokensGet() {
    generatedMapping.putIfAbsent(
        UserApiTokenDTO, () => UserApiTokenDTO.fromJsonFactory);

    return _authApitokensGet();
  }

  ///List the API tokens associated to the authenticated user.
  @Get(path: '/auth/apitokens')
  Future<chopper.Response<List<UserApiTokenDTO>>> _authApitokensGet();

  ///List the sessions associated to the authenticated user.
  Future<chopper.Response<List<UserSessionDTO>>> authSessionsGet() {
    generatedMapping.putIfAbsent(
        UserSessionDTO, () => UserSessionDTO.fromJsonFactory);

    return _authSessionsGet();
  }

  ///List the sessions associated to the authenticated user.
  @Get(path: '/auth/sessions')
  Future<chopper.Response<List<UserSessionDTO>>> _authSessionsGet();

  ///Get access and refresh tokens.
  ///@param useCookie
  Future<chopper.Response<TokenResponseDTO>> authTokenPost({
    bool? useCookie,
    required AuthTokenPost$RequestBody? body,
  }) {
    generatedMapping.putIfAbsent(
        TokenResponseDTO, () => TokenResponseDTO.fromJsonFactory);

    return _authTokenPost(useCookie: useCookie, body: body);
  }

  ///Get access and refresh tokens.
  ///@param useCookie
  @Post(
    path: '/auth/token',
    optionalBody: true,
  )
  Future<chopper.Response<TokenResponseDTO>> _authTokenPost({
    @Query('useCookie') bool? useCookie,
    @Body() required AuthTokenPost$RequestBody? body,
  });

  ///Revoke a specified API token associated to the authenticated user.
  ///@param name
  Future<chopper.Response> authApitokensNameDelete({required String? name}) {
    return _authApitokensNameDelete(name: name);
  }

  ///Revoke a specified API token associated to the authenticated user.
  ///@param name
  @Delete(path: '/auth/apitokens/{name}')
  Future<chopper.Response> _authApitokensNameDelete(
      {@Path('name') required String? name});

  ///Get all add-ons.
  ///@param Accept-Language language
  ///@param serviceId service ID
  Future<chopper.Response<List<Addon>>> addonsGet({
    String? acceptLanguage,
    String? serviceId,
  }) {
    generatedMapping.putIfAbsent(Addon, () => Addon.fromJsonFactory);

    return _addonsGet(acceptLanguage: acceptLanguage, serviceId: serviceId);
  }

  ///Get all add-ons.
  ///@param Accept-Language language
  ///@param serviceId service ID
  @Get(path: '/addons')
  Future<chopper.Response<List<Addon>>> _addonsGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('serviceId') String? serviceId,
  });

  ///Get add-on with given ID.
  ///@param Accept-Language language
  ///@param addonId addon ID
  ///@param serviceId service ID
  Future<chopper.Response<Addon>> addonsAddonIdGet({
    String? acceptLanguage,
    required String? addonId,
    String? serviceId,
  }) {
    generatedMapping.putIfAbsent(Addon, () => Addon.fromJsonFactory);

    return _addonsAddonIdGet(
        acceptLanguage: acceptLanguage, addonId: addonId, serviceId: serviceId);
  }

  ///Get add-on with given ID.
  ///@param Accept-Language language
  ///@param addonId addon ID
  ///@param serviceId service ID
  @Get(path: '/addons/{addonId}')
  Future<chopper.Response<Addon>> _addonsAddonIdGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('addonId') required String? addonId,
    @Query('serviceId') String? serviceId,
  });

  ///Get all add-on types.
  ///@param Accept-Language language
  Future<chopper.Response<List<AddonType>>> addonsServicesGet(
      {String? acceptLanguage}) {
    generatedMapping.putIfAbsent(AddonType, () => AddonType.fromJsonFactory);

    return _addonsServicesGet(acceptLanguage: acceptLanguage);
  }

  ///Get all add-on types.
  ///@param Accept-Language language
  @Get(path: '/addons/services')
  Future<chopper.Response<List<AddonType>>> _addonsServicesGet(
      {@Header('Accept-Language') String? acceptLanguage});

  ///Get add-on services.
  ///@param Accept-Language language
  ///@param serviceId service ID
  Future<chopper.Response<List<AddonType>>> addonsTypesGet({
    String? acceptLanguage,
    String? serviceId,
  }) {
    generatedMapping.putIfAbsent(AddonType, () => AddonType.fromJsonFactory);

    return _addonsTypesGet(
        acceptLanguage: acceptLanguage, serviceId: serviceId);
  }

  ///Get add-on services.
  ///@param Accept-Language language
  ///@param serviceId service ID
  @Get(path: '/addons/types')
  Future<chopper.Response<List<AddonType>>> _addonsTypesGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('serviceId') String? serviceId,
  });

  ///Installs the add-on with the given ID.
  ///@param addonId addon ID
  ///@param serviceId service ID
  Future<chopper.Response> addonsAddonIdInstallPost({
    required String? addonId,
    String? serviceId,
  }) {
    return _addonsAddonIdInstallPost(addonId: addonId, serviceId: serviceId);
  }

  ///Installs the add-on with the given ID.
  ///@param addonId addon ID
  ///@param serviceId service ID
  @Post(
    path: '/addons/{addonId}/install',
    optionalBody: true,
  )
  Future<chopper.Response> _addonsAddonIdInstallPost({
    @Path('addonId') required String? addonId,
    @Query('serviceId') String? serviceId,
  });

  ///Installs the add-on from the given URL.
  ///@param url addon install URL
  Future<chopper.Response> addonsUrlUrlInstallPost({required String? url}) {
    return _addonsUrlUrlInstallPost(url: url);
  }

  ///Installs the add-on from the given URL.
  ///@param url addon install URL
  @Post(
    path: '/addons/url/{url}/install',
    optionalBody: true,
  )
  Future<chopper.Response> _addonsUrlUrlInstallPost(
      {@Path('url') required String? url});

  ///Uninstalls the add-on with the given ID.
  ///@param addonId addon ID
  ///@param serviceId service ID
  Future<chopper.Response> addonsAddonIdUninstallPost({
    required String? addonId,
    String? serviceId,
  }) {
    return _addonsAddonIdUninstallPost(addonId: addonId, serviceId: serviceId);
  }

  ///Uninstalls the add-on with the given ID.
  ///@param addonId addon ID
  ///@param serviceId service ID
  @Post(
    path: '/addons/{addonId}/uninstall',
    optionalBody: true,
  )
  Future<chopper.Response> _addonsAddonIdUninstallPost({
    @Path('addonId') required String? addonId,
    @Query('serviceId') String? serviceId,
  });

  ///Get all bindings.
  ///@param Accept-Language language
  Future<chopper.Response<List<BindingInfoDTO>>> bindingsGet(
      {String? acceptLanguage}) {
    generatedMapping.putIfAbsent(
        BindingInfoDTO, () => BindingInfoDTO.fromJsonFactory);

    return _bindingsGet(acceptLanguage: acceptLanguage);
  }

  ///Get all bindings.
  ///@param Accept-Language language
  @Get(path: '/bindings')
  Future<chopper.Response<List<BindingInfoDTO>>> _bindingsGet(
      {@Header('Accept-Language') String? acceptLanguage});

  ///Get binding configuration for given binding ID.
  ///@param bindingId service ID
  Future<chopper.Response<String>> bindingsBindingIdConfigGet(
      {required String? bindingId}) {
    return _bindingsBindingIdConfigGet(bindingId: bindingId);
  }

  ///Get binding configuration for given binding ID.
  ///@param bindingId service ID
  @Get(path: '/bindings/{bindingId}/config')
  Future<chopper.Response<String>> _bindingsBindingIdConfigGet(
      {@Path('bindingId') required String? bindingId});

  ///Updates a binding configuration for given binding ID and returns the old configuration.
  ///@param bindingId service ID
  Future<chopper.Response<String>> bindingsBindingIdConfigPut({
    required String? bindingId,
    required Object? body,
  }) {
    return _bindingsBindingIdConfigPut(bindingId: bindingId, body: body);
  }

  ///Updates a binding configuration for given binding ID and returns the old configuration.
  ///@param bindingId service ID
  @Put(
    path: '/bindings/{bindingId}/config',
    optionalBody: true,
  )
  Future<chopper.Response<String>> _bindingsBindingIdConfigPut({
    @Path('bindingId') required String? bindingId,
    @Body() required Object? body,
  });

  ///Gets all available channel types.
  ///@param Accept-Language language
  ///@param prefixes filter UIDs by prefix (multiple comma-separated prefixes allowed, for example: 'system,mqtt')
  Future<chopper.Response<List<ChannelTypeDTO>>> channelTypesGet({
    String? acceptLanguage,
    String? prefixes,
  }) {
    generatedMapping.putIfAbsent(
        ChannelTypeDTO, () => ChannelTypeDTO.fromJsonFactory);

    return _channelTypesGet(acceptLanguage: acceptLanguage, prefixes: prefixes);
  }

  ///Gets all available channel types.
  ///@param Accept-Language language
  ///@param prefixes filter UIDs by prefix (multiple comma-separated prefixes allowed, for example: 'system,mqtt')
  @Get(path: '/channel-types')
  Future<chopper.Response<List<ChannelTypeDTO>>> _channelTypesGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('prefixes') String? prefixes,
  });

  ///Gets channel type by UID.
  ///@param channelTypeUID channelTypeUID
  ///@param Accept-Language language
  Future<chopper.Response<ChannelTypeDTO>> channelTypesChannelTypeUIDGet({
    required String? channelTypeUID,
    String? acceptLanguage,
  }) {
    generatedMapping.putIfAbsent(
        ChannelTypeDTO, () => ChannelTypeDTO.fromJsonFactory);

    return _channelTypesChannelTypeUIDGet(
        channelTypeUID: channelTypeUID, acceptLanguage: acceptLanguage);
  }

  ///Gets channel type by UID.
  ///@param channelTypeUID channelTypeUID
  ///@param Accept-Language language
  @Get(path: '/channel-types/{channelTypeUID}')
  Future<chopper.Response<ChannelTypeDTO>> _channelTypesChannelTypeUIDGet({
    @Path('channelTypeUID') required String? channelTypeUID,
    @Header('Accept-Language') String? acceptLanguage,
  });

  ///Gets the item types the given trigger channel type UID can be linked to.
  ///@param channelTypeUID channelTypeUID
  Future<chopper.Response<List<String>>>
      channelTypesChannelTypeUIDLinkableItemTypesGet(
          {required String? channelTypeUID}) {
    return _channelTypesChannelTypeUIDLinkableItemTypesGet(
        channelTypeUID: channelTypeUID);
  }

  ///Gets the item types the given trigger channel type UID can be linked to.
  ///@param channelTypeUID channelTypeUID
  @Get(path: '/channel-types/{channelTypeUID}/linkableItemTypes')
  Future<chopper.Response<List<String>>>
      _channelTypesChannelTypeUIDLinkableItemTypesGet(
          {@Path('channelTypeUID') required String? channelTypeUID});

  ///Gets all available config descriptions.
  ///@param Accept-Language language
  ///@param scheme scheme filter
  Future<chopper.Response<List<ConfigDescriptionDTO>>> configDescriptionsGet({
    String? acceptLanguage,
    String? scheme,
  }) {
    generatedMapping.putIfAbsent(
        ConfigDescriptionDTO, () => ConfigDescriptionDTO.fromJsonFactory);

    return _configDescriptionsGet(
        acceptLanguage: acceptLanguage, scheme: scheme);
  }

  ///Gets all available config descriptions.
  ///@param Accept-Language language
  ///@param scheme scheme filter
  @Get(path: '/config-descriptions')
  Future<chopper.Response<List<ConfigDescriptionDTO>>> _configDescriptionsGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('scheme') String? scheme,
  });

  ///Gets a config description by URI.
  ///@param Accept-Language language
  ///@param uri uri
  Future<chopper.Response<ConfigDescriptionDTO>> configDescriptionsUriGet({
    String? acceptLanguage,
    required String? uri,
  }) {
    generatedMapping.putIfAbsent(
        ConfigDescriptionDTO, () => ConfigDescriptionDTO.fromJsonFactory);

    return _configDescriptionsUriGet(acceptLanguage: acceptLanguage, uri: uri);
  }

  ///Gets a config description by URI.
  ///@param Accept-Language language
  ///@param uri uri
  @Get(path: '/config-descriptions/{uri}')
  Future<chopper.Response<ConfigDescriptionDTO>> _configDescriptionsUriGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('uri') required String? uri,
  });

  ///Gets all bindings that support discovery.
  Future<chopper.Response<List<String>>> discoveryGet() {
    return _discoveryGet();
  }

  ///Gets all bindings that support discovery.
  @Get(path: '/discovery')
  Future<chopper.Response<List<String>>> _discoveryGet();

  ///Starts asynchronous discovery process for a binding and returns the timeout in seconds of the discovery operation.
  ///@param bindingId bindingId
  Future<chopper.Response<int>> discoveryBindingsBindingIdScanPost(
      {required String? bindingId}) {
    return _discoveryBindingsBindingIdScanPost(bindingId: bindingId);
  }

  ///Starts asynchronous discovery process for a binding and returns the timeout in seconds of the discovery operation.
  ///@param bindingId bindingId
  @Post(
    path: '/discovery/bindings/{bindingId}/scan',
    optionalBody: true,
  )
  Future<chopper.Response<int>> _discoveryBindingsBindingIdScanPost(
      {@Path('bindingId') required String? bindingId});

  ///Approves the discovery result by adding the thing to the registry.
  ///@param Accept-Language language
  ///@param thingUID thingUID
  ///@param newThingId new thing ID
  Future<chopper.Response> inboxThingUIDApprovePost({
    String? acceptLanguage,
    required String? thingUID,
    String? newThingId,
    required String? body,
  }) {
    return _inboxThingUIDApprovePost(
        acceptLanguage: acceptLanguage,
        thingUID: thingUID,
        newThingId: newThingId,
        body: body);
  }

  ///Approves the discovery result by adding the thing to the registry.
  ///@param Accept-Language language
  ///@param thingUID thingUID
  ///@param newThingId new thing ID
  @Post(
    path: '/inbox/{thingUID}/approve',
    optionalBody: true,
  )
  Future<chopper.Response> _inboxThingUIDApprovePost({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('thingUID') required String? thingUID,
    @Query('newThingId') String? newThingId,
    @Body() required String? body,
  });

  ///Removes the discovery result from the inbox.
  ///@param thingUID thingUID
  Future<chopper.Response> inboxThingUIDDelete({required String? thingUID}) {
    return _inboxThingUIDDelete(thingUID: thingUID);
  }

  ///Removes the discovery result from the inbox.
  ///@param thingUID thingUID
  @Delete(path: '/inbox/{thingUID}')
  Future<chopper.Response> _inboxThingUIDDelete(
      {@Path('thingUID') required String? thingUID});

  ///Get all discovered things.
  Future<chopper.Response<List<DiscoveryResultDTO>>> inboxGet() {
    generatedMapping.putIfAbsent(
        DiscoveryResultDTO, () => DiscoveryResultDTO.fromJsonFactory);

    return _inboxGet();
  }

  ///Get all discovered things.
  @Get(path: '/inbox')
  Future<chopper.Response<List<DiscoveryResultDTO>>> _inboxGet();

  ///Flags a discovery result as ignored for further processing.
  ///@param thingUID thingUID
  Future<chopper.Response> inboxThingUIDIgnorePost(
      {required String? thingUID}) {
    return _inboxThingUIDIgnorePost(thingUID: thingUID);
  }

  ///Flags a discovery result as ignored for further processing.
  ///@param thingUID thingUID
  @Post(
    path: '/inbox/{thingUID}/ignore',
    optionalBody: true,
  )
  Future<chopper.Response> _inboxThingUIDIgnorePost(
      {@Path('thingUID') required String? thingUID});

  ///Removes ignore flag from a discovery result.
  ///@param thingUID thingUID
  Future<chopper.Response> inboxThingUIDUnignorePost(
      {required String? thingUID}) {
    return _inboxThingUIDUnignorePost(thingUID: thingUID);
  }

  ///Removes ignore flag from a discovery result.
  ///@param thingUID thingUID
  @Post(
    path: '/inbox/{thingUID}/unignore',
    optionalBody: true,
  )
  Future<chopper.Response> _inboxThingUIDUnignorePost(
      {@Path('thingUID') required String? thingUID});

  ///Adds a new member to a group item.
  ///@param itemName item name
  ///@param memberItemName member item name
  Future<chopper.Response> itemsItemNameMembersMemberItemNamePut({
    required String? itemName,
    required String? memberItemName,
  }) {
    return _itemsItemNameMembersMemberItemNamePut(
        itemName: itemName, memberItemName: memberItemName);
  }

  ///Adds a new member to a group item.
  ///@param itemName item name
  ///@param memberItemName member item name
  @Put(
    path: '/items/{itemName}/members/{memberItemName}',
    optionalBody: true,
  )
  Future<chopper.Response> _itemsItemNameMembersMemberItemNamePut({
    @Path('itemName') required String? itemName,
    @Path('memberItemName') required String? memberItemName,
  });

  ///Removes an existing member from a group item.
  ///@param itemName item name
  ///@param memberItemName member item name
  Future<chopper.Response> itemsItemNameMembersMemberItemNameDelete({
    required String? itemName,
    required String? memberItemName,
  }) {
    return _itemsItemNameMembersMemberItemNameDelete(
        itemName: itemName, memberItemName: memberItemName);
  }

  ///Removes an existing member from a group item.
  ///@param itemName item name
  ///@param memberItemName member item name
  @Delete(path: '/items/{itemName}/members/{memberItemName}')
  Future<chopper.Response> _itemsItemNameMembersMemberItemNameDelete({
    @Path('itemName') required String? itemName,
    @Path('memberItemName') required String? memberItemName,
  });

  ///Adds metadata to an item.
  ///@param itemname item name
  ///@param namespace namespace
  Future<chopper.Response> itemsItemnameMetadataNamespacePut({
    required String? itemname,
    required String? namespace,
    required MetadataDTO? body,
  }) {
    return _itemsItemnameMetadataNamespacePut(
        itemname: itemname, namespace: namespace, body: body);
  }

  ///Adds metadata to an item.
  ///@param itemname item name
  ///@param namespace namespace
  @Put(
    path: '/items/{itemname}/metadata/{namespace}',
    optionalBody: true,
  )
  Future<chopper.Response> _itemsItemnameMetadataNamespacePut({
    @Path('itemname') required String? itemname,
    @Path('namespace') required String? namespace,
    @Body() required MetadataDTO? body,
  });

  ///Removes metadata from an item.
  ///@param itemname item name
  ///@param namespace namespace
  Future<chopper.Response> itemsItemnameMetadataNamespaceDelete({
    required String? itemname,
    required String? namespace,
  }) {
    return _itemsItemnameMetadataNamespaceDelete(
        itemname: itemname, namespace: namespace);
  }

  ///Removes metadata from an item.
  ///@param itemname item name
  ///@param namespace namespace
  @Delete(path: '/items/{itemname}/metadata/{namespace}')
  Future<chopper.Response> _itemsItemnameMetadataNamespaceDelete({
    @Path('itemname') required String? itemname,
    @Path('namespace') required String? namespace,
  });

  ///Adds a tag to an item.
  ///@param itemname item name
  ///@param tag tag
  Future<chopper.Response> itemsItemnameTagsTagPut({
    required String? itemname,
    required String? tag,
  }) {
    return _itemsItemnameTagsTagPut(itemname: itemname, tag: tag);
  }

  ///Adds a tag to an item.
  ///@param itemname item name
  ///@param tag tag
  @Put(
    path: '/items/{itemname}/tags/{tag}',
    optionalBody: true,
  )
  Future<chopper.Response> _itemsItemnameTagsTagPut({
    @Path('itemname') required String? itemname,
    @Path('tag') required String? tag,
  });

  ///Removes a tag from an item.
  ///@param itemname item name
  ///@param tag tag
  Future<chopper.Response> itemsItemnameTagsTagDelete({
    required String? itemname,
    required String? tag,
  }) {
    return _itemsItemnameTagsTagDelete(itemname: itemname, tag: tag);
  }

  ///Removes a tag from an item.
  ///@param itemname item name
  ///@param tag tag
  @Delete(path: '/items/{itemname}/tags/{tag}')
  Future<chopper.Response> _itemsItemnameTagsTagDelete({
    @Path('itemname') required String? itemname,
    @Path('tag') required String? tag,
  });

  ///Gets a single item.
  ///@param Accept-Language language
  ///@param metadata metadata selector - a comma separated list or a regular expression (suppressed if no value given)
  ///@param recursive get member items if the item is a group item
  ///@param itemname item name
  Future<chopper.Response<EnrichedItemDTO>> itemsItemnameGet({
    String? acceptLanguage,
    String? metadata,
    bool? recursive,
    required String? itemname,
  }) {
    generatedMapping.putIfAbsent(
        EnrichedItemDTO, () => EnrichedItemDTO.fromJsonFactory);

    return _itemsItemnameGet(
        acceptLanguage: acceptLanguage,
        metadata: metadata,
        recursive: recursive,
        itemname: itemname);
  }

  ///Gets a single item.
  ///@param Accept-Language language
  ///@param metadata metadata selector - a comma separated list or a regular expression (suppressed if no value given)
  ///@param recursive get member items if the item is a group item
  ///@param itemname item name
  @Get(path: '/items/{itemname}')
  Future<chopper.Response<EnrichedItemDTO>> _itemsItemnameGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('metadata') String? metadata,
    @Query('recursive') bool? recursive,
    @Path('itemname') required String? itemname,
  });

  ///Adds a new item to the registry or updates the existing item.
  ///@param Accept-Language language
  ///@param itemname item name
  Future<chopper.Response<EnrichedItemDTO>> itemsItemnamePut({
    String? acceptLanguage,
    required String? itemname,
    required GroupItemDTO? body,
  }) {
    generatedMapping.putIfAbsent(
        EnrichedItemDTO, () => EnrichedItemDTO.fromJsonFactory);

    return _itemsItemnamePut(
        acceptLanguage: acceptLanguage, itemname: itemname, body: body);
  }

  ///Adds a new item to the registry or updates the existing item.
  ///@param Accept-Language language
  ///@param itemname item name
  @Put(
    path: '/items/{itemname}',
    optionalBody: true,
  )
  Future<chopper.Response<EnrichedItemDTO>> _itemsItemnamePut({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('itemname') required String? itemname,
    @Body() required GroupItemDTO? body,
  });

  ///Sends a command to an item.
  ///@param itemname item name
  Future<chopper.Response> itemsItemnamePost({
    required String? itemname,
    required String? body,
  }) {
    return _itemsItemnamePost(itemname: itemname, body: body);
  }

  ///Sends a command to an item.
  ///@param itemname item name
  @Post(
    path: '/items/{itemname}',
    optionalBody: true,
  )
  Future<chopper.Response> _itemsItemnamePost({
    @Path('itemname') required String? itemname,
    @Body() required String? body,
  });

  ///Removes an item from the registry.
  ///@param itemname item name
  Future<chopper.Response> itemsItemnameDelete({required String? itemname}) {
    return _itemsItemnameDelete(itemname: itemname);
  }

  ///Removes an item from the registry.
  ///@param itemname item name
  @Delete(path: '/items/{itemname}')
  Future<chopper.Response> _itemsItemnameDelete(
      {@Path('itemname') required String? itemname});

  ///Get all available items.
  ///@param Accept-Language language
  ///@param type item type filter
  ///@param tags item tag filter
  ///@param metadata metadata selector - a comma separated list or a regular expression (suppressed if no value given)
  ///@param recursive get member items recursively
  ///@param fields limit output to the given fields (comma separated)
  Future<chopper.Response<List<EnrichedItemDTO>>> itemsGet({
    String? acceptLanguage,
    String? type,
    String? tags,
    String? metadata,
    bool? recursive,
    String? fields,
  }) {
    generatedMapping.putIfAbsent(
        EnrichedItemDTO, () => EnrichedItemDTO.fromJsonFactory);

    return _itemsGet(
        acceptLanguage: acceptLanguage,
        type: type,
        tags: tags,
        metadata: metadata,
        recursive: recursive,
        fields: fields);
  }

  ///Get all available items.
  ///@param Accept-Language language
  ///@param type item type filter
  ///@param tags item tag filter
  ///@param metadata metadata selector - a comma separated list or a regular expression (suppressed if no value given)
  ///@param recursive get member items recursively
  ///@param fields limit output to the given fields (comma separated)
  @Get(path: '/items')
  Future<chopper.Response<List<EnrichedItemDTO>>> _itemsGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('type') String? type,
    @Query('tags') String? tags,
    @Query('metadata') String? metadata,
    @Query('recursive') bool? recursive,
    @Query('fields') String? fields,
  });

  ///Adds a list of items to the registry or updates the existing items.
  Future<chopper.Response<String>> itemsPut(
      {required List<GroupItemDTO>? body}) {
    return _itemsPut(body: body);
  }

  ///Adds a list of items to the registry or updates the existing items.
  @Put(
    path: '/items',
    optionalBody: true,
  )
  Future<chopper.Response<String>> _itemsPut(
      {@Body() required List<GroupItemDTO>? body});

  ///Gets the state of an item.
  ///@param itemname item name
  Future<chopper.Response<String>> itemsItemnameStateGet(
      {required String? itemname}) {
    return _itemsItemnameStateGet(itemname: itemname);
  }

  ///Gets the state of an item.
  ///@param itemname item name
  @Get(path: '/items/{itemname}/state')
  Future<chopper.Response<String>> _itemsItemnameStateGet(
      {@Path('itemname') required String? itemname});

  ///Updates the state of an item.
  ///@param Accept-Language language
  ///@param itemname item name
  Future<chopper.Response> itemsItemnameStatePut({
    String? acceptLanguage,
    required String? itemname,
    required String? body,
  }) {
    return _itemsItemnameStatePut(
        acceptLanguage: acceptLanguage, itemname: itemname, body: body);
  }

  ///Updates the state of an item.
  ///@param Accept-Language language
  ///@param itemname item name
  @Put(
    path: '/items/{itemname}/state',
    optionalBody: true,
  )
  Future<chopper.Response> _itemsItemnameStatePut({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('itemname') required String? itemname,
    @Body() required String? body,
  });

  ///Gets the item which defines the requested semantics of an item.
  ///@param Accept-Language language
  ///@param itemName item name
  ///@param semanticClass semantic class
  Future<chopper.Response> itemsItemNameSemanticSemanticClassGet({
    String? acceptLanguage,
    required String? itemName,
    required String? semanticClass,
  }) {
    return _itemsItemNameSemanticSemanticClassGet(
        acceptLanguage: acceptLanguage,
        itemName: itemName,
        semanticClass: semanticClass);
  }

  ///Gets the item which defines the requested semantics of an item.
  ///@param Accept-Language language
  ///@param itemName item name
  ///@param semanticClass semantic class
  @Get(path: '/items/{itemName}/semantic/{semanticClass}')
  Future<chopper.Response> _itemsItemNameSemanticSemanticClassGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('itemName') required String? itemName,
    @Path('semanticClass') required String? semanticClass,
  });

  ///Remove unused/orphaned metadata.
  Future<chopper.Response> itemsMetadataPurgePost() {
    return _itemsMetadataPurgePost();
  }

  ///Remove unused/orphaned metadata.
  @Post(
    path: '/items/metadata/purge',
    optionalBody: true,
  )
  Future<chopper.Response> _itemsMetadataPurgePost();

  ///Gets all available links.
  ///@param channelUID filter by channel UID
  ///@param itemName filter by item name
  Future<chopper.Response<List<EnrichedItemChannelLinkDTO>>> linksGet({
    String? channelUID,
    String? itemName,
  }) {
    generatedMapping.putIfAbsent(EnrichedItemChannelLinkDTO,
        () => EnrichedItemChannelLinkDTO.fromJsonFactory);

    return _linksGet(channelUID: channelUID, itemName: itemName);
  }

  ///Gets all available links.
  ///@param channelUID filter by channel UID
  ///@param itemName filter by item name
  @Get(path: '/links')
  Future<chopper.Response<List<EnrichedItemChannelLinkDTO>>> _linksGet({
    @Query('channelUID') String? channelUID,
    @Query('itemName') String? itemName,
  });

  ///Retrieves an individual link.
  ///@param itemName item name
  ///@param channelUID channel UID
  Future<chopper.Response<EnrichedItemChannelLinkDTO>>
      linksItemNameChannelUIDGet({
    required String? itemName,
    required String? channelUID,
  }) {
    generatedMapping.putIfAbsent(EnrichedItemChannelLinkDTO,
        () => EnrichedItemChannelLinkDTO.fromJsonFactory);

    return _linksItemNameChannelUIDGet(
        itemName: itemName, channelUID: channelUID);
  }

  ///Retrieves an individual link.
  ///@param itemName item name
  ///@param channelUID channel UID
  @Get(path: '/links/{itemName}/{channelUID}')
  Future<chopper.Response<EnrichedItemChannelLinkDTO>>
      _linksItemNameChannelUIDGet({
    @Path('itemName') required String? itemName,
    @Path('channelUID') required String? channelUID,
  });

  ///Links an item to a channel.
  ///@param itemName itemName
  ///@param channelUID channelUID
  Future<chopper.Response> linksItemNameChannelUIDPut({
    required String? itemName,
    required String? channelUID,
    required ItemChannelLinkDTO? body,
  }) {
    return _linksItemNameChannelUIDPut(
        itemName: itemName, channelUID: channelUID, body: body);
  }

  ///Links an item to a channel.
  ///@param itemName itemName
  ///@param channelUID channelUID
  @Put(
    path: '/links/{itemName}/{channelUID}',
    optionalBody: true,
  )
  Future<chopper.Response> _linksItemNameChannelUIDPut({
    @Path('itemName') required String? itemName,
    @Path('channelUID') required String? channelUID,
    @Body() required ItemChannelLinkDTO? body,
  });

  ///Unlinks an item from a channel.
  ///@param itemName itemName
  ///@param channelUID channelUID
  Future<chopper.Response> linksItemNameChannelUIDDelete({
    required String? itemName,
    required String? channelUID,
  }) {
    return _linksItemNameChannelUIDDelete(
        itemName: itemName, channelUID: channelUID);
  }

  ///Unlinks an item from a channel.
  ///@param itemName itemName
  ///@param channelUID channelUID
  @Delete(path: '/links/{itemName}/{channelUID}')
  Future<chopper.Response> _linksItemNameChannelUIDDelete({
    @Path('itemName') required String? itemName,
    @Path('channelUID') required String? channelUID,
  });

  ///Remove unused/orphaned links.
  Future<chopper.Response> linksPurgePost() {
    return _linksPurgePost();
  }

  ///Remove unused/orphaned links.
  @Post(
    path: '/links/purge',
    optionalBody: true,
  )
  Future<chopper.Response> _linksPurgePost();

  ///Delete all links that refer to an item or thing.
  ///@param object item name or thing UID
  Future<chopper.Response> linksObjectDelete({required String? object}) {
    return _linksObjectDelete(object: object);
  }

  ///Delete all links that refer to an item or thing.
  ///@param object item name or thing UID
  @Delete(path: '/links/{object}')
  Future<chopper.Response> _linksObjectDelete(
      {@Path('object') required String? object});

  ///Gets item persistence data from the persistence service.
  ///@param serviceId Id of the persistence service. If not provided the default service will be used
  ///@param itemname The item name
  ///@param starttime Start time of the data to return. Will default to 1 day before endtime. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  ///@param endtime End time of the data to return. Will default to current time. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  ///@param page Page number of data to return. This parameter will enable paging.
  ///@param pagelength The length of each page.
  ///@param boundary Gets one value before and after the requested period.
  Future<chopper.Response<ItemHistoryDTO>> persistenceItemsItemnameGet({
    String? serviceId,
    required String? itemname,
    String? starttime,
    String? endtime,
    int? page,
    int? pagelength,
    bool? boundary,
  }) {
    generatedMapping.putIfAbsent(
        ItemHistoryDTO, () => ItemHistoryDTO.fromJsonFactory);

    return _persistenceItemsItemnameGet(
        serviceId: serviceId,
        itemname: itemname,
        starttime: starttime,
        endtime: endtime,
        page: page,
        pagelength: pagelength,
        boundary: boundary);
  }

  ///Gets item persistence data from the persistence service.
  ///@param serviceId Id of the persistence service. If not provided the default service will be used
  ///@param itemname The item name
  ///@param starttime Start time of the data to return. Will default to 1 day before endtime. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  ///@param endtime End time of the data to return. Will default to current time. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  ///@param page Page number of data to return. This parameter will enable paging.
  ///@param pagelength The length of each page.
  ///@param boundary Gets one value before and after the requested period.
  @Get(path: '/persistence/items/{itemname}')
  Future<chopper.Response<ItemHistoryDTO>> _persistenceItemsItemnameGet({
    @Query('serviceId') String? serviceId,
    @Path('itemname') required String? itemname,
    @Query('starttime') String? starttime,
    @Query('endtime') String? endtime,
    @Query('page') int? page,
    @Query('pagelength') int? pagelength,
    @Query('boundary') bool? boundary,
  });

  ///Stores item persistence data into the persistence service.
  ///@param serviceId Id of the persistence service. If not provided the default service will be used
  ///@param itemname The item name.
  ///@param time Time of the data to be stored. Will default to current time. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  ///@param state The state to store.
  Future<chopper.Response> persistenceItemsItemnamePut({
    String? serviceId,
    required String? itemname,
    required String? time,
    required String? state,
  }) {
    return _persistenceItemsItemnamePut(
        serviceId: serviceId, itemname: itemname, time: time, state: state);
  }

  ///Stores item persistence data into the persistence service.
  ///@param serviceId Id of the persistence service. If not provided the default service will be used
  ///@param itemname The item name.
  ///@param time Time of the data to be stored. Will default to current time. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  ///@param state The state to store.
  @Put(
    path: '/persistence/items/{itemname}',
    optionalBody: true,
  )
  Future<chopper.Response> _persistenceItemsItemnamePut({
    @Query('serviceId') String? serviceId,
    @Path('itemname') required String? itemname,
    @Query('time') required String? time,
    @Query('state') required String? state,
  });

  ///Deletes item persistence data from a specific persistence service in a given time range.
  ///@param serviceId Id of the persistence service.
  ///@param itemname The item name.
  ///@param starttime Start of the time range to be deleted. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  ///@param endtime End of the time range to be deleted. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  Future<chopper.Response<List<String>>> persistenceItemsItemnameDelete({
    required String? serviceId,
    required String? itemname,
    required String? starttime,
    required String? endtime,
  }) {
    return _persistenceItemsItemnameDelete(
        serviceId: serviceId,
        itemname: itemname,
        starttime: starttime,
        endtime: endtime);
  }

  ///Deletes item persistence data from a specific persistence service in a given time range.
  ///@param serviceId Id of the persistence service.
  ///@param itemname The item name.
  ///@param starttime Start of the time range to be deleted. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  ///@param endtime End of the time range to be deleted. [yyyy-MM-dd'T'HH:mm:ss.SSSZ]
  @Delete(path: '/persistence/items/{itemname}')
  Future<chopper.Response<List<String>>> _persistenceItemsItemnameDelete({
    @Query('serviceId') required String? serviceId,
    @Path('itemname') required String? itemname,
    @Query('starttime') required String? starttime,
    @Query('endtime') required String? endtime,
  });

  ///Gets a list of items available via a specific persistence service.
  ///@param serviceId Id of the persistence service. If not provided the default service will be used
  Future<chopper.Response<List<PersistenceItemInfo>>> persistenceItemsGet(
      {String? serviceId}) {
    generatedMapping.putIfAbsent(
        PersistenceItemInfo, () => PersistenceItemInfo.fromJsonFactory);

    return _persistenceItemsGet(serviceId: serviceId);
  }

  ///Gets a list of items available via a specific persistence service.
  ///@param serviceId Id of the persistence service. If not provided the default service will be used
  @Get(path: '/persistence/items')
  Future<chopper.Response<List<PersistenceItemInfo>>> _persistenceItemsGet(
      {@Query('serviceId') String? serviceId});

  ///Gets a list of persistence services.
  ///@param Accept-Language language
  Future<chopper.Response<List<PersistenceServiceDTO>>> persistenceGet(
      {String? acceptLanguage}) {
    generatedMapping.putIfAbsent(
        PersistenceServiceDTO, () => PersistenceServiceDTO.fromJsonFactory);

    return _persistenceGet(acceptLanguage: acceptLanguage);
  }

  ///Gets a list of persistence services.
  ///@param Accept-Language language
  @Get(path: '/persistence')
  Future<chopper.Response<List<PersistenceServiceDTO>>> _persistenceGet(
      {@Header('Accept-Language') String? acceptLanguage});

  ///Gets all available profile types.
  ///@param Accept-Language language
  ///@param channelTypeUID channel type filter
  ///@param itemType item type filter
  Future<chopper.Response<List<ProfileTypeDTO>>> profileTypesGet({
    String? acceptLanguage,
    String? channelTypeUID,
    String? itemType,
  }) {
    generatedMapping.putIfAbsent(
        ProfileTypeDTO, () => ProfileTypeDTO.fromJsonFactory);

    return _profileTypesGet(
        acceptLanguage: acceptLanguage,
        channelTypeUID: channelTypeUID,
        itemType: itemType);
  }

  ///Gets all available profile types.
  ///@param Accept-Language language
  ///@param channelTypeUID channel type filter
  ///@param itemType item type filter
  @Get(path: '/profile-types')
  Future<chopper.Response<List<ProfileTypeDTO>>> _profileTypesGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('channelTypeUID') String? channelTypeUID,
    @Query('itemType') String? itemType,
  });

  ///Get service configuration for given service ID.
  ///@param serviceId service ID
  Future<chopper.Response<String>> servicesServiceIdConfigGet(
      {required String? serviceId}) {
    return _servicesServiceIdConfigGet(serviceId: serviceId);
  }

  ///Get service configuration for given service ID.
  ///@param serviceId service ID
  @Get(path: '/services/{serviceId}/config')
  Future<chopper.Response<String>> _servicesServiceIdConfigGet(
      {@Path('serviceId') required String? serviceId});

  ///Updates a service configuration for given service ID and returns the old configuration.
  ///@param Accept-Language language
  ///@param serviceId service ID
  Future<chopper.Response<String>> servicesServiceIdConfigPut({
    String? acceptLanguage,
    required String? serviceId,
    required Object? body,
  }) {
    return _servicesServiceIdConfigPut(
        acceptLanguage: acceptLanguage, serviceId: serviceId, body: body);
  }

  ///Updates a service configuration for given service ID and returns the old configuration.
  ///@param Accept-Language language
  ///@param serviceId service ID
  @Put(
    path: '/services/{serviceId}/config',
    optionalBody: true,
  )
  Future<chopper.Response<String>> _servicesServiceIdConfigPut({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('serviceId') required String? serviceId,
    @Body() required Object? body,
  });

  ///Deletes a service configuration for given service ID and returns the old configuration.
  ///@param serviceId service ID
  Future<chopper.Response<String>> servicesServiceIdConfigDelete(
      {required String? serviceId}) {
    return _servicesServiceIdConfigDelete(serviceId: serviceId);
  }

  ///Deletes a service configuration for given service ID and returns the old configuration.
  ///@param serviceId service ID
  @Delete(path: '/services/{serviceId}/config')
  Future<chopper.Response<String>> _servicesServiceIdConfigDelete(
      {@Path('serviceId') required String? serviceId});

  ///Get all configurable services.
  ///@param Accept-Language language
  Future<chopper.Response<List<ConfigurableServiceDTO>>> servicesGet(
      {String? acceptLanguage}) {
    generatedMapping.putIfAbsent(
        ConfigurableServiceDTO, () => ConfigurableServiceDTO.fromJsonFactory);

    return _servicesGet(acceptLanguage: acceptLanguage);
  }

  ///Get all configurable services.
  ///@param Accept-Language language
  @Get(path: '/services')
  Future<chopper.Response<List<ConfigurableServiceDTO>>> _servicesGet(
      {@Header('Accept-Language') String? acceptLanguage});

  ///Get configurable service for given service ID.
  ///@param Accept-Language language
  ///@param serviceId service ID
  Future<chopper.Response<ConfigurableServiceDTO>> servicesServiceIdGet({
    String? acceptLanguage,
    required String? serviceId,
  }) {
    generatedMapping.putIfAbsent(
        ConfigurableServiceDTO, () => ConfigurableServiceDTO.fromJsonFactory);

    return _servicesServiceIdGet(
        acceptLanguage: acceptLanguage, serviceId: serviceId);
  }

  ///Get configurable service for given service ID.
  ///@param Accept-Language language
  ///@param serviceId service ID
  @Get(path: '/services/{serviceId}')
  Future<chopper.Response<ConfigurableServiceDTO>> _servicesServiceIdGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('serviceId') required String? serviceId,
  });

  ///Get existing multiple context service configurations for the given factory PID.
  ///@param Accept-Language language
  ///@param serviceId service ID
  Future<chopper.Response<List<ConfigurableServiceDTO>>>
      servicesServiceIdContextsGet({
    String? acceptLanguage,
    required String? serviceId,
  }) {
    generatedMapping.putIfAbsent(
        ConfigurableServiceDTO, () => ConfigurableServiceDTO.fromJsonFactory);

    return _servicesServiceIdContextsGet(
        acceptLanguage: acceptLanguage, serviceId: serviceId);
  }

  ///Get existing multiple context service configurations for the given factory PID.
  ///@param Accept-Language language
  ///@param serviceId service ID
  @Get(path: '/services/{serviceId}/contexts')
  Future<chopper.Response<List<ConfigurableServiceDTO>>>
      _servicesServiceIdContextsGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('serviceId') required String? serviceId,
  });

  ///Get all available things.
  ///@param Accept-Language language
  ///@param summary summary fields only
  Future<chopper.Response<List<EnrichedThingDTO>>> thingsGet({
    String? acceptLanguage,
    bool? summary,
  }) {
    generatedMapping.putIfAbsent(
        EnrichedThingDTO, () => EnrichedThingDTO.fromJsonFactory);

    return _thingsGet(acceptLanguage: acceptLanguage, summary: summary);
  }

  ///Get all available things.
  ///@param Accept-Language language
  ///@param summary summary fields only
  @Get(path: '/things')
  Future<chopper.Response<List<EnrichedThingDTO>>> _thingsGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('summary') bool? summary,
  });

  ///Creates a new thing and adds it to the registry.
  ///@param Accept-Language language
  Future<chopper.Response<EnrichedThingDTO>> thingsPost({
    String? acceptLanguage,
    required ThingDTO? body,
  }) {
    generatedMapping.putIfAbsent(
        EnrichedThingDTO, () => EnrichedThingDTO.fromJsonFactory);

    return _thingsPost(acceptLanguage: acceptLanguage, body: body);
  }

  ///Creates a new thing and adds it to the registry.
  ///@param Accept-Language language
  @Post(
    path: '/things',
    optionalBody: true,
  )
  Future<chopper.Response<EnrichedThingDTO>> _thingsPost({
    @Header('Accept-Language') String? acceptLanguage,
    @Body() required ThingDTO? body,
  });

  ///Gets thing by UID.
  ///@param Accept-Language language
  ///@param thingUID thingUID
  Future<chopper.Response<EnrichedThingDTO>> thingsThingUIDGet({
    String? acceptLanguage,
    required String? thingUID,
  }) {
    generatedMapping.putIfAbsent(
        EnrichedThingDTO, () => EnrichedThingDTO.fromJsonFactory);

    return _thingsThingUIDGet(
        acceptLanguage: acceptLanguage, thingUID: thingUID);
  }

  ///Gets thing by UID.
  ///@param Accept-Language language
  ///@param thingUID thingUID
  @Get(path: '/things/{thingUID}')
  Future<chopper.Response<EnrichedThingDTO>> _thingsThingUIDGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('thingUID') required String? thingUID,
  });

  ///Updates a thing.
  ///@param Accept-Language language
  ///@param thingUID thingUID
  Future<chopper.Response<EnrichedThingDTO>> thingsThingUIDPut({
    String? acceptLanguage,
    required String? thingUID,
    required ThingDTO? body,
  }) {
    generatedMapping.putIfAbsent(
        EnrichedThingDTO, () => EnrichedThingDTO.fromJsonFactory);

    return _thingsThingUIDPut(
        acceptLanguage: acceptLanguage, thingUID: thingUID, body: body);
  }

  ///Updates a thing.
  ///@param Accept-Language language
  ///@param thingUID thingUID
  @Put(
    path: '/things/{thingUID}',
    optionalBody: true,
  )
  Future<chopper.Response<EnrichedThingDTO>> _thingsThingUIDPut({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('thingUID') required String? thingUID,
    @Body() required ThingDTO? body,
  });

  ///Removes a thing from the registry. Set 'force' to __true__ if you want the thing to be removed immediately.
  ///@param Accept-Language language
  ///@param thingUID thingUID
  ///@param force force
  Future<chopper.Response> thingsThingUIDDelete({
    String? acceptLanguage,
    required String? thingUID,
    bool? force,
  }) {
    return _thingsThingUIDDelete(
        acceptLanguage: acceptLanguage, thingUID: thingUID, force: force);
  }

  ///Removes a thing from the registry. Set 'force' to __true__ if you want the thing to be removed immediately.
  ///@param Accept-Language language
  ///@param thingUID thingUID
  ///@param force force
  @Delete(path: '/things/{thingUID}')
  Future<chopper.Response> _thingsThingUIDDelete({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('thingUID') required String? thingUID,
    @Query('force') bool? force,
  });

  ///Gets thing config status.
  ///@param Accept-Language language
  ///@param thingUID thing
  Future<chopper.Response<List<ConfigStatusMessage>>>
      thingsThingUIDConfigStatusGet({
    String? acceptLanguage,
    required String? thingUID,
  }) {
    generatedMapping.putIfAbsent(
        ConfigStatusMessage, () => ConfigStatusMessage.fromJsonFactory);

    return _thingsThingUIDConfigStatusGet(
        acceptLanguage: acceptLanguage, thingUID: thingUID);
  }

  ///Gets thing config status.
  ///@param Accept-Language language
  ///@param thingUID thing
  @Get(path: '/things/{thingUID}/config/status')
  Future<chopper.Response<List<ConfigStatusMessage>>>
      _thingsThingUIDConfigStatusGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('thingUID') required String? thingUID,
  });

  ///Gets thing's firmware status.
  ///@param Accept-Language language
  ///@param thingUID thing
  Future<chopper.Response<FirmwareStatusDTO>> thingsThingUIDFirmwareStatusGet({
    String? acceptLanguage,
    required String? thingUID,
  }) {
    generatedMapping.putIfAbsent(
        FirmwareStatusDTO, () => FirmwareStatusDTO.fromJsonFactory);

    return _thingsThingUIDFirmwareStatusGet(
        acceptLanguage: acceptLanguage, thingUID: thingUID);
  }

  ///Gets thing's firmware status.
  ///@param Accept-Language language
  ///@param thingUID thing
  @Get(path: '/things/{thingUID}/firmware/status')
  Future<chopper.Response<FirmwareStatusDTO>> _thingsThingUIDFirmwareStatusGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('thingUID') required String? thingUID,
  });

  ///Get all available firmwares for provided thing UID
  ///@param thingUID thingUID
  ///@param Accept-Language language
  Future<chopper.Response<List<FirmwareDTO>>> thingsThingUIDFirmwaresGet({
    required String? thingUID,
    String? acceptLanguage,
  }) {
    generatedMapping.putIfAbsent(
        FirmwareDTO, () => FirmwareDTO.fromJsonFactory);

    return _thingsThingUIDFirmwaresGet(
        thingUID: thingUID, acceptLanguage: acceptLanguage);
  }

  ///Get all available firmwares for provided thing UID
  ///@param thingUID thingUID
  ///@param Accept-Language language
  @Get(path: '/things/{thingUID}/firmwares')
  Future<chopper.Response<List<FirmwareDTO>>> _thingsThingUIDFirmwaresGet({
    @Path('thingUID') required String? thingUID,
    @Header('Accept-Language') String? acceptLanguage,
  });

  ///Gets thing status.
  ///@param Accept-Language language
  ///@param thingUID thing
  Future<chopper.Response<ThingStatusInfo>> thingsThingUIDStatusGet({
    String? acceptLanguage,
    required String? thingUID,
  }) {
    generatedMapping.putIfAbsent(
        ThingStatusInfo, () => ThingStatusInfo.fromJsonFactory);

    return _thingsThingUIDStatusGet(
        acceptLanguage: acceptLanguage, thingUID: thingUID);
  }

  ///Gets thing status.
  ///@param Accept-Language language
  ///@param thingUID thing
  @Get(path: '/things/{thingUID}/status')
  Future<chopper.Response<ThingStatusInfo>> _thingsThingUIDStatusGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('thingUID') required String? thingUID,
  });

  ///Sets the thing enabled status.
  ///@param Accept-Language language
  ///@param thingUID thing
  Future<chopper.Response<EnrichedThingDTO>> thingsThingUIDEnablePut({
    String? acceptLanguage,
    required String? thingUID,
    required String? body,
  }) {
    generatedMapping.putIfAbsent(
        EnrichedThingDTO, () => EnrichedThingDTO.fromJsonFactory);

    return _thingsThingUIDEnablePut(
        acceptLanguage: acceptLanguage, thingUID: thingUID, body: body);
  }

  ///Sets the thing enabled status.
  ///@param Accept-Language language
  ///@param thingUID thing
  @Put(
    path: '/things/{thingUID}/enable',
    optionalBody: true,
  )
  Future<chopper.Response<EnrichedThingDTO>> _thingsThingUIDEnablePut({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('thingUID') required String? thingUID,
    @Body() required String? body,
  });

  ///Updates thing's configuration.
  ///@param Accept-Language language
  ///@param thingUID thing
  Future<chopper.Response<EnrichedThingDTO>> thingsThingUIDConfigPut({
    String? acceptLanguage,
    required String? thingUID,
    required Object? body,
  }) {
    generatedMapping.putIfAbsent(
        EnrichedThingDTO, () => EnrichedThingDTO.fromJsonFactory);

    return _thingsThingUIDConfigPut(
        acceptLanguage: acceptLanguage, thingUID: thingUID, body: body);
  }

  ///Updates thing's configuration.
  ///@param Accept-Language language
  ///@param thingUID thing
  @Put(
    path: '/things/{thingUID}/config',
    optionalBody: true,
  )
  Future<chopper.Response<EnrichedThingDTO>> _thingsThingUIDConfigPut({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('thingUID') required String? thingUID,
    @Body() required Object? body,
  });

  ///Update thing firmware.
  ///@param Accept-Language language
  ///@param thingUID thing
  ///@param firmwareVersion version
  Future<chopper.Response> thingsThingUIDFirmwareFirmwareVersionPut({
    String? acceptLanguage,
    required String? thingUID,
    required String? firmwareVersion,
  }) {
    return _thingsThingUIDFirmwareFirmwareVersionPut(
        acceptLanguage: acceptLanguage,
        thingUID: thingUID,
        firmwareVersion: firmwareVersion);
  }

  ///Update thing firmware.
  ///@param Accept-Language language
  ///@param thingUID thing
  ///@param firmwareVersion version
  @Put(
    path: '/things/{thingUID}/firmware/{firmwareVersion}',
    optionalBody: true,
  )
  Future<chopper.Response> _thingsThingUIDFirmwareFirmwareVersionPut({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('thingUID') required String? thingUID,
    @Path('firmwareVersion') required String? firmwareVersion,
  });

  ///Gets all available thing types without config description, channels and properties.
  ///@param Accept-Language language
  ///@param bindingId filter by binding Id
  Future<chopper.Response<List<StrippedThingTypeDTO>>> thingTypesGet({
    String? acceptLanguage,
    String? bindingId,
  }) {
    generatedMapping.putIfAbsent(
        StrippedThingTypeDTO, () => StrippedThingTypeDTO.fromJsonFactory);

    return _thingTypesGet(acceptLanguage: acceptLanguage, bindingId: bindingId);
  }

  ///Gets all available thing types without config description, channels and properties.
  ///@param Accept-Language language
  ///@param bindingId filter by binding Id
  @Get(path: '/thing-types')
  Future<chopper.Response<List<StrippedThingTypeDTO>>> _thingTypesGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('bindingId') String? bindingId,
  });

  ///Gets thing type by UID.
  ///@param thingTypeUID thingTypeUID
  ///@param Accept-Language language
  Future<chopper.Response<ThingTypeDTO>> thingTypesThingTypeUIDGet({
    required String? thingTypeUID,
    String? acceptLanguage,
  }) {
    generatedMapping.putIfAbsent(
        ThingTypeDTO, () => ThingTypeDTO.fromJsonFactory);

    return _thingTypesThingTypeUIDGet(
        thingTypeUID: thingTypeUID, acceptLanguage: acceptLanguage);
  }

  ///Gets thing type by UID.
  ///@param thingTypeUID thingTypeUID
  ///@param Accept-Language language
  @Get(path: '/thing-types/{thingTypeUID}')
  Future<chopper.Response<ThingTypeDTO>> _thingTypesThingTypeUIDGet({
    @Path('thingTypeUID') required String? thingTypeUID,
    @Header('Accept-Language') String? acceptLanguage,
  });

  ///Gets information about the runtime, the API version and links to resources.
  Future<chopper.Response<RootBean>> get() {
    generatedMapping.putIfAbsent(RootBean, () => RootBean.fromJsonFactory);

    return _get();
  }

  ///Gets information about the runtime, the API version and links to resources.
  @Get(path: '/')
  Future<chopper.Response<RootBean>> _get();

  ///Gets information about the system.
  Future<chopper.Response<SystemInfoBean>> systeminfoGet() {
    generatedMapping.putIfAbsent(
        SystemInfoBean, () => SystemInfoBean.fromJsonFactory);

    return _systeminfoGet();
  }

  ///Gets information about the system.
  @Get(path: '/systeminfo')
  Future<chopper.Response<SystemInfoBean>> _systeminfoGet();

  ///Creates a sitemap event subscription.
  Future<chopper.Response> sitemapsEventsSubscribePost() {
    return _sitemapsEventsSubscribePost();
  }

  ///Creates a sitemap event subscription.
  @Post(
    path: '/sitemaps/events/subscribe',
    optionalBody: true,
  )
  Future<chopper.Response> _sitemapsEventsSubscribePost();

  ///Polls the data for a sitemap.
  ///@param Accept-Language language
  ///@param sitemapname sitemap name
  ///@param pageid page id
  ///@param subscriptionid subscriptionid
  ///@param includeHidden include hidden widgets
  Future<chopper.Response<PageDTO>> sitemapsSitemapnamePageidGet({
    String? acceptLanguage,
    required String? sitemapname,
    required String? pageid,
    String? subscriptionid,
    bool? includeHidden,
  }) {
    generatedMapping.putIfAbsent(PageDTO, () => PageDTO.fromJsonFactory);

    return _sitemapsSitemapnamePageidGet(
        acceptLanguage: acceptLanguage,
        sitemapname: sitemapname,
        pageid: pageid,
        subscriptionid: subscriptionid,
        includeHidden: includeHidden);
  }

  ///Polls the data for a sitemap.
  ///@param Accept-Language language
  ///@param sitemapname sitemap name
  ///@param pageid page id
  ///@param subscriptionid subscriptionid
  ///@param includeHidden include hidden widgets
  @Get(path: '/sitemaps/{sitemapname}/{pageid}')
  Future<chopper.Response<PageDTO>> _sitemapsSitemapnamePageidGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('sitemapname') required String? sitemapname,
    @Path('pageid') required String? pageid,
    @Query('subscriptionid') String? subscriptionid,
    @Query('includeHidden') bool? includeHidden,
  });

  ///Get sitemap by name.
  ///@param Accept-Language language
  ///@param sitemapname sitemap name
  ///@param type
  ///@param jsoncallback
  ///@param includeHidden include hidden widgets
  Future<chopper.Response<SitemapDTO>> sitemapsSitemapnameGet({
    String? acceptLanguage,
    required String? sitemapname,
    String? type,
    String? jsoncallback,
    bool? includeHidden,
  }) {
    generatedMapping.putIfAbsent(SitemapDTO, () => SitemapDTO.fromJsonFactory);

    return _sitemapsSitemapnameGet(
        acceptLanguage: acceptLanguage,
        sitemapname: sitemapname,
        type: type,
        jsoncallback: jsoncallback,
        includeHidden: includeHidden);
  }

  ///Get sitemap by name.
  ///@param Accept-Language language
  ///@param sitemapname sitemap name
  ///@param type
  ///@param jsoncallback
  ///@param includeHidden include hidden widgets
  @Get(path: '/sitemaps/{sitemapname}')
  Future<chopper.Response<SitemapDTO>> _sitemapsSitemapnameGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('sitemapname') required String? sitemapname,
    @Query('type') String? type,
    @Query('jsoncallback') String? jsoncallback,
    @Query('includeHidden') bool? includeHidden,
  });

  ///Get sitemap events.
  ///@param subscriptionid subscription id
  ///@param sitemap sitemap name
  ///@param pageid page id
  Future<chopper.Response> sitemapsEventsSubscriptionidGet({
    required String? subscriptionid,
    String? sitemap,
    String? pageid,
  }) {
    return _sitemapsEventsSubscriptionidGet(
        subscriptionid: subscriptionid, sitemap: sitemap, pageid: pageid);
  }

  ///Get sitemap events.
  ///@param subscriptionid subscription id
  ///@param sitemap sitemap name
  ///@param pageid page id
  @Get(path: '/sitemaps/events/{subscriptionid}')
  Future<chopper.Response> _sitemapsEventsSubscriptionidGet({
    @Path('subscriptionid') required String? subscriptionid,
    @Query('sitemap') String? sitemap,
    @Query('pageid') String? pageid,
  });

  ///Get all available sitemaps.
  Future<chopper.Response<List<SitemapDTO>>> sitemapsGet() {
    generatedMapping.putIfAbsent(SitemapDTO, () => SitemapDTO.fromJsonFactory);

    return _sitemapsGet();
  }

  ///Get all available sitemaps.
  @Get(path: '/sitemaps')
  Future<chopper.Response<List<SitemapDTO>>> _sitemapsGet();

  ///Initiates a new item state tracker connection
  Future<chopper.Response> eventsStatesGet() {
    return _eventsStatesGet();
  }

  ///Initiates a new item state tracker connection
  @Get(path: '/events/states')
  Future<chopper.Response> _eventsStatesGet();

  ///Get all events.
  ///@param topics topics
  Future<chopper.Response> eventsGet({String? topics}) {
    return _eventsGet(topics: topics);
  }

  ///Get all events.
  ///@param topics topics
  @Get(path: '/events')
  Future<chopper.Response> _eventsGet({@Query('topics') String? topics});

  ///Changes the list of items a SSE connection will receive state updates to.
  ///@param connectionId
  Future<chopper.Response> eventsStatesConnectionIdPost({
    required String? connectionId,
    required List<String>? body,
  }) {
    return _eventsStatesConnectionIdPost(
        connectionId: connectionId, body: body);
  }

  ///Changes the list of items a SSE connection will receive state updates to.
  ///@param connectionId
  @Post(
    path: '/events/states/{connectionId}',
    optionalBody: true,
  )
  Future<chopper.Response> _eventsStatesConnectionIdPost({
    @Path('connectionId') required String? connectionId,
    @Body() required List<String>? body,
  });

  ///Get a single transformation
  ///@param uid Transformation UID
  Future<chopper.Response<Transformation>> transformationsUidGet(
      {required String? uid}) {
    generatedMapping.putIfAbsent(
        Transformation, () => Transformation.fromJsonFactory);

    return _transformationsUidGet(uid: uid);
  }

  ///Get a single transformation
  ///@param uid Transformation UID
  @Get(path: '/transformations/{uid}')
  Future<chopper.Response<Transformation>> _transformationsUidGet(
      {@Path('uid') required String? uid});

  ///Put a single transformation
  ///@param uid Transformation UID
  Future<chopper.Response> transformationsUidPut({
    required String? uid,
    required TransformationDTO? body,
  }) {
    return _transformationsUidPut(uid: uid, body: body);
  }

  ///Put a single transformation
  ///@param uid Transformation UID
  @Put(
    path: '/transformations/{uid}',
    optionalBody: true,
  )
  Future<chopper.Response> _transformationsUidPut({
    @Path('uid') required String? uid,
    @Body() required TransformationDTO? body,
  });

  ///Get a single transformation
  ///@param uid Transformation UID
  Future<chopper.Response> transformationsUidDelete({required String? uid}) {
    return _transformationsUidDelete(uid: uid);
  }

  ///Get a single transformation
  ///@param uid Transformation UID
  @Delete(path: '/transformations/{uid}')
  Future<chopper.Response> _transformationsUidDelete(
      {@Path('uid') required String? uid});

  ///Get a list of all transformations
  Future<chopper.Response<List<TransformationDTO>>> transformationsGet() {
    generatedMapping.putIfAbsent(
        TransformationDTO, () => TransformationDTO.fromJsonFactory);

    return _transformationsGet();
  }

  ///Get a list of all transformations
  @Get(path: '/transformations')
  Future<chopper.Response<List<TransformationDTO>>> _transformationsGet();

  ///Get all registered UI components in the specified namespace.
  ///@param namespace
  ///@param summary summary fields only
  Future<chopper.Response<List<RootUIComponent>>> uiComponentsNamespaceGet({
    required String? namespace,
    bool? summary,
  }) {
    generatedMapping.putIfAbsent(
        RootUIComponent, () => RootUIComponent.fromJsonFactory);

    return _uiComponentsNamespaceGet(namespace: namespace, summary: summary);
  }

  ///Get all registered UI components in the specified namespace.
  ///@param namespace
  ///@param summary summary fields only
  @Get(path: '/ui/components/{namespace}')
  Future<chopper.Response<List<RootUIComponent>>> _uiComponentsNamespaceGet({
    @Path('namespace') required String? namespace,
    @Query('summary') bool? summary,
  });

  ///Add a UI component in the specified namespace.
  ///@param namespace
  Future<chopper.Response<RootUIComponent>> uiComponentsNamespacePost({
    required String? namespace,
    required RootUIComponent? body,
  }) {
    generatedMapping.putIfAbsent(
        RootUIComponent, () => RootUIComponent.fromJsonFactory);

    return _uiComponentsNamespacePost(namespace: namespace, body: body);
  }

  ///Add a UI component in the specified namespace.
  ///@param namespace
  @Post(
    path: '/ui/components/{namespace}',
    optionalBody: true,
  )
  Future<chopper.Response<RootUIComponent>> _uiComponentsNamespacePost({
    @Path('namespace') required String? namespace,
    @Body() required RootUIComponent? body,
  });

  ///Get a specific UI component in the specified namespace.
  ///@param namespace
  ///@param componentUID
  Future<chopper.Response<RootUIComponent>>
      uiComponentsNamespaceComponentUIDGet({
    required String? namespace,
    required String? componentUID,
  }) {
    generatedMapping.putIfAbsent(
        RootUIComponent, () => RootUIComponent.fromJsonFactory);

    return _uiComponentsNamespaceComponentUIDGet(
        namespace: namespace, componentUID: componentUID);
  }

  ///Get a specific UI component in the specified namespace.
  ///@param namespace
  ///@param componentUID
  @Get(path: '/ui/components/{namespace}/{componentUID}')
  Future<chopper.Response<RootUIComponent>>
      _uiComponentsNamespaceComponentUIDGet({
    @Path('namespace') required String? namespace,
    @Path('componentUID') required String? componentUID,
  });

  ///Update a specific UI component in the specified namespace.
  ///@param namespace
  ///@param componentUID
  Future<chopper.Response<RootUIComponent>>
      uiComponentsNamespaceComponentUIDPut({
    required String? namespace,
    required String? componentUID,
    required RootUIComponent? body,
  }) {
    generatedMapping.putIfAbsent(
        RootUIComponent, () => RootUIComponent.fromJsonFactory);

    return _uiComponentsNamespaceComponentUIDPut(
        namespace: namespace, componentUID: componentUID, body: body);
  }

  ///Update a specific UI component in the specified namespace.
  ///@param namespace
  ///@param componentUID
  @Put(
    path: '/ui/components/{namespace}/{componentUID}',
    optionalBody: true,
  )
  Future<chopper.Response<RootUIComponent>>
      _uiComponentsNamespaceComponentUIDPut({
    @Path('namespace') required String? namespace,
    @Path('componentUID') required String? componentUID,
    @Body() required RootUIComponent? body,
  });

  ///Remove a specific UI component in the specified namespace.
  ///@param namespace
  ///@param componentUID
  Future<chopper.Response> uiComponentsNamespaceComponentUIDDelete({
    required String? namespace,
    required String? componentUID,
  }) {
    return _uiComponentsNamespaceComponentUIDDelete(
        namespace: namespace, componentUID: componentUID);
  }

  ///Remove a specific UI component in the specified namespace.
  ///@param namespace
  ///@param componentUID
  @Delete(path: '/ui/components/{namespace}/{componentUID}')
  Future<chopper.Response> _uiComponentsNamespaceComponentUIDDelete({
    @Path('namespace') required String? namespace,
    @Path('componentUID') required String? componentUID,
  });

  ///Get all registered UI tiles.
  Future<chopper.Response<List<TileDTO>>> uiTilesGet() {
    generatedMapping.putIfAbsent(TileDTO, () => TileDTO.fromJsonFactory);

    return _uiTilesGet();
  }

  ///Get all registered UI tiles.
  @Get(path: '/ui/tiles')
  Future<chopper.Response<List<TileDTO>>> _uiTilesGet();

  ///Gets the default voice.
  Future<chopper.Response<VoiceDTO>> voiceDefaultvoiceGet() {
    generatedMapping.putIfAbsent(VoiceDTO, () => VoiceDTO.fromJsonFactory);

    return _voiceDefaultvoiceGet();
  }

  ///Gets the default voice.
  @Get(path: '/voice/defaultvoice')
  Future<chopper.Response<VoiceDTO>> _voiceDefaultvoiceGet();

  ///Gets a single interpreter.
  ///@param Accept-Language language
  ///@param id interpreter id
  Future<chopper.Response<List<HumanLanguageInterpreterDTO>>>
      voiceInterpretersIdGet({
    String? acceptLanguage,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(HumanLanguageInterpreterDTO,
        () => HumanLanguageInterpreterDTO.fromJsonFactory);

    return _voiceInterpretersIdGet(acceptLanguage: acceptLanguage, id: id);
  }

  ///Gets a single interpreter.
  ///@param Accept-Language language
  ///@param id interpreter id
  @Get(path: '/voice/interpreters/{id}')
  Future<chopper.Response<List<HumanLanguageInterpreterDTO>>>
      _voiceInterpretersIdGet({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('id') required String? id,
  });

  ///Get the list of all interpreters.
  ///@param Accept-Language language
  Future<chopper.Response<List<HumanLanguageInterpreterDTO>>>
      voiceInterpretersGet({String? acceptLanguage}) {
    generatedMapping.putIfAbsent(HumanLanguageInterpreterDTO,
        () => HumanLanguageInterpreterDTO.fromJsonFactory);

    return _voiceInterpretersGet(acceptLanguage: acceptLanguage);
  }

  ///Get the list of all interpreters.
  ///@param Accept-Language language
  @Get(path: '/voice/interpreters')
  Future<chopper.Response<List<HumanLanguageInterpreterDTO>>>
      _voiceInterpretersGet(
          {@Header('Accept-Language') String? acceptLanguage});

  ///Sends a text to the default human language interpreter.
  ///@param Accept-Language language
  Future<chopper.Response> voiceInterpretersPost({
    String? acceptLanguage,
    required String? body,
  }) {
    return _voiceInterpretersPost(acceptLanguage: acceptLanguage, body: body);
  }

  ///Sends a text to the default human language interpreter.
  ///@param Accept-Language language
  @Post(
    path: '/voice/interpreters',
    optionalBody: true,
  )
  Future<chopper.Response> _voiceInterpretersPost({
    @Header('Accept-Language') String? acceptLanguage,
    @Body() required String? body,
  });

  ///Get the list of all voices.
  Future<chopper.Response<List<VoiceDTO>>> voiceVoicesGet() {
    generatedMapping.putIfAbsent(VoiceDTO, () => VoiceDTO.fromJsonFactory);

    return _voiceVoicesGet();
  }

  ///Get the list of all voices.
  @Get(path: '/voice/voices')
  Future<chopper.Response<List<VoiceDTO>>> _voiceVoicesGet();

  ///Sends a text to a given human language interpreter(s).
  ///@param Accept-Language language
  ///@param ids comma separated list of interpreter ids
  Future<chopper.Response> voiceInterpretersIdsPost({
    String? acceptLanguage,
    required List<String>? ids,
    required String? body,
  }) {
    return _voiceInterpretersIdsPost(
        acceptLanguage: acceptLanguage, ids: ids, body: body);
  }

  ///Sends a text to a given human language interpreter(s).
  ///@param Accept-Language language
  ///@param ids comma separated list of interpreter ids
  @Post(
    path: '/voice/interpreters/{ids}',
    optionalBody: true,
  )
  Future<chopper.Response> _voiceInterpretersIdsPost({
    @Header('Accept-Language') String? acceptLanguage,
    @Path('ids') required List<String>? ids,
    @Body() required String? body,
  });

  ///Executes a simple dialog sequence without keyword spotting for a given audio source.
  ///@param Accept-Language language
  ///@param sourceId source ID
  ///@param sttId Speech-to-Text ID
  ///@param ttsId Text-to-Speech ID
  ///@param voiceId voice ID
  ///@param hliIds interpreter IDs
  ///@param sinkId audio sink ID
  ///@param listeningItem listening item
  Future<chopper.Response> voiceListenandanswerPost({
    String? acceptLanguage,
    String? sourceId,
    String? sttId,
    String? ttsId,
    String? voiceId,
    List<String>? hliIds,
    String? sinkId,
    String? listeningItem,
  }) {
    return _voiceListenandanswerPost(
        acceptLanguage: acceptLanguage,
        sourceId: sourceId,
        sttId: sttId,
        ttsId: ttsId,
        voiceId: voiceId,
        hliIds: hliIds,
        sinkId: sinkId,
        listeningItem: listeningItem);
  }

  ///Executes a simple dialog sequence without keyword spotting for a given audio source.
  ///@param Accept-Language language
  ///@param sourceId source ID
  ///@param sttId Speech-to-Text ID
  ///@param ttsId Text-to-Speech ID
  ///@param voiceId voice ID
  ///@param hliIds interpreter IDs
  ///@param sinkId audio sink ID
  ///@param listeningItem listening item
  @Post(
    path: '/voice/listenandanswer',
    optionalBody: true,
  )
  Future<chopper.Response> _voiceListenandanswerPost({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('sourceId') String? sourceId,
    @Query('sttId') String? sttId,
    @Query('ttsId') String? ttsId,
    @Query('voiceId') String? voiceId,
    @Query('hliIds') List<String>? hliIds,
    @Query('sinkId') String? sinkId,
    @Query('listeningItem') String? listeningItem,
  });

  ///Speaks a given text with a given voice through the given audio sink.
  ///@param voiceid voice id
  ///@param sinkid audio sink id
  Future<chopper.Response> voiceSayPost({
    String? voiceid,
    String? sinkid,
    required String? body,
  }) {
    return _voiceSayPost(voiceid: voiceid, sinkid: sinkid, body: body);
  }

  ///Speaks a given text with a given voice through the given audio sink.
  ///@param voiceid voice id
  ///@param sinkid audio sink id
  @Post(
    path: '/voice/say',
    optionalBody: true,
  )
  Future<chopper.Response> _voiceSayPost({
    @Query('voiceid') String? voiceid,
    @Query('sinkid') String? sinkid,
    @Body() required String? body,
  });

  ///Start dialog processing for a given audio source.
  ///@param Accept-Language language
  ///@param sourceId source ID
  ///@param ksId keywork spotter ID
  ///@param sttId Speech-to-Text ID
  ///@param ttsId Text-to-Speech ID
  ///@param voiceId voice ID
  ///@param hliIds comma separated list of interpreter IDs
  ///@param sinkId audio sink ID
  ///@param keyword keyword
  ///@param listeningItem listening item
  Future<chopper.Response> voiceDialogStartPost({
    String? acceptLanguage,
    String? sourceId,
    String? ksId,
    String? sttId,
    String? ttsId,
    String? voiceId,
    String? hliIds,
    String? sinkId,
    String? keyword,
    String? listeningItem,
  }) {
    return _voiceDialogStartPost(
        acceptLanguage: acceptLanguage,
        sourceId: sourceId,
        ksId: ksId,
        sttId: sttId,
        ttsId: ttsId,
        voiceId: voiceId,
        hliIds: hliIds,
        sinkId: sinkId,
        keyword: keyword,
        listeningItem: listeningItem);
  }

  ///Start dialog processing for a given audio source.
  ///@param Accept-Language language
  ///@param sourceId source ID
  ///@param ksId keywork spotter ID
  ///@param sttId Speech-to-Text ID
  ///@param ttsId Text-to-Speech ID
  ///@param voiceId voice ID
  ///@param hliIds comma separated list of interpreter IDs
  ///@param sinkId audio sink ID
  ///@param keyword keyword
  ///@param listeningItem listening item
  @Post(
    path: '/voice/dialog/start',
    optionalBody: true,
  )
  Future<chopper.Response> _voiceDialogStartPost({
    @Header('Accept-Language') String? acceptLanguage,
    @Query('sourceId') String? sourceId,
    @Query('ksId') String? ksId,
    @Query('sttId') String? sttId,
    @Query('ttsId') String? ttsId,
    @Query('voiceId') String? voiceId,
    @Query('hliIds') String? hliIds,
    @Query('sinkId') String? sinkId,
    @Query('keyword') String? keyword,
    @Query('listeningItem') String? listeningItem,
  });

  ///Stop dialog processing for a given audio source.
  ///@param sourceId source ID
  Future<chopper.Response> voiceDialogStopPost({String? sourceId}) {
    return _voiceDialogStopPost(sourceId: sourceId);
  }

  ///Stop dialog processing for a given audio source.
  ///@param sourceId source ID
  @Post(
    path: '/voice/dialog/stop',
    optionalBody: true,
  )
  Future<chopper.Response> _voiceDialogStopPost(
      {@Query('sourceId') String? sourceId});

  ///Get a single logger.
  ///@param loggerName logger name
  Future<chopper.Response<LoggerInfo>> loggingLoggerNameGet(
      {required String? loggerName}) {
    generatedMapping.putIfAbsent(LoggerInfo, () => LoggerInfo.fromJsonFactory);

    return _loggingLoggerNameGet(loggerName: loggerName);
  }

  ///Get a single logger.
  ///@param loggerName logger name
  @Get(path: '/logging/{loggerName}')
  Future<chopper.Response<LoggerInfo>> _loggingLoggerNameGet(
      {@Path('loggerName') required String? loggerName});

  ///Modify or add logger
  ///@param loggerName logger name
  Future<chopper.Response> loggingLoggerNamePut({
    required String? loggerName,
    required LoggerInfo? body,
  }) {
    return _loggingLoggerNamePut(loggerName: loggerName, body: body);
  }

  ///Modify or add logger
  ///@param loggerName logger name
  @Put(
    path: '/logging/{loggerName}',
    optionalBody: true,
  )
  Future<chopper.Response> _loggingLoggerNamePut({
    @Path('loggerName') required String? loggerName,
    @Body() required LoggerInfo? body,
  });

  ///Remove a single logger.
  ///@param loggerName logger name
  Future<chopper.Response> loggingLoggerNameDelete(
      {required String? loggerName}) {
    return _loggingLoggerNameDelete(loggerName: loggerName);
  }

  ///Remove a single logger.
  ///@param loggerName logger name
  @Delete(path: '/logging/{loggerName}')
  Future<chopper.Response> _loggingLoggerNameDelete(
      {@Path('loggerName') required String? loggerName});

  ///Get all loggers
  Future<chopper.Response<LoggerBean>> loggingGet() {
    generatedMapping.putIfAbsent(LoggerBean, () => LoggerBean.fromJsonFactory);

    return _loggingGet();
  }

  ///Get all loggers
  @Get(path: '/logging')
  Future<chopper.Response<LoggerBean>> _loggingGet();

  ///Gets all icon sets.
  ///@param Accept-Language language
  Future<chopper.Response<List<IconSet>>> iconsetsGet(
      {String? acceptLanguage}) {
    generatedMapping.putIfAbsent(IconSet, () => IconSet.fromJsonFactory);

    return _iconsetsGet(acceptLanguage: acceptLanguage);
  }

  ///Gets all icon sets.
  ///@param Accept-Language language
  @Get(path: '/iconsets')
  Future<chopper.Response<List<IconSet>>> _iconsetsGet(
      {@Header('Accept-Language') String? acceptLanguage});

  ///Send a query to HABot to interpret.
  Future<chopper.Response<ChatReply>> habotChatPost({required String? body}) {
    generatedMapping.putIfAbsent(ChatReply, () => ChatReply.fromJsonFactory);

    return _habotChatPost(body: body);
  }

  ///Send a query to HABot to interpret.
  @Post(
    path: '/habot/chat',
    optionalBody: true,
  )
  Future<chopper.Response<ChatReply>> _habotChatPost(
      {@Body() required String? body});

  ///Creates a new card in the card deck (compatibility endpoint).
  Future<chopper.Response<Card>> habotCompatCardsPost({required String? body}) {
    generatedMapping.putIfAbsent(Card, () => Card.fromJsonFactory);

    return _habotCompatCardsPost(body: body);
  }

  ///Creates a new card in the card deck (compatibility endpoint).
  @Post(
    path: '/habot/compat/cards',
    optionalBody: true,
  )
  Future<chopper.Response<Card>> _habotCompatCardsPost(
      {@Body() required String? body});

  ///Gets all cards of the card deck.
  Future<chopper.Response<List<Card>>> habotCardsGet() {
    generatedMapping.putIfAbsent(Card, () => Card.fromJsonFactory);

    return _habotCardsGet();
  }

  ///Gets all cards of the card deck.
  @Get(path: '/habot/cards')
  Future<chopper.Response<List<Card>>> _habotCardsGet();

  ///Creates a new card in the card deck.
  Future<chopper.Response<Card>> habotCardsPost({required Card? body}) {
    generatedMapping.putIfAbsent(Card, () => Card.fromJsonFactory);

    return _habotCardsPost(body: body);
  }

  ///Creates a new card in the card deck.
  @Post(
    path: '/habot/cards',
    optionalBody: true,
  )
  Future<chopper.Response<Card>> _habotCardsPost({@Body() required Card? body});

  ///Gets a card from the card deck by its UID.
  ///@param cardUID cardUID
  Future<chopper.Response<Card>> habotCardsCardUIDGet(
      {required String? cardUID}) {
    generatedMapping.putIfAbsent(Card, () => Card.fromJsonFactory);

    return _habotCardsCardUIDGet(cardUID: cardUID);
  }

  ///Gets a card from the card deck by its UID.
  ///@param cardUID cardUID
  @Get(path: '/habot/cards/{cardUID}')
  Future<chopper.Response<Card>> _habotCardsCardUIDGet(
      {@Path('cardUID') required String? cardUID});

  ///Updates a card in the card deck.
  ///@param cardUID cardUID
  Future<chopper.Response<Card>> habotCardsCardUIDPut({
    required String? cardUID,
    required Card? body,
  }) {
    generatedMapping.putIfAbsent(Card, () => Card.fromJsonFactory);

    return _habotCardsCardUIDPut(cardUID: cardUID, body: body);
  }

  ///Updates a card in the card deck.
  ///@param cardUID cardUID
  @Put(
    path: '/habot/cards/{cardUID}',
    optionalBody: true,
  )
  Future<chopper.Response<Card>> _habotCardsCardUIDPut({
    @Path('cardUID') required String? cardUID,
    @Body() required Card? body,
  });

  ///Deletes a card from the card deck.
  ///@param cardUID cardUID
  Future<chopper.Response> habotCardsCardUIDDelete({required String? cardUID}) {
    return _habotCardsCardUIDDelete(cardUID: cardUID);
  }

  ///Deletes a card from the card deck.
  ///@param cardUID cardUID
  @Delete(path: '/habot/cards/{cardUID}')
  Future<chopper.Response> _habotCardsCardUIDDelete(
      {@Path('cardUID') required String? cardUID});

  ///Deletes a card from the card deck (compatibility endpoint).
  ///@param cardUID cardUID
  Future<chopper.Response<Card>> habotCompatCardsCardUIDDeletePost(
      {required String? cardUID}) {
    generatedMapping.putIfAbsent(Card, () => Card.fromJsonFactory);

    return _habotCompatCardsCardUIDDeletePost(cardUID: cardUID);
  }

  ///Deletes a card from the card deck (compatibility endpoint).
  ///@param cardUID cardUID
  @Post(
    path: '/habot/compat/cards/{cardUID}/delete',
    optionalBody: true,
  )
  Future<chopper.Response<Card>> _habotCompatCardsCardUIDDeletePost(
      {@Path('cardUID') required String? cardUID});

  ///Gets all item named attributes.
  Future<chopper.Response<ChatReply>> habotAttributesGet() {
    generatedMapping.putIfAbsent(ChatReply, () => ChatReply.fromJsonFactory);

    return _habotAttributesGet();
  }

  ///Gets all item named attributes.
  @Get(path: '/habot/attributes')
  Future<chopper.Response<ChatReply>> _habotAttributesGet();

  ///Retrieves a first greeting message from the bot in the specified or configured language.
  Future<chopper.Response<ChatReply>> habotGreetGet() {
    generatedMapping.putIfAbsent(ChatReply, () => ChatReply.fromJsonFactory);

    return _habotGreetGet();
  }

  ///Retrieves a first greeting message from the bot in the specified or configured language.
  @Get(path: '/habot/greet')
  Future<chopper.Response<ChatReply>> _habotGreetGet();

  ///Gets the most recent cards from the card deck
  ///@param skip
  ///@param count
  Future<chopper.Response<List<Card>>> habotCardsRecentGet({
    int? skip,
    int? count,
  }) {
    generatedMapping.putIfAbsent(Card, () => Card.fromJsonFactory);

    return _habotCardsRecentGet(skip: skip, count: count);
  }

  ///Gets the most recent cards from the card deck
  ///@param skip
  ///@param count
  @Get(path: '/habot/cards/recent')
  Future<chopper.Response<List<Card>>> _habotCardsRecentGet({
    @Query('skip') int? skip,
    @Query('count') int? count,
  });

  ///Sets a bookmark on a card.
  ///@param cardUID cardUID
  Future<chopper.Response> habotCardsCardUIDBookmarkPut(
      {required String? cardUID}) {
    return _habotCardsCardUIDBookmarkPut(cardUID: cardUID);
  }

  ///Sets a bookmark on a card.
  ///@param cardUID cardUID
  @Put(
    path: '/habot/cards/{cardUID}/bookmark',
    optionalBody: true,
  )
  Future<chopper.Response> _habotCardsCardUIDBookmarkPut(
      {@Path('cardUID') required String? cardUID});

  ///Removes the bookmark on a card.
  ///@param cardUID cardUID
  Future<chopper.Response> habotCardsCardUIDBookmarkDelete(
      {required String? cardUID}) {
    return _habotCardsCardUIDBookmarkDelete(cardUID: cardUID);
  }

  ///Removes the bookmark on a card.
  ///@param cardUID cardUID
  @Delete(path: '/habot/cards/{cardUID}/bookmark')
  Future<chopper.Response> _habotCardsCardUIDBookmarkDelete(
      {@Path('cardUID') required String? cardUID});

  ///Removes the bookmark on a card (compatibility endpoint).
  ///@param cardUID cardUID
  Future<chopper.Response> habotCompatCardsCardUIDUnbookmarkPost(
      {required String? cardUID}) {
    return _habotCompatCardsCardUIDUnbookmarkPost(cardUID: cardUID);
  }

  ///Removes the bookmark on a card (compatibility endpoint).
  ///@param cardUID cardUID
  @Post(
    path: '/habot/compat/cards/{cardUID}/unbookmark',
    optionalBody: true,
  )
  Future<chopper.Response> _habotCompatCardsCardUIDUnbookmarkPost(
      {@Path('cardUID') required String? cardUID});

  ///Updates a card in the card deck (compatibility endpoint).
  ///@param cardUID cardUID
  Future<chopper.Response<Card>> habotCompatCardsCardUIDPost({
    required String? cardUID,
    required String? body,
  }) {
    generatedMapping.putIfAbsent(Card, () => Card.fromJsonFactory);

    return _habotCompatCardsCardUIDPost(cardUID: cardUID, body: body);
  }

  ///Updates a card in the card deck (compatibility endpoint).
  ///@param cardUID cardUID
  @Post(
    path: '/habot/compat/cards/{cardUID}',
    optionalBody: true,
  )
  Future<chopper.Response<Card>> _habotCompatCardsCardUIDPost({
    @Path('cardUID') required String? cardUID,
    @Body() required String? body,
  });

  ///Updates the timestamp on a card to the current time
  ///@param cardUID cardUID
  Future<chopper.Response> habotCardsCardUIDTimestampPut(
      {required String? cardUID}) {
    return _habotCardsCardUIDTimestampPut(cardUID: cardUID);
  }

  ///Updates the timestamp on a card to the current time
  ///@param cardUID cardUID
  @Put(
    path: '/habot/cards/{cardUID}/timestamp',
    optionalBody: true,
  )
  Future<chopper.Response> _habotCardsCardUIDTimestampPut(
      {@Path('cardUID') required String? cardUID});

  ///Gets or generates the public VAPID key used for push notifications.
  Future<chopper.Response<String>> habotNotificationsVapidGet() {
    return _habotNotificationsVapidGet();
  }

  ///Gets or generates the public VAPID key used for push notifications.
  @Get(path: '/habot/notifications/vapid')
  Future<chopper.Response<String>> _habotNotificationsVapidGet();

  ///Subscribes a new client for push notifications.
  Future<chopper.Response> habotNotificationsSubscribePost(
      {required String? body}) {
    return _habotNotificationsSubscribePost(body: body);
  }

  ///Subscribes a new client for push notifications.
  @Post(
    path: '/habot/notifications/subscribe',
    optionalBody: true,
  )
  Future<chopper.Response> _habotNotificationsSubscribePost(
      {@Body() required String? body});

  ///Gets the list of widget gallery items.
  ///@param galleryName gallery name e.g. 'community'
  Future<chopper.Response<List<GalleryWidgetsListItem>>>
      habpanelGalleryGalleryNameWidgetsGet({required String? galleryName}) {
    generatedMapping.putIfAbsent(
        GalleryWidgetsListItem, () => GalleryWidgetsListItem.fromJsonFactory);

    return _habpanelGalleryGalleryNameWidgetsGet(galleryName: galleryName);
  }

  ///Gets the list of widget gallery items.
  ///@param galleryName gallery name e.g. 'community'
  @Get(path: '/habpanel/gallery/{galleryName}/widgets')
  Future<chopper.Response<List<GalleryWidgetsListItem>>>
      _habpanelGalleryGalleryNameWidgetsGet(
          {@Path('galleryName') required String? galleryName});

  ///Gets the details about a widget gallery item.
  ///@param galleryName gallery name e.g. 'community'
  ///@param id id within the gallery
  Future<chopper.Response<GalleryItem>> habpanelGalleryGalleryNameWidgetsIdGet({
    required String? galleryName,
    required String? id,
  }) {
    generatedMapping.putIfAbsent(
        GalleryItem, () => GalleryItem.fromJsonFactory);

    return _habpanelGalleryGalleryNameWidgetsIdGet(
        galleryName: galleryName, id: id);
  }

  ///Gets the details about a widget gallery item.
  ///@param galleryName gallery name e.g. 'community'
  ///@param id id within the gallery
  @Get(path: '/habpanel/gallery/{galleryName}/widgets/{id}')
  Future<chopper.Response<GalleryItem>>
      _habpanelGalleryGalleryNameWidgetsIdGet({
    @Path('galleryName') required String? galleryName,
    @Path('id') required String? id,
  });
}

@JsonSerializable(explicitToJson: true)
class ConfigDescriptionParameterDTO {
  ConfigDescriptionParameterDTO({
    this.context,
    this.defaultValue,
    this.description,
    this.label,
    this.name,
    this.required,
    this.type,
    this.min,
    this.max,
    this.stepsize,
    this.pattern,
    this.readOnly,
    this.multiple,
    this.multipleLimit,
    this.groupName,
    this.advanced,
    this.verify,
    this.limitToOptions,
    this.unit,
    this.unitLabel,
    this.options,
    this.filterCriteria,
  });

  factory ConfigDescriptionParameterDTO.fromJson(Map<String, dynamic> json) =>
      _$ConfigDescriptionParameterDTOFromJson(json);

  @JsonKey(name: 'context')
  final String? context;
  @JsonKey(name: 'defaultValue')
  final String? defaultValue;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'required')
  final bool? required;
  @JsonKey(
    name: 'type',
    toJson: configDescriptionParameterDTOTypeToJson,
    fromJson: configDescriptionParameterDTOTypeFromJson,
  )
  final enums.ConfigDescriptionParameterDTOType? type;
  @JsonKey(name: 'min')
  final double? min;
  @JsonKey(name: 'max')
  final double? max;
  @JsonKey(name: 'stepsize')
  final double? stepsize;
  @JsonKey(name: 'pattern')
  final String? pattern;
  @JsonKey(name: 'readOnly')
  final bool? readOnly;
  @JsonKey(name: 'multiple')
  final bool? multiple;
  @JsonKey(name: 'multipleLimit')
  final int? multipleLimit;
  @JsonKey(name: 'groupName')
  final String? groupName;
  @JsonKey(name: 'advanced')
  final bool? advanced;
  @JsonKey(name: 'verify')
  final bool? verify;
  @JsonKey(name: 'limitToOptions')
  final bool? limitToOptions;
  @JsonKey(name: 'unit')
  final String? unit;
  @JsonKey(name: 'unitLabel')
  final String? unitLabel;
  @JsonKey(name: 'options', defaultValue: <ParameterOptionDTO>[])
  final List<ParameterOptionDTO>? options;
  @JsonKey(name: 'filterCriteria', defaultValue: <FilterCriteriaDTO>[])
  final List<FilterCriteriaDTO>? filterCriteria;
  static const fromJsonFactory = _$ConfigDescriptionParameterDTOFromJson;
  static const toJsonFactory = _$ConfigDescriptionParameterDTOToJson;
  Map<String, dynamic> toJson() => _$ConfigDescriptionParameterDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfigDescriptionParameterDTO &&
            (identical(other.context, context) ||
                const DeepCollectionEquality()
                    .equals(other.context, context)) &&
            (identical(other.defaultValue, defaultValue) ||
                const DeepCollectionEquality()
                    .equals(other.defaultValue, defaultValue)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.min, min) ||
                const DeepCollectionEquality().equals(other.min, min)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)) &&
            (identical(other.stepsize, stepsize) ||
                const DeepCollectionEquality()
                    .equals(other.stepsize, stepsize)) &&
            (identical(other.pattern, pattern) ||
                const DeepCollectionEquality()
                    .equals(other.pattern, pattern)) &&
            (identical(other.readOnly, readOnly) ||
                const DeepCollectionEquality()
                    .equals(other.readOnly, readOnly)) &&
            (identical(other.multiple, multiple) ||
                const DeepCollectionEquality()
                    .equals(other.multiple, multiple)) &&
            (identical(other.multipleLimit, multipleLimit) ||
                const DeepCollectionEquality()
                    .equals(other.multipleLimit, multipleLimit)) &&
            (identical(other.groupName, groupName) ||
                const DeepCollectionEquality()
                    .equals(other.groupName, groupName)) &&
            (identical(other.advanced, advanced) ||
                const DeepCollectionEquality()
                    .equals(other.advanced, advanced)) &&
            (identical(other.verify, verify) ||
                const DeepCollectionEquality().equals(other.verify, verify)) &&
            (identical(other.limitToOptions, limitToOptions) ||
                const DeepCollectionEquality()
                    .equals(other.limitToOptions, limitToOptions)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.unitLabel, unitLabel) ||
                const DeepCollectionEquality()
                    .equals(other.unitLabel, unitLabel)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality()
                    .equals(other.options, options)) &&
            (identical(other.filterCriteria, filterCriteria) ||
                const DeepCollectionEquality()
                    .equals(other.filterCriteria, filterCriteria)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(context) ^
      const DeepCollectionEquality().hash(defaultValue) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(min) ^
      const DeepCollectionEquality().hash(max) ^
      const DeepCollectionEquality().hash(stepsize) ^
      const DeepCollectionEquality().hash(pattern) ^
      const DeepCollectionEquality().hash(readOnly) ^
      const DeepCollectionEquality().hash(multiple) ^
      const DeepCollectionEquality().hash(multipleLimit) ^
      const DeepCollectionEquality().hash(groupName) ^
      const DeepCollectionEquality().hash(advanced) ^
      const DeepCollectionEquality().hash(verify) ^
      const DeepCollectionEquality().hash(limitToOptions) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(unitLabel) ^
      const DeepCollectionEquality().hash(options) ^
      const DeepCollectionEquality().hash(filterCriteria) ^
      runtimeType.hashCode;
}

extension $ConfigDescriptionParameterDTOExtension
    on ConfigDescriptionParameterDTO {
  ConfigDescriptionParameterDTO copyWith(
      {String? context,
      String? defaultValue,
      String? description,
      String? label,
      String? name,
      bool? required,
      enums.ConfigDescriptionParameterDTOType? type,
      double? min,
      double? max,
      double? stepsize,
      String? pattern,
      bool? readOnly,
      bool? multiple,
      int? multipleLimit,
      String? groupName,
      bool? advanced,
      bool? verify,
      bool? limitToOptions,
      String? unit,
      String? unitLabel,
      List<ParameterOptionDTO>? options,
      List<FilterCriteriaDTO>? filterCriteria}) {
    return ConfigDescriptionParameterDTO(
        context: context ?? this.context,
        defaultValue: defaultValue ?? this.defaultValue,
        description: description ?? this.description,
        label: label ?? this.label,
        name: name ?? this.name,
        required: required ?? this.required,
        type: type ?? this.type,
        min: min ?? this.min,
        max: max ?? this.max,
        stepsize: stepsize ?? this.stepsize,
        pattern: pattern ?? this.pattern,
        readOnly: readOnly ?? this.readOnly,
        multiple: multiple ?? this.multiple,
        multipleLimit: multipleLimit ?? this.multipleLimit,
        groupName: groupName ?? this.groupName,
        advanced: advanced ?? this.advanced,
        verify: verify ?? this.verify,
        limitToOptions: limitToOptions ?? this.limitToOptions,
        unit: unit ?? this.unit,
        unitLabel: unitLabel ?? this.unitLabel,
        options: options ?? this.options,
        filterCriteria: filterCriteria ?? this.filterCriteria);
  }

  ConfigDescriptionParameterDTO copyWithWrapped(
      {Wrapped<String?>? context,
      Wrapped<String?>? defaultValue,
      Wrapped<String?>? description,
      Wrapped<String?>? label,
      Wrapped<String?>? name,
      Wrapped<bool?>? required,
      Wrapped<enums.ConfigDescriptionParameterDTOType?>? type,
      Wrapped<double?>? min,
      Wrapped<double?>? max,
      Wrapped<double?>? stepsize,
      Wrapped<String?>? pattern,
      Wrapped<bool?>? readOnly,
      Wrapped<bool?>? multiple,
      Wrapped<int?>? multipleLimit,
      Wrapped<String?>? groupName,
      Wrapped<bool?>? advanced,
      Wrapped<bool?>? verify,
      Wrapped<bool?>? limitToOptions,
      Wrapped<String?>? unit,
      Wrapped<String?>? unitLabel,
      Wrapped<List<ParameterOptionDTO>?>? options,
      Wrapped<List<FilterCriteriaDTO>?>? filterCriteria}) {
    return ConfigDescriptionParameterDTO(
        context: (context != null ? context.value : this.context),
        defaultValue:
            (defaultValue != null ? defaultValue.value : this.defaultValue),
        description:
            (description != null ? description.value : this.description),
        label: (label != null ? label.value : this.label),
        name: (name != null ? name.value : this.name),
        required: (required != null ? required.value : this.required),
        type: (type != null ? type.value : this.type),
        min: (min != null ? min.value : this.min),
        max: (max != null ? max.value : this.max),
        stepsize: (stepsize != null ? stepsize.value : this.stepsize),
        pattern: (pattern != null ? pattern.value : this.pattern),
        readOnly: (readOnly != null ? readOnly.value : this.readOnly),
        multiple: (multiple != null ? multiple.value : this.multiple),
        multipleLimit:
            (multipleLimit != null ? multipleLimit.value : this.multipleLimit),
        groupName: (groupName != null ? groupName.value : this.groupName),
        advanced: (advanced != null ? advanced.value : this.advanced),
        verify: (verify != null ? verify.value : this.verify),
        limitToOptions: (limitToOptions != null
            ? limitToOptions.value
            : this.limitToOptions),
        unit: (unit != null ? unit.value : this.unit),
        unitLabel: (unitLabel != null ? unitLabel.value : this.unitLabel),
        options: (options != null ? options.value : this.options),
        filterCriteria: (filterCriteria != null
            ? filterCriteria.value
            : this.filterCriteria));
  }
}

@JsonSerializable(explicitToJson: true)
class FilterCriteriaDTO {
  FilterCriteriaDTO({
    this.value,
    this.name,
  });

  factory FilterCriteriaDTO.fromJson(Map<String, dynamic> json) =>
      _$FilterCriteriaDTOFromJson(json);

  @JsonKey(name: 'value')
  final String? value;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$FilterCriteriaDTOFromJson;
  static const toJsonFactory = _$FilterCriteriaDTOToJson;
  Map<String, dynamic> toJson() => _$FilterCriteriaDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FilterCriteriaDTO &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $FilterCriteriaDTOExtension on FilterCriteriaDTO {
  FilterCriteriaDTO copyWith({String? value, String? name}) {
    return FilterCriteriaDTO(
        value: value ?? this.value, name: name ?? this.name);
  }

  FilterCriteriaDTO copyWithWrapped(
      {Wrapped<String?>? value, Wrapped<String?>? name}) {
    return FilterCriteriaDTO(
        value: (value != null ? value.value : this.value),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class ModuleTypeDTO {
  ModuleTypeDTO({
    this.uid,
    this.visibility,
    this.tags,
    this.label,
    this.description,
    this.configDescriptions,
  });

  factory ModuleTypeDTO.fromJson(Map<String, dynamic> json) =>
      _$ModuleTypeDTOFromJson(json);

  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(
    name: 'visibility',
    toJson: moduleTypeDTOVisibilityToJson,
    fromJson: moduleTypeDTOVisibilityFromJson,
  )
  final enums.ModuleTypeDTOVisibility? visibility;
  @JsonKey(name: 'tags', defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(
      name: 'configDescriptions',
      defaultValue: <ConfigDescriptionParameterDTO>[])
  final List<ConfigDescriptionParameterDTO>? configDescriptions;
  static const fromJsonFactory = _$ModuleTypeDTOFromJson;
  static const toJsonFactory = _$ModuleTypeDTOToJson;
  Map<String, dynamic> toJson() => _$ModuleTypeDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ModuleTypeDTO &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.configDescriptions, configDescriptions) ||
                const DeepCollectionEquality()
                    .equals(other.configDescriptions, configDescriptions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(configDescriptions) ^
      runtimeType.hashCode;
}

extension $ModuleTypeDTOExtension on ModuleTypeDTO {
  ModuleTypeDTO copyWith(
      {String? uid,
      enums.ModuleTypeDTOVisibility? visibility,
      List<String>? tags,
      String? label,
      String? description,
      List<ConfigDescriptionParameterDTO>? configDescriptions}) {
    return ModuleTypeDTO(
        uid: uid ?? this.uid,
        visibility: visibility ?? this.visibility,
        tags: tags ?? this.tags,
        label: label ?? this.label,
        description: description ?? this.description,
        configDescriptions: configDescriptions ?? this.configDescriptions);
  }

  ModuleTypeDTO copyWithWrapped(
      {Wrapped<String?>? uid,
      Wrapped<enums.ModuleTypeDTOVisibility?>? visibility,
      Wrapped<List<String>?>? tags,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<List<ConfigDescriptionParameterDTO>?>? configDescriptions}) {
    return ModuleTypeDTO(
        uid: (uid != null ? uid.value : this.uid),
        visibility: (visibility != null ? visibility.value : this.visibility),
        tags: (tags != null ? tags.value : this.tags),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        configDescriptions: (configDescriptions != null
            ? configDescriptions.value
            : this.configDescriptions));
  }
}

@JsonSerializable(explicitToJson: true)
class ParameterOptionDTO {
  ParameterOptionDTO({
    this.label,
    this.value,
  });

  factory ParameterOptionDTO.fromJson(Map<String, dynamic> json) =>
      _$ParameterOptionDTOFromJson(json);

  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'value')
  final String? value;
  static const fromJsonFactory = _$ParameterOptionDTOFromJson;
  static const toJsonFactory = _$ParameterOptionDTOToJson;
  Map<String, dynamic> toJson() => _$ParameterOptionDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParameterOptionDTO &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $ParameterOptionDTOExtension on ParameterOptionDTO {
  ParameterOptionDTO copyWith({String? label, String? value}) {
    return ParameterOptionDTO(
        label: label ?? this.label, value: value ?? this.value);
  }

  ParameterOptionDTO copyWithWrapped(
      {Wrapped<String?>? label, Wrapped<String?>? value}) {
    return ParameterOptionDTO(
        label: (label != null ? label.value : this.label),
        value: (value != null ? value.value : this.value));
  }
}

@JsonSerializable(explicitToJson: true)
class ActionDTO {
  ActionDTO({
    this.id,
    this.label,
    this.description,
    this.configuration,
    this.type,
    this.inputs,
  });

  factory ActionDTO.fromJson(Map<String, dynamic> json) =>
      _$ActionDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'inputs')
  final Map<String, dynamic>? inputs;
  static const fromJsonFactory = _$ActionDTOFromJson;
  static const toJsonFactory = _$ActionDTOToJson;
  Map<String, dynamic> toJson() => _$ActionDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ActionDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.inputs, inputs) ||
                const DeepCollectionEquality().equals(other.inputs, inputs)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(inputs) ^
      runtimeType.hashCode;
}

extension $ActionDTOExtension on ActionDTO {
  ActionDTO copyWith(
      {String? id,
      String? label,
      String? description,
      Map<String, dynamic>? configuration,
      String? type,
      Map<String, dynamic>? inputs}) {
    return ActionDTO(
        id: id ?? this.id,
        label: label ?? this.label,
        description: description ?? this.description,
        configuration: configuration ?? this.configuration,
        type: type ?? this.type,
        inputs: inputs ?? this.inputs);
  }

  ActionDTO copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<String?>? type,
      Wrapped<Map<String, dynamic>?>? inputs}) {
    return ActionDTO(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        type: (type != null ? type.value : this.type),
        inputs: (inputs != null ? inputs.value : this.inputs));
  }
}

@JsonSerializable(explicitToJson: true)
class ConditionDTO {
  ConditionDTO({
    this.id,
    this.label,
    this.description,
    this.configuration,
    this.type,
    this.inputs,
  });

  factory ConditionDTO.fromJson(Map<String, dynamic> json) =>
      _$ConditionDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'inputs')
  final Map<String, dynamic>? inputs;
  static const fromJsonFactory = _$ConditionDTOFromJson;
  static const toJsonFactory = _$ConditionDTOToJson;
  Map<String, dynamic> toJson() => _$ConditionDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConditionDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.inputs, inputs) ||
                const DeepCollectionEquality().equals(other.inputs, inputs)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(inputs) ^
      runtimeType.hashCode;
}

extension $ConditionDTOExtension on ConditionDTO {
  ConditionDTO copyWith(
      {String? id,
      String? label,
      String? description,
      Map<String, dynamic>? configuration,
      String? type,
      Map<String, dynamic>? inputs}) {
    return ConditionDTO(
        id: id ?? this.id,
        label: label ?? this.label,
        description: description ?? this.description,
        configuration: configuration ?? this.configuration,
        type: type ?? this.type,
        inputs: inputs ?? this.inputs);
  }

  ConditionDTO copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<String?>? type,
      Wrapped<Map<String, dynamic>?>? inputs}) {
    return ConditionDTO(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        type: (type != null ? type.value : this.type),
        inputs: (inputs != null ? inputs.value : this.inputs));
  }
}

@JsonSerializable(explicitToJson: true)
class RuleDTO {
  RuleDTO({
    this.triggers,
    this.conditions,
    this.actions,
    this.configuration,
    this.configDescriptions,
    this.templateUID,
    this.uid,
    this.name,
    this.tags,
    this.visibility,
    this.description,
  });

  factory RuleDTO.fromJson(Map<String, dynamic> json) =>
      _$RuleDTOFromJson(json);

  @JsonKey(name: 'triggers', defaultValue: <TriggerDTO>[])
  final List<TriggerDTO>? triggers;
  @JsonKey(name: 'conditions', defaultValue: <ConditionDTO>[])
  final List<ConditionDTO>? conditions;
  @JsonKey(name: 'actions', defaultValue: <ActionDTO>[])
  final List<ActionDTO>? actions;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(
      name: 'configDescriptions',
      defaultValue: <ConfigDescriptionParameterDTO>[])
  final List<ConfigDescriptionParameterDTO>? configDescriptions;
  @JsonKey(name: 'templateUID')
  final String? templateUID;
  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'tags', defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(
    name: 'visibility',
    toJson: ruleDTOVisibilityToJson,
    fromJson: ruleDTOVisibilityFromJson,
  )
  final enums.RuleDTOVisibility? visibility;
  @JsonKey(name: 'description')
  final String? description;
  static const fromJsonFactory = _$RuleDTOFromJson;
  static const toJsonFactory = _$RuleDTOToJson;
  Map<String, dynamic> toJson() => _$RuleDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RuleDTO &&
            (identical(other.triggers, triggers) ||
                const DeepCollectionEquality()
                    .equals(other.triggers, triggers)) &&
            (identical(other.conditions, conditions) ||
                const DeepCollectionEquality()
                    .equals(other.conditions, conditions)) &&
            (identical(other.actions, actions) ||
                const DeepCollectionEquality()
                    .equals(other.actions, actions)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.configDescriptions, configDescriptions) ||
                const DeepCollectionEquality()
                    .equals(other.configDescriptions, configDescriptions)) &&
            (identical(other.templateUID, templateUID) ||
                const DeepCollectionEquality()
                    .equals(other.templateUID, templateUID)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(triggers) ^
      const DeepCollectionEquality().hash(conditions) ^
      const DeepCollectionEquality().hash(actions) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(configDescriptions) ^
      const DeepCollectionEquality().hash(templateUID) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $RuleDTOExtension on RuleDTO {
  RuleDTO copyWith(
      {List<TriggerDTO>? triggers,
      List<ConditionDTO>? conditions,
      List<ActionDTO>? actions,
      Map<String, dynamic>? configuration,
      List<ConfigDescriptionParameterDTO>? configDescriptions,
      String? templateUID,
      String? uid,
      String? name,
      List<String>? tags,
      enums.RuleDTOVisibility? visibility,
      String? description}) {
    return RuleDTO(
        triggers: triggers ?? this.triggers,
        conditions: conditions ?? this.conditions,
        actions: actions ?? this.actions,
        configuration: configuration ?? this.configuration,
        configDescriptions: configDescriptions ?? this.configDescriptions,
        templateUID: templateUID ?? this.templateUID,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        tags: tags ?? this.tags,
        visibility: visibility ?? this.visibility,
        description: description ?? this.description);
  }

  RuleDTO copyWithWrapped(
      {Wrapped<List<TriggerDTO>?>? triggers,
      Wrapped<List<ConditionDTO>?>? conditions,
      Wrapped<List<ActionDTO>?>? actions,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<List<ConfigDescriptionParameterDTO>?>? configDescriptions,
      Wrapped<String?>? templateUID,
      Wrapped<String?>? uid,
      Wrapped<String?>? name,
      Wrapped<List<String>?>? tags,
      Wrapped<enums.RuleDTOVisibility?>? visibility,
      Wrapped<String?>? description}) {
    return RuleDTO(
        triggers: (triggers != null ? triggers.value : this.triggers),
        conditions: (conditions != null ? conditions.value : this.conditions),
        actions: (actions != null ? actions.value : this.actions),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        configDescriptions: (configDescriptions != null
            ? configDescriptions.value
            : this.configDescriptions),
        templateUID:
            (templateUID != null ? templateUID.value : this.templateUID),
        uid: (uid != null ? uid.value : this.uid),
        name: (name != null ? name.value : this.name),
        tags: (tags != null ? tags.value : this.tags),
        visibility: (visibility != null ? visibility.value : this.visibility),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class TriggerDTO {
  TriggerDTO({
    this.id,
    this.label,
    this.description,
    this.configuration,
    this.type,
  });

  factory TriggerDTO.fromJson(Map<String, dynamic> json) =>
      _$TriggerDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(name: 'type')
  final String? type;
  static const fromJsonFactory = _$TriggerDTOFromJson;
  static const toJsonFactory = _$TriggerDTOToJson;
  Map<String, dynamic> toJson() => _$TriggerDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TriggerDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $TriggerDTOExtension on TriggerDTO {
  TriggerDTO copyWith(
      {String? id,
      String? label,
      String? description,
      Map<String, dynamic>? configuration,
      String? type}) {
    return TriggerDTO(
        id: id ?? this.id,
        label: label ?? this.label,
        description: description ?? this.description,
        configuration: configuration ?? this.configuration,
        type: type ?? this.type);
  }

  TriggerDTO copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<String?>? type}) {
    return TriggerDTO(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        type: (type != null ? type.value : this.type));
  }
}

@JsonSerializable(explicitToJson: true)
class EnrichedRuleDTO {
  EnrichedRuleDTO({
    this.triggers,
    this.conditions,
    this.actions,
    this.configuration,
    this.configDescriptions,
    this.templateUID,
    this.uid,
    this.name,
    this.tags,
    this.visibility,
    this.description,
    this.status,
    this.editable,
  });

  factory EnrichedRuleDTO.fromJson(Map<String, dynamic> json) =>
      _$EnrichedRuleDTOFromJson(json);

  @JsonKey(name: 'triggers', defaultValue: <TriggerDTO>[])
  final List<TriggerDTO>? triggers;
  @JsonKey(name: 'conditions', defaultValue: <ConditionDTO>[])
  final List<ConditionDTO>? conditions;
  @JsonKey(name: 'actions', defaultValue: <ActionDTO>[])
  final List<ActionDTO>? actions;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(
      name: 'configDescriptions',
      defaultValue: <ConfigDescriptionParameterDTO>[])
  final List<ConfigDescriptionParameterDTO>? configDescriptions;
  @JsonKey(name: 'templateUID')
  final String? templateUID;
  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'tags', defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(
    name: 'visibility',
    toJson: enrichedRuleDTOVisibilityToJson,
    fromJson: enrichedRuleDTOVisibilityFromJson,
  )
  final enums.EnrichedRuleDTOVisibility? visibility;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'status')
  final RuleStatusInfo? status;
  @JsonKey(name: 'editable')
  final bool? editable;
  static const fromJsonFactory = _$EnrichedRuleDTOFromJson;
  static const toJsonFactory = _$EnrichedRuleDTOToJson;
  Map<String, dynamic> toJson() => _$EnrichedRuleDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EnrichedRuleDTO &&
            (identical(other.triggers, triggers) ||
                const DeepCollectionEquality()
                    .equals(other.triggers, triggers)) &&
            (identical(other.conditions, conditions) ||
                const DeepCollectionEquality()
                    .equals(other.conditions, conditions)) &&
            (identical(other.actions, actions) ||
                const DeepCollectionEquality()
                    .equals(other.actions, actions)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.configDescriptions, configDescriptions) ||
                const DeepCollectionEquality()
                    .equals(other.configDescriptions, configDescriptions)) &&
            (identical(other.templateUID, templateUID) ||
                const DeepCollectionEquality()
                    .equals(other.templateUID, templateUID)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.editable, editable) ||
                const DeepCollectionEquality()
                    .equals(other.editable, editable)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(triggers) ^
      const DeepCollectionEquality().hash(conditions) ^
      const DeepCollectionEquality().hash(actions) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(configDescriptions) ^
      const DeepCollectionEquality().hash(templateUID) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(editable) ^
      runtimeType.hashCode;
}

extension $EnrichedRuleDTOExtension on EnrichedRuleDTO {
  EnrichedRuleDTO copyWith(
      {List<TriggerDTO>? triggers,
      List<ConditionDTO>? conditions,
      List<ActionDTO>? actions,
      Map<String, dynamic>? configuration,
      List<ConfigDescriptionParameterDTO>? configDescriptions,
      String? templateUID,
      String? uid,
      String? name,
      List<String>? tags,
      enums.EnrichedRuleDTOVisibility? visibility,
      String? description,
      RuleStatusInfo? status,
      bool? editable}) {
    return EnrichedRuleDTO(
        triggers: triggers ?? this.triggers,
        conditions: conditions ?? this.conditions,
        actions: actions ?? this.actions,
        configuration: configuration ?? this.configuration,
        configDescriptions: configDescriptions ?? this.configDescriptions,
        templateUID: templateUID ?? this.templateUID,
        uid: uid ?? this.uid,
        name: name ?? this.name,
        tags: tags ?? this.tags,
        visibility: visibility ?? this.visibility,
        description: description ?? this.description,
        status: status ?? this.status,
        editable: editable ?? this.editable);
  }

  EnrichedRuleDTO copyWithWrapped(
      {Wrapped<List<TriggerDTO>?>? triggers,
      Wrapped<List<ConditionDTO>?>? conditions,
      Wrapped<List<ActionDTO>?>? actions,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<List<ConfigDescriptionParameterDTO>?>? configDescriptions,
      Wrapped<String?>? templateUID,
      Wrapped<String?>? uid,
      Wrapped<String?>? name,
      Wrapped<List<String>?>? tags,
      Wrapped<enums.EnrichedRuleDTOVisibility?>? visibility,
      Wrapped<String?>? description,
      Wrapped<RuleStatusInfo?>? status,
      Wrapped<bool?>? editable}) {
    return EnrichedRuleDTO(
        triggers: (triggers != null ? triggers.value : this.triggers),
        conditions: (conditions != null ? conditions.value : this.conditions),
        actions: (actions != null ? actions.value : this.actions),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        configDescriptions: (configDescriptions != null
            ? configDescriptions.value
            : this.configDescriptions),
        templateUID:
            (templateUID != null ? templateUID.value : this.templateUID),
        uid: (uid != null ? uid.value : this.uid),
        name: (name != null ? name.value : this.name),
        tags: (tags != null ? tags.value : this.tags),
        visibility: (visibility != null ? visibility.value : this.visibility),
        description:
            (description != null ? description.value : this.description),
        status: (status != null ? status.value : this.status),
        editable: (editable != null ? editable.value : this.editable));
  }
}

@JsonSerializable(explicitToJson: true)
class RuleStatusInfo {
  RuleStatusInfo({
    this.status,
    this.statusDetail,
    this.description,
  });

  factory RuleStatusInfo.fromJson(Map<String, dynamic> json) =>
      _$RuleStatusInfoFromJson(json);

  @JsonKey(
    name: 'status',
    toJson: ruleStatusInfoStatusToJson,
    fromJson: ruleStatusInfoStatusFromJson,
  )
  final enums.RuleStatusInfoStatus? status;
  @JsonKey(
    name: 'statusDetail',
    toJson: ruleStatusInfoStatusDetailToJson,
    fromJson: ruleStatusInfoStatusDetailFromJson,
  )
  final enums.RuleStatusInfoStatusDetail? statusDetail;
  @JsonKey(name: 'description')
  final String? description;
  static const fromJsonFactory = _$RuleStatusInfoFromJson;
  static const toJsonFactory = _$RuleStatusInfoToJson;
  Map<String, dynamic> toJson() => _$RuleStatusInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RuleStatusInfo &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusDetail, statusDetail) ||
                const DeepCollectionEquality()
                    .equals(other.statusDetail, statusDetail)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusDetail) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $RuleStatusInfoExtension on RuleStatusInfo {
  RuleStatusInfo copyWith(
      {enums.RuleStatusInfoStatus? status,
      enums.RuleStatusInfoStatusDetail? statusDetail,
      String? description}) {
    return RuleStatusInfo(
        status: status ?? this.status,
        statusDetail: statusDetail ?? this.statusDetail,
        description: description ?? this.description);
  }

  RuleStatusInfo copyWithWrapped(
      {Wrapped<enums.RuleStatusInfoStatus?>? status,
      Wrapped<enums.RuleStatusInfoStatusDetail?>? statusDetail,
      Wrapped<String?>? description}) {
    return RuleStatusInfo(
        status: (status != null ? status.value : this.status),
        statusDetail:
            (statusDetail != null ? statusDetail.value : this.statusDetail),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class ModuleDTO {
  ModuleDTO({
    this.id,
    this.label,
    this.description,
    this.configuration,
    this.type,
  });

  factory ModuleDTO.fromJson(Map<String, dynamic> json) =>
      _$ModuleDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(name: 'type')
  final String? type;
  static const fromJsonFactory = _$ModuleDTOFromJson;
  static const toJsonFactory = _$ModuleDTOToJson;
  Map<String, dynamic> toJson() => _$ModuleDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ModuleDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $ModuleDTOExtension on ModuleDTO {
  ModuleDTO copyWith(
      {String? id,
      String? label,
      String? description,
      Map<String, dynamic>? configuration,
      String? type}) {
    return ModuleDTO(
        id: id ?? this.id,
        label: label ?? this.label,
        description: description ?? this.description,
        configuration: configuration ?? this.configuration,
        type: type ?? this.type);
  }

  ModuleDTO copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<String?>? type}) {
    return ModuleDTO(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        type: (type != null ? type.value : this.type));
  }
}

@JsonSerializable(explicitToJson: true)
class Action {
  Action({
    this.inputs,
    this.typeUID,
    this.configuration,
    this.label,
    this.description,
    this.id,
  });

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  @JsonKey(name: 'inputs')
  final Map<String, dynamic>? inputs;
  @JsonKey(name: 'typeUID')
  final String? typeUID;
  @JsonKey(name: 'configuration')
  final Configuration? configuration;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'id')
  final String? id;
  static const fromJsonFactory = _$ActionFromJson;
  static const toJsonFactory = _$ActionToJson;
  Map<String, dynamic> toJson() => _$ActionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Action &&
            (identical(other.inputs, inputs) ||
                const DeepCollectionEquality().equals(other.inputs, inputs)) &&
            (identical(other.typeUID, typeUID) ||
                const DeepCollectionEquality()
                    .equals(other.typeUID, typeUID)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(inputs) ^
      const DeepCollectionEquality().hash(typeUID) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $ActionExtension on Action {
  Action copyWith(
      {Map<String, dynamic>? inputs,
      String? typeUID,
      Configuration? configuration,
      String? label,
      String? description,
      String? id}) {
    return Action(
        inputs: inputs ?? this.inputs,
        typeUID: typeUID ?? this.typeUID,
        configuration: configuration ?? this.configuration,
        label: label ?? this.label,
        description: description ?? this.description,
        id: id ?? this.id);
  }

  Action copyWithWrapped(
      {Wrapped<Map<String, dynamic>?>? inputs,
      Wrapped<String?>? typeUID,
      Wrapped<Configuration?>? configuration,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<String?>? id}) {
    return Action(
        inputs: (inputs != null ? inputs.value : this.inputs),
        typeUID: (typeUID != null ? typeUID.value : this.typeUID),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class Condition {
  Condition({
    this.inputs,
    this.typeUID,
    this.configuration,
    this.label,
    this.description,
    this.id,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  @JsonKey(name: 'inputs')
  final Map<String, dynamic>? inputs;
  @JsonKey(name: 'typeUID')
  final String? typeUID;
  @JsonKey(name: 'configuration')
  final Configuration? configuration;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'id')
  final String? id;
  static const fromJsonFactory = _$ConditionFromJson;
  static const toJsonFactory = _$ConditionToJson;
  Map<String, dynamic> toJson() => _$ConditionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Condition &&
            (identical(other.inputs, inputs) ||
                const DeepCollectionEquality().equals(other.inputs, inputs)) &&
            (identical(other.typeUID, typeUID) ||
                const DeepCollectionEquality()
                    .equals(other.typeUID, typeUID)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(inputs) ^
      const DeepCollectionEquality().hash(typeUID) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $ConditionExtension on Condition {
  Condition copyWith(
      {Map<String, dynamic>? inputs,
      String? typeUID,
      Configuration? configuration,
      String? label,
      String? description,
      String? id}) {
    return Condition(
        inputs: inputs ?? this.inputs,
        typeUID: typeUID ?? this.typeUID,
        configuration: configuration ?? this.configuration,
        label: label ?? this.label,
        description: description ?? this.description,
        id: id ?? this.id);
  }

  Condition copyWithWrapped(
      {Wrapped<Map<String, dynamic>?>? inputs,
      Wrapped<String?>? typeUID,
      Wrapped<Configuration?>? configuration,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<String?>? id}) {
    return Condition(
        inputs: (inputs != null ? inputs.value : this.inputs),
        typeUID: (typeUID != null ? typeUID.value : this.typeUID),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class ConfigDescriptionParameter {
  ConfigDescriptionParameter({
    this.name,
    this.type,
    this.groupName,
    this.pattern,
    this.required,
    this.readOnly,
    this.multiple,
    this.multipleLimit,
    this.unit,
    this.unitLabel,
    this.context,
    this.label,
    this.description,
    this.options,
    this.filterCriteria,
    this.limitToOptions,
    this.advanced,
    this.verifyable,
    this.stepSize,
    this.minimum,
    this.maximum,
    this.$default,
  });

  factory ConfigDescriptionParameter.fromJson(Map<String, dynamic> json) =>
      _$ConfigDescriptionParameterFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(
    name: 'type',
    toJson: configDescriptionParameterTypeToJson,
    fromJson: configDescriptionParameterTypeFromJson,
  )
  final enums.ConfigDescriptionParameterType? type;
  @JsonKey(name: 'groupName')
  final String? groupName;
  @JsonKey(name: 'pattern')
  final String? pattern;
  @JsonKey(name: 'required')
  final bool? required;
  @JsonKey(name: 'readOnly')
  final bool? readOnly;
  @JsonKey(name: 'multiple')
  final bool? multiple;
  @JsonKey(name: 'multipleLimit')
  final int? multipleLimit;
  @JsonKey(name: 'unit')
  final String? unit;
  @JsonKey(name: 'unitLabel')
  final String? unitLabel;
  @JsonKey(name: 'context')
  final String? context;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'options', defaultValue: <ParameterOption>[])
  final List<ParameterOption>? options;
  @JsonKey(name: 'filterCriteria', defaultValue: <FilterCriteria>[])
  final List<FilterCriteria>? filterCriteria;
  @JsonKey(name: 'limitToOptions')
  final bool? limitToOptions;
  @JsonKey(name: 'advanced')
  final bool? advanced;
  @JsonKey(name: 'verifyable')
  final bool? verifyable;
  @JsonKey(name: 'stepSize')
  final double? stepSize;
  @JsonKey(name: 'minimum')
  final double? minimum;
  @JsonKey(name: 'maximum')
  final double? maximum;
  @JsonKey(name: 'default')
  final String? $default;
  static const fromJsonFactory = _$ConfigDescriptionParameterFromJson;
  static const toJsonFactory = _$ConfigDescriptionParameterToJson;
  Map<String, dynamic> toJson() => _$ConfigDescriptionParameterToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfigDescriptionParameter &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.groupName, groupName) ||
                const DeepCollectionEquality()
                    .equals(other.groupName, groupName)) &&
            (identical(other.pattern, pattern) ||
                const DeepCollectionEquality()
                    .equals(other.pattern, pattern)) &&
            (identical(other.required, required) ||
                const DeepCollectionEquality()
                    .equals(other.required, required)) &&
            (identical(other.readOnly, readOnly) ||
                const DeepCollectionEquality()
                    .equals(other.readOnly, readOnly)) &&
            (identical(other.multiple, multiple) ||
                const DeepCollectionEquality()
                    .equals(other.multiple, multiple)) &&
            (identical(other.multipleLimit, multipleLimit) ||
                const DeepCollectionEquality()
                    .equals(other.multipleLimit, multipleLimit)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.unitLabel, unitLabel) ||
                const DeepCollectionEquality()
                    .equals(other.unitLabel, unitLabel)) &&
            (identical(other.context, context) ||
                const DeepCollectionEquality()
                    .equals(other.context, context)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality()
                    .equals(other.options, options)) &&
            (identical(other.filterCriteria, filterCriteria) ||
                const DeepCollectionEquality()
                    .equals(other.filterCriteria, filterCriteria)) &&
            (identical(other.limitToOptions, limitToOptions) ||
                const DeepCollectionEquality()
                    .equals(other.limitToOptions, limitToOptions)) &&
            (identical(other.advanced, advanced) ||
                const DeepCollectionEquality()
                    .equals(other.advanced, advanced)) &&
            (identical(other.verifyable, verifyable) ||
                const DeepCollectionEquality()
                    .equals(other.verifyable, verifyable)) &&
            (identical(other.stepSize, stepSize) ||
                const DeepCollectionEquality()
                    .equals(other.stepSize, stepSize)) &&
            (identical(other.minimum, minimum) ||
                const DeepCollectionEquality()
                    .equals(other.minimum, minimum)) &&
            (identical(other.maximum, maximum) ||
                const DeepCollectionEquality()
                    .equals(other.maximum, maximum)) &&
            (identical(other.$default, $default) ||
                const DeepCollectionEquality()
                    .equals(other.$default, $default)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(groupName) ^
      const DeepCollectionEquality().hash(pattern) ^
      const DeepCollectionEquality().hash(required) ^
      const DeepCollectionEquality().hash(readOnly) ^
      const DeepCollectionEquality().hash(multiple) ^
      const DeepCollectionEquality().hash(multipleLimit) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(unitLabel) ^
      const DeepCollectionEquality().hash(context) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(options) ^
      const DeepCollectionEquality().hash(filterCriteria) ^
      const DeepCollectionEquality().hash(limitToOptions) ^
      const DeepCollectionEquality().hash(advanced) ^
      const DeepCollectionEquality().hash(verifyable) ^
      const DeepCollectionEquality().hash(stepSize) ^
      const DeepCollectionEquality().hash(minimum) ^
      const DeepCollectionEquality().hash(maximum) ^
      const DeepCollectionEquality().hash($default) ^
      runtimeType.hashCode;
}

extension $ConfigDescriptionParameterExtension on ConfigDescriptionParameter {
  ConfigDescriptionParameter copyWith(
      {String? name,
      enums.ConfigDescriptionParameterType? type,
      String? groupName,
      String? pattern,
      bool? required,
      bool? readOnly,
      bool? multiple,
      int? multipleLimit,
      String? unit,
      String? unitLabel,
      String? context,
      String? label,
      String? description,
      List<ParameterOption>? options,
      List<FilterCriteria>? filterCriteria,
      bool? limitToOptions,
      bool? advanced,
      bool? verifyable,
      double? stepSize,
      double? minimum,
      double? maximum,
      String? $default}) {
    return ConfigDescriptionParameter(
        name: name ?? this.name,
        type: type ?? this.type,
        groupName: groupName ?? this.groupName,
        pattern: pattern ?? this.pattern,
        required: required ?? this.required,
        readOnly: readOnly ?? this.readOnly,
        multiple: multiple ?? this.multiple,
        multipleLimit: multipleLimit ?? this.multipleLimit,
        unit: unit ?? this.unit,
        unitLabel: unitLabel ?? this.unitLabel,
        context: context ?? this.context,
        label: label ?? this.label,
        description: description ?? this.description,
        options: options ?? this.options,
        filterCriteria: filterCriteria ?? this.filterCriteria,
        limitToOptions: limitToOptions ?? this.limitToOptions,
        advanced: advanced ?? this.advanced,
        verifyable: verifyable ?? this.verifyable,
        stepSize: stepSize ?? this.stepSize,
        minimum: minimum ?? this.minimum,
        maximum: maximum ?? this.maximum,
        $default: $default ?? this.$default);
  }

  ConfigDescriptionParameter copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<enums.ConfigDescriptionParameterType?>? type,
      Wrapped<String?>? groupName,
      Wrapped<String?>? pattern,
      Wrapped<bool?>? required,
      Wrapped<bool?>? readOnly,
      Wrapped<bool?>? multiple,
      Wrapped<int?>? multipleLimit,
      Wrapped<String?>? unit,
      Wrapped<String?>? unitLabel,
      Wrapped<String?>? context,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<List<ParameterOption>?>? options,
      Wrapped<List<FilterCriteria>?>? filterCriteria,
      Wrapped<bool?>? limitToOptions,
      Wrapped<bool?>? advanced,
      Wrapped<bool?>? verifyable,
      Wrapped<double?>? stepSize,
      Wrapped<double?>? minimum,
      Wrapped<double?>? maximum,
      Wrapped<String?>? $default}) {
    return ConfigDescriptionParameter(
        name: (name != null ? name.value : this.name),
        type: (type != null ? type.value : this.type),
        groupName: (groupName != null ? groupName.value : this.groupName),
        pattern: (pattern != null ? pattern.value : this.pattern),
        required: (required != null ? required.value : this.required),
        readOnly: (readOnly != null ? readOnly.value : this.readOnly),
        multiple: (multiple != null ? multiple.value : this.multiple),
        multipleLimit:
            (multipleLimit != null ? multipleLimit.value : this.multipleLimit),
        unit: (unit != null ? unit.value : this.unit),
        unitLabel: (unitLabel != null ? unitLabel.value : this.unitLabel),
        context: (context != null ? context.value : this.context),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        options: (options != null ? options.value : this.options),
        filterCriteria: (filterCriteria != null
            ? filterCriteria.value
            : this.filterCriteria),
        limitToOptions: (limitToOptions != null
            ? limitToOptions.value
            : this.limitToOptions),
        advanced: (advanced != null ? advanced.value : this.advanced),
        verifyable: (verifyable != null ? verifyable.value : this.verifyable),
        stepSize: (stepSize != null ? stepSize.value : this.stepSize),
        minimum: (minimum != null ? minimum.value : this.minimum),
        maximum: (maximum != null ? maximum.value : this.maximum),
        $default: ($default != null ? $default.value : this.$default));
  }
}

@JsonSerializable(explicitToJson: true)
class Configuration {
  Configuration({
    this.properties,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);

  @JsonKey(name: 'properties')
  final Map<String, dynamic>? properties;
  static const fromJsonFactory = _$ConfigurationFromJson;
  static const toJsonFactory = _$ConfigurationToJson;
  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Configuration &&
            (identical(other.properties, properties) ||
                const DeepCollectionEquality()
                    .equals(other.properties, properties)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(properties) ^ runtimeType.hashCode;
}

extension $ConfigurationExtension on Configuration {
  Configuration copyWith({Map<String, dynamic>? properties}) {
    return Configuration(properties: properties ?? this.properties);
  }

  Configuration copyWithWrapped({Wrapped<Map<String, dynamic>?>? properties}) {
    return Configuration(
        properties: (properties != null ? properties.value : this.properties));
  }
}

@JsonSerializable(explicitToJson: true)
class FilterCriteria {
  FilterCriteria({
    this.value,
    this.name,
  });

  factory FilterCriteria.fromJson(Map<String, dynamic> json) =>
      _$FilterCriteriaFromJson(json);

  @JsonKey(name: 'value')
  final String? value;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$FilterCriteriaFromJson;
  static const toJsonFactory = _$FilterCriteriaToJson;
  Map<String, dynamic> toJson() => _$FilterCriteriaToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FilterCriteria &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $FilterCriteriaExtension on FilterCriteria {
  FilterCriteria copyWith({String? value, String? name}) {
    return FilterCriteria(value: value ?? this.value, name: name ?? this.name);
  }

  FilterCriteria copyWithWrapped(
      {Wrapped<String?>? value, Wrapped<String?>? name}) {
    return FilterCriteria(
        value: (value != null ? value.value : this.value),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class Module {
  Module({
    this.typeUID,
    this.configuration,
    this.label,
    this.description,
    this.id,
  });

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);

  @JsonKey(name: 'typeUID')
  final String? typeUID;
  @JsonKey(name: 'configuration')
  final Configuration? configuration;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'id')
  final String? id;
  static const fromJsonFactory = _$ModuleFromJson;
  static const toJsonFactory = _$ModuleToJson;
  Map<String, dynamic> toJson() => _$ModuleToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Module &&
            (identical(other.typeUID, typeUID) ||
                const DeepCollectionEquality()
                    .equals(other.typeUID, typeUID)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(typeUID) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $ModuleExtension on Module {
  Module copyWith(
      {String? typeUID,
      Configuration? configuration,
      String? label,
      String? description,
      String? id}) {
    return Module(
        typeUID: typeUID ?? this.typeUID,
        configuration: configuration ?? this.configuration,
        label: label ?? this.label,
        description: description ?? this.description,
        id: id ?? this.id);
  }

  Module copyWithWrapped(
      {Wrapped<String?>? typeUID,
      Wrapped<Configuration?>? configuration,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<String?>? id}) {
    return Module(
        typeUID: (typeUID != null ? typeUID.value : this.typeUID),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class ParameterOption {
  ParameterOption({
    this.label,
    this.value,
  });

  factory ParameterOption.fromJson(Map<String, dynamic> json) =>
      _$ParameterOptionFromJson(json);

  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'value')
  final String? value;
  static const fromJsonFactory = _$ParameterOptionFromJson;
  static const toJsonFactory = _$ParameterOptionToJson;
  Map<String, dynamic> toJson() => _$ParameterOptionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ParameterOption &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $ParameterOptionExtension on ParameterOption {
  ParameterOption copyWith({String? label, String? value}) {
    return ParameterOption(
        label: label ?? this.label, value: value ?? this.value);
  }

  ParameterOption copyWithWrapped(
      {Wrapped<String?>? label, Wrapped<String?>? value}) {
    return ParameterOption(
        label: (label != null ? label.value : this.label),
        value: (value != null ? value.value : this.value));
  }
}

@JsonSerializable(explicitToJson: true)
class Rule {
  Rule({
    this.templateUID,
    this.configurationDescriptions,
    this.triggers,
    this.uid,
    this.visibility,
    this.conditions,
    this.configuration,
    this.modules,
    this.tags,
    this.description,
    this.name,
    this.actions,
  });

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  @JsonKey(name: 'templateUID')
  final String? templateUID;
  @JsonKey(
      name: 'configurationDescriptions',
      defaultValue: <ConfigDescriptionParameter>[])
  final List<ConfigDescriptionParameter>? configurationDescriptions;
  @JsonKey(name: 'triggers', defaultValue: <Trigger>[])
  final List<Trigger>? triggers;
  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(
    name: 'visibility',
    toJson: ruleVisibilityToJson,
    fromJson: ruleVisibilityFromJson,
  )
  final enums.RuleVisibility? visibility;
  @JsonKey(name: 'conditions', defaultValue: <Condition>[])
  final List<Condition>? conditions;
  @JsonKey(name: 'configuration')
  final Configuration? configuration;
  @JsonKey(name: 'modules', defaultValue: <Module>[])
  final List<Module>? modules;
  @JsonKey(name: 'tags', defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'actions', defaultValue: <Action>[])
  final List<Action>? actions;
  static const fromJsonFactory = _$RuleFromJson;
  static const toJsonFactory = _$RuleToJson;
  Map<String, dynamic> toJson() => _$RuleToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Rule &&
            (identical(other.templateUID, templateUID) ||
                const DeepCollectionEquality()
                    .equals(other.templateUID, templateUID)) &&
            (identical(other.configurationDescriptions,
                    configurationDescriptions) ||
                const DeepCollectionEquality().equals(
                    other.configurationDescriptions,
                    configurationDescriptions)) &&
            (identical(other.triggers, triggers) ||
                const DeepCollectionEquality()
                    .equals(other.triggers, triggers)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.conditions, conditions) ||
                const DeepCollectionEquality()
                    .equals(other.conditions, conditions)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.modules, modules) ||
                const DeepCollectionEquality()
                    .equals(other.modules, modules)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.actions, actions) ||
                const DeepCollectionEquality().equals(other.actions, actions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(templateUID) ^
      const DeepCollectionEquality().hash(configurationDescriptions) ^
      const DeepCollectionEquality().hash(triggers) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(conditions) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(modules) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(actions) ^
      runtimeType.hashCode;
}

extension $RuleExtension on Rule {
  Rule copyWith(
      {String? templateUID,
      List<ConfigDescriptionParameter>? configurationDescriptions,
      List<Trigger>? triggers,
      String? uid,
      enums.RuleVisibility? visibility,
      List<Condition>? conditions,
      Configuration? configuration,
      List<Module>? modules,
      List<String>? tags,
      String? description,
      String? name,
      List<Action>? actions}) {
    return Rule(
        templateUID: templateUID ?? this.templateUID,
        configurationDescriptions:
            configurationDescriptions ?? this.configurationDescriptions,
        triggers: triggers ?? this.triggers,
        uid: uid ?? this.uid,
        visibility: visibility ?? this.visibility,
        conditions: conditions ?? this.conditions,
        configuration: configuration ?? this.configuration,
        modules: modules ?? this.modules,
        tags: tags ?? this.tags,
        description: description ?? this.description,
        name: name ?? this.name,
        actions: actions ?? this.actions);
  }

  Rule copyWithWrapped(
      {Wrapped<String?>? templateUID,
      Wrapped<List<ConfigDescriptionParameter>?>? configurationDescriptions,
      Wrapped<List<Trigger>?>? triggers,
      Wrapped<String?>? uid,
      Wrapped<enums.RuleVisibility?>? visibility,
      Wrapped<List<Condition>?>? conditions,
      Wrapped<Configuration?>? configuration,
      Wrapped<List<Module>?>? modules,
      Wrapped<List<String>?>? tags,
      Wrapped<String?>? description,
      Wrapped<String?>? name,
      Wrapped<List<Action>?>? actions}) {
    return Rule(
        templateUID:
            (templateUID != null ? templateUID.value : this.templateUID),
        configurationDescriptions: (configurationDescriptions != null
            ? configurationDescriptions.value
            : this.configurationDescriptions),
        triggers: (triggers != null ? triggers.value : this.triggers),
        uid: (uid != null ? uid.value : this.uid),
        visibility: (visibility != null ? visibility.value : this.visibility),
        conditions: (conditions != null ? conditions.value : this.conditions),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        modules: (modules != null ? modules.value : this.modules),
        tags: (tags != null ? tags.value : this.tags),
        description:
            (description != null ? description.value : this.description),
        name: (name != null ? name.value : this.name),
        actions: (actions != null ? actions.value : this.actions));
  }
}

@JsonSerializable(explicitToJson: true)
class RuleExecution {
  RuleExecution({
    this.date,
    this.rule,
  });

  factory RuleExecution.fromJson(Map<String, dynamic> json) =>
      _$RuleExecutionFromJson(json);

  @JsonKey(name: 'date')
  final DateTime? date;
  @JsonKey(name: 'rule')
  final Rule? rule;
  static const fromJsonFactory = _$RuleExecutionFromJson;
  static const toJsonFactory = _$RuleExecutionToJson;
  Map<String, dynamic> toJson() => _$RuleExecutionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RuleExecution &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.rule, rule) ||
                const DeepCollectionEquality().equals(other.rule, rule)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(rule) ^
      runtimeType.hashCode;
}

extension $RuleExecutionExtension on RuleExecution {
  RuleExecution copyWith({DateTime? date, Rule? rule}) {
    return RuleExecution(date: date ?? this.date, rule: rule ?? this.rule);
  }

  RuleExecution copyWithWrapped(
      {Wrapped<DateTime?>? date, Wrapped<Rule?>? rule}) {
    return RuleExecution(
        date: (date != null ? date.value : this.date),
        rule: (rule != null ? rule.value : this.rule));
  }
}

@JsonSerializable(explicitToJson: true)
class Trigger {
  Trigger({
    this.typeUID,
    this.configuration,
    this.label,
    this.description,
    this.id,
  });

  factory Trigger.fromJson(Map<String, dynamic> json) =>
      _$TriggerFromJson(json);

  @JsonKey(name: 'typeUID')
  final String? typeUID;
  @JsonKey(name: 'configuration')
  final Configuration? configuration;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'id')
  final String? id;
  static const fromJsonFactory = _$TriggerFromJson;
  static const toJsonFactory = _$TriggerToJson;
  Map<String, dynamic> toJson() => _$TriggerToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Trigger &&
            (identical(other.typeUID, typeUID) ||
                const DeepCollectionEquality()
                    .equals(other.typeUID, typeUID)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(typeUID) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $TriggerExtension on Trigger {
  Trigger copyWith(
      {String? typeUID,
      Configuration? configuration,
      String? label,
      String? description,
      String? id}) {
    return Trigger(
        typeUID: typeUID ?? this.typeUID,
        configuration: configuration ?? this.configuration,
        label: label ?? this.label,
        description: description ?? this.description,
        id: id ?? this.id);
  }

  Trigger copyWithWrapped(
      {Wrapped<String?>? typeUID,
      Wrapped<Configuration?>? configuration,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<String?>? id}) {
    return Trigger(
        typeUID: (typeUID != null ? typeUID.value : this.typeUID),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class Template {
  Template({
    this.uid,
    this.visibility,
    this.label,
    this.tags,
    this.description,
  });

  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);

  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(
    name: 'visibility',
    toJson: templateVisibilityToJson,
    fromJson: templateVisibilityFromJson,
  )
  final enums.TemplateVisibility? visibility;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'tags', defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(name: 'description')
  final String? description;
  static const fromJsonFactory = _$TemplateFromJson;
  static const toJsonFactory = _$TemplateToJson;
  Map<String, dynamic> toJson() => _$TemplateToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Template &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $TemplateExtension on Template {
  Template copyWith(
      {String? uid,
      enums.TemplateVisibility? visibility,
      String? label,
      List<String>? tags,
      String? description}) {
    return Template(
        uid: uid ?? this.uid,
        visibility: visibility ?? this.visibility,
        label: label ?? this.label,
        tags: tags ?? this.tags,
        description: description ?? this.description);
  }

  Template copyWithWrapped(
      {Wrapped<String?>? uid,
      Wrapped<enums.TemplateVisibility?>? visibility,
      Wrapped<String?>? label,
      Wrapped<List<String>?>? tags,
      Wrapped<String?>? description}) {
    return Template(
        uid: (uid != null ? uid.value : this.uid),
        visibility: (visibility != null ? visibility.value : this.visibility),
        label: (label != null ? label.value : this.label),
        tags: (tags != null ? tags.value : this.tags),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class AudioSinkDTO {
  AudioSinkDTO({
    this.id,
    this.label,
  });

  factory AudioSinkDTO.fromJson(Map<String, dynamic> json) =>
      _$AudioSinkDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  static const fromJsonFactory = _$AudioSinkDTOFromJson;
  static const toJsonFactory = _$AudioSinkDTOToJson;
  Map<String, dynamic> toJson() => _$AudioSinkDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AudioSinkDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      runtimeType.hashCode;
}

extension $AudioSinkDTOExtension on AudioSinkDTO {
  AudioSinkDTO copyWith({String? id, String? label}) {
    return AudioSinkDTO(id: id ?? this.id, label: label ?? this.label);
  }

  AudioSinkDTO copyWithWrapped(
      {Wrapped<String?>? id, Wrapped<String?>? label}) {
    return AudioSinkDTO(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label));
  }
}

@JsonSerializable(explicitToJson: true)
class AudioSourceDTO {
  AudioSourceDTO({
    this.id,
    this.label,
  });

  factory AudioSourceDTO.fromJson(Map<String, dynamic> json) =>
      _$AudioSourceDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  static const fromJsonFactory = _$AudioSourceDTOFromJson;
  static const toJsonFactory = _$AudioSourceDTOToJson;
  Map<String, dynamic> toJson() => _$AudioSourceDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AudioSourceDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      runtimeType.hashCode;
}

extension $AudioSourceDTOExtension on AudioSourceDTO {
  AudioSourceDTO copyWith({String? id, String? label}) {
    return AudioSourceDTO(id: id ?? this.id, label: label ?? this.label);
  }

  AudioSourceDTO copyWithWrapped(
      {Wrapped<String?>? id, Wrapped<String?>? label}) {
    return AudioSourceDTO(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label));
  }
}

@JsonSerializable(explicitToJson: true)
class UserApiTokenDTO {
  UserApiTokenDTO({
    this.name,
    this.createdTime,
    this.scope,
  });

  factory UserApiTokenDTO.fromJson(Map<String, dynamic> json) =>
      _$UserApiTokenDTOFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'createdTime')
  final DateTime? createdTime;
  @JsonKey(name: 'scope')
  final String? scope;
  static const fromJsonFactory = _$UserApiTokenDTOFromJson;
  static const toJsonFactory = _$UserApiTokenDTOToJson;
  Map<String, dynamic> toJson() => _$UserApiTokenDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserApiTokenDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.createdTime, createdTime) ||
                const DeepCollectionEquality()
                    .equals(other.createdTime, createdTime)) &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(createdTime) ^
      const DeepCollectionEquality().hash(scope) ^
      runtimeType.hashCode;
}

extension $UserApiTokenDTOExtension on UserApiTokenDTO {
  UserApiTokenDTO copyWith(
      {String? name, DateTime? createdTime, String? scope}) {
    return UserApiTokenDTO(
        name: name ?? this.name,
        createdTime: createdTime ?? this.createdTime,
        scope: scope ?? this.scope);
  }

  UserApiTokenDTO copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<DateTime?>? createdTime,
      Wrapped<String?>? scope}) {
    return UserApiTokenDTO(
        name: (name != null ? name.value : this.name),
        createdTime:
            (createdTime != null ? createdTime.value : this.createdTime),
        scope: (scope != null ? scope.value : this.scope));
  }
}

@JsonSerializable(explicitToJson: true)
class UserSessionDTO {
  UserSessionDTO({
    this.sessionId,
    this.createdTime,
    this.lastRefreshTime,
    this.clientId,
    this.scope,
  });

  factory UserSessionDTO.fromJson(Map<String, dynamic> json) =>
      _$UserSessionDTOFromJson(json);

  @JsonKey(name: 'sessionId')
  final String? sessionId;
  @JsonKey(name: 'createdTime')
  final DateTime? createdTime;
  @JsonKey(name: 'lastRefreshTime')
  final DateTime? lastRefreshTime;
  @JsonKey(name: 'clientId')
  final String? clientId;
  @JsonKey(name: 'scope')
  final String? scope;
  static const fromJsonFactory = _$UserSessionDTOFromJson;
  static const toJsonFactory = _$UserSessionDTOToJson;
  Map<String, dynamic> toJson() => _$UserSessionDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserSessionDTO &&
            (identical(other.sessionId, sessionId) ||
                const DeepCollectionEquality()
                    .equals(other.sessionId, sessionId)) &&
            (identical(other.createdTime, createdTime) ||
                const DeepCollectionEquality()
                    .equals(other.createdTime, createdTime)) &&
            (identical(other.lastRefreshTime, lastRefreshTime) ||
                const DeepCollectionEquality()
                    .equals(other.lastRefreshTime, lastRefreshTime)) &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sessionId) ^
      const DeepCollectionEquality().hash(createdTime) ^
      const DeepCollectionEquality().hash(lastRefreshTime) ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(scope) ^
      runtimeType.hashCode;
}

extension $UserSessionDTOExtension on UserSessionDTO {
  UserSessionDTO copyWith(
      {String? sessionId,
      DateTime? createdTime,
      DateTime? lastRefreshTime,
      String? clientId,
      String? scope}) {
    return UserSessionDTO(
        sessionId: sessionId ?? this.sessionId,
        createdTime: createdTime ?? this.createdTime,
        lastRefreshTime: lastRefreshTime ?? this.lastRefreshTime,
        clientId: clientId ?? this.clientId,
        scope: scope ?? this.scope);
  }

  UserSessionDTO copyWithWrapped(
      {Wrapped<String?>? sessionId,
      Wrapped<DateTime?>? createdTime,
      Wrapped<DateTime?>? lastRefreshTime,
      Wrapped<String?>? clientId,
      Wrapped<String?>? scope}) {
    return UserSessionDTO(
        sessionId: (sessionId != null ? sessionId.value : this.sessionId),
        createdTime:
            (createdTime != null ? createdTime.value : this.createdTime),
        lastRefreshTime: (lastRefreshTime != null
            ? lastRefreshTime.value
            : this.lastRefreshTime),
        clientId: (clientId != null ? clientId.value : this.clientId),
        scope: (scope != null ? scope.value : this.scope));
  }
}

@JsonSerializable(explicitToJson: true)
class TokenResponseDTO {
  TokenResponseDTO({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
    this.scope,
    this.user,
  });

  factory TokenResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseDTOFromJson(json);

  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @JsonKey(name: 'scope')
  final String? scope;
  @JsonKey(name: 'user')
  final UserDTO? user;
  static const fromJsonFactory = _$TokenResponseDTOFromJson;
  static const toJsonFactory = _$TokenResponseDTOToJson;
  Map<String, dynamic> toJson() => _$TokenResponseDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TokenResponseDTO &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.tokenType, tokenType) ||
                const DeepCollectionEquality()
                    .equals(other.tokenType, tokenType)) &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresIn, expiresIn)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(tokenType) ^
      const DeepCollectionEquality().hash(expiresIn) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(scope) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $TokenResponseDTOExtension on TokenResponseDTO {
  TokenResponseDTO copyWith(
      {String? accessToken,
      String? tokenType,
      int? expiresIn,
      String? refreshToken,
      String? scope,
      UserDTO? user}) {
    return TokenResponseDTO(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        refreshToken: refreshToken ?? this.refreshToken,
        scope: scope ?? this.scope,
        user: user ?? this.user);
  }

  TokenResponseDTO copyWithWrapped(
      {Wrapped<String?>? accessToken,
      Wrapped<String?>? tokenType,
      Wrapped<int?>? expiresIn,
      Wrapped<String?>? refreshToken,
      Wrapped<String?>? scope,
      Wrapped<UserDTO?>? user}) {
    return TokenResponseDTO(
        accessToken:
            (accessToken != null ? accessToken.value : this.accessToken),
        tokenType: (tokenType != null ? tokenType.value : this.tokenType),
        expiresIn: (expiresIn != null ? expiresIn.value : this.expiresIn),
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken),
        scope: (scope != null ? scope.value : this.scope),
        user: (user != null ? user.value : this.user));
  }
}

@JsonSerializable(explicitToJson: true)
class UserDTO {
  UserDTO({
    this.name,
    this.roles,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'roles', defaultValue: <String>[])
  final List<String>? roles;
  static const fromJsonFactory = _$UserDTOFromJson;
  static const toJsonFactory = _$UserDTOToJson;
  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(roles) ^
      runtimeType.hashCode;
}

extension $UserDTOExtension on UserDTO {
  UserDTO copyWith({String? name, List<String>? roles}) {
    return UserDTO(name: name ?? this.name, roles: roles ?? this.roles);
  }

  UserDTO copyWithWrapped(
      {Wrapped<String?>? name, Wrapped<List<String>?>? roles}) {
    return UserDTO(
        name: (name != null ? name.value : this.name),
        roles: (roles != null ? roles.value : this.roles));
  }
}

@JsonSerializable(explicitToJson: true)
class Addon {
  Addon({
    this.id,
    this.label,
    this.version,
    this.maturity,
    this.compatible,
    this.contentType,
    this.link,
    this.author,
    this.verifiedAuthor,
    this.installed,
    this.type,
    this.description,
    this.detailedDescription,
    this.configDescriptionURI,
    this.keywords,
    this.countries,
    this.license,
    this.connection,
    this.backgroundColor,
    this.imageLink,
    this.properties,
    this.loggerPackages,
  });

  factory Addon.fromJson(Map<String, dynamic> json) => _$AddonFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'maturity')
  final String? maturity;
  @JsonKey(name: 'compatible')
  final bool? compatible;
  @JsonKey(name: 'contentType')
  final String? contentType;
  @JsonKey(name: 'link')
  final String? link;
  @JsonKey(name: 'author')
  final String? author;
  @JsonKey(name: 'verifiedAuthor')
  final bool? verifiedAuthor;
  @JsonKey(name: 'installed')
  final bool? installed;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'detailedDescription')
  final String? detailedDescription;
  @JsonKey(name: 'configDescriptionURI')
  final String? configDescriptionURI;
  @JsonKey(name: 'keywords')
  final String? keywords;
  @JsonKey(name: 'countries')
  final String? countries;
  @JsonKey(name: 'license')
  final String? license;
  @JsonKey(name: 'connection')
  final String? connection;
  @JsonKey(name: 'backgroundColor')
  final String? backgroundColor;
  @JsonKey(name: 'imageLink')
  final String? imageLink;
  @JsonKey(name: 'properties')
  final Map<String, dynamic>? properties;
  @JsonKey(name: 'loggerPackages', defaultValue: <String>[])
  final List<String>? loggerPackages;
  static const fromJsonFactory = _$AddonFromJson;
  static const toJsonFactory = _$AddonToJson;
  Map<String, dynamic> toJson() => _$AddonToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Addon &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.maturity, maturity) ||
                const DeepCollectionEquality()
                    .equals(other.maturity, maturity)) &&
            (identical(other.compatible, compatible) ||
                const DeepCollectionEquality()
                    .equals(other.compatible, compatible)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.verifiedAuthor, verifiedAuthor) ||
                const DeepCollectionEquality()
                    .equals(other.verifiedAuthor, verifiedAuthor)) &&
            (identical(other.installed, installed) ||
                const DeepCollectionEquality()
                    .equals(other.installed, installed)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.detailedDescription, detailedDescription) ||
                const DeepCollectionEquality()
                    .equals(other.detailedDescription, detailedDescription)) &&
            (identical(other.configDescriptionURI, configDescriptionURI) ||
                const DeepCollectionEquality().equals(
                    other.configDescriptionURI, configDescriptionURI)) &&
            (identical(other.keywords, keywords) ||
                const DeepCollectionEquality()
                    .equals(other.keywords, keywords)) &&
            (identical(other.countries, countries) ||
                const DeepCollectionEquality()
                    .equals(other.countries, countries)) &&
            (identical(other.license, license) ||
                const DeepCollectionEquality()
                    .equals(other.license, license)) &&
            (identical(other.connection, connection) ||
                const DeepCollectionEquality()
                    .equals(other.connection, connection)) &&
            (identical(other.backgroundColor, backgroundColor) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundColor, backgroundColor)) &&
            (identical(other.imageLink, imageLink) ||
                const DeepCollectionEquality()
                    .equals(other.imageLink, imageLink)) &&
            (identical(other.properties, properties) ||
                const DeepCollectionEquality()
                    .equals(other.properties, properties)) &&
            (identical(other.loggerPackages, loggerPackages) ||
                const DeepCollectionEquality()
                    .equals(other.loggerPackages, loggerPackages)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(maturity) ^
      const DeepCollectionEquality().hash(compatible) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(link) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(verifiedAuthor) ^
      const DeepCollectionEquality().hash(installed) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(detailedDescription) ^
      const DeepCollectionEquality().hash(configDescriptionURI) ^
      const DeepCollectionEquality().hash(keywords) ^
      const DeepCollectionEquality().hash(countries) ^
      const DeepCollectionEquality().hash(license) ^
      const DeepCollectionEquality().hash(connection) ^
      const DeepCollectionEquality().hash(backgroundColor) ^
      const DeepCollectionEquality().hash(imageLink) ^
      const DeepCollectionEquality().hash(properties) ^
      const DeepCollectionEquality().hash(loggerPackages) ^
      runtimeType.hashCode;
}

extension $AddonExtension on Addon {
  Addon copyWith(
      {String? id,
      String? label,
      String? version,
      String? maturity,
      bool? compatible,
      String? contentType,
      String? link,
      String? author,
      bool? verifiedAuthor,
      bool? installed,
      String? type,
      String? description,
      String? detailedDescription,
      String? configDescriptionURI,
      String? keywords,
      String? countries,
      String? license,
      String? connection,
      String? backgroundColor,
      String? imageLink,
      Map<String, dynamic>? properties,
      List<String>? loggerPackages}) {
    return Addon(
        id: id ?? this.id,
        label: label ?? this.label,
        version: version ?? this.version,
        maturity: maturity ?? this.maturity,
        compatible: compatible ?? this.compatible,
        contentType: contentType ?? this.contentType,
        link: link ?? this.link,
        author: author ?? this.author,
        verifiedAuthor: verifiedAuthor ?? this.verifiedAuthor,
        installed: installed ?? this.installed,
        type: type ?? this.type,
        description: description ?? this.description,
        detailedDescription: detailedDescription ?? this.detailedDescription,
        configDescriptionURI: configDescriptionURI ?? this.configDescriptionURI,
        keywords: keywords ?? this.keywords,
        countries: countries ?? this.countries,
        license: license ?? this.license,
        connection: connection ?? this.connection,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        imageLink: imageLink ?? this.imageLink,
        properties: properties ?? this.properties,
        loggerPackages: loggerPackages ?? this.loggerPackages);
  }

  Addon copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? label,
      Wrapped<String?>? version,
      Wrapped<String?>? maturity,
      Wrapped<bool?>? compatible,
      Wrapped<String?>? contentType,
      Wrapped<String?>? link,
      Wrapped<String?>? author,
      Wrapped<bool?>? verifiedAuthor,
      Wrapped<bool?>? installed,
      Wrapped<String?>? type,
      Wrapped<String?>? description,
      Wrapped<String?>? detailedDescription,
      Wrapped<String?>? configDescriptionURI,
      Wrapped<String?>? keywords,
      Wrapped<String?>? countries,
      Wrapped<String?>? license,
      Wrapped<String?>? connection,
      Wrapped<String?>? backgroundColor,
      Wrapped<String?>? imageLink,
      Wrapped<Map<String, dynamic>?>? properties,
      Wrapped<List<String>?>? loggerPackages}) {
    return Addon(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label),
        version: (version != null ? version.value : this.version),
        maturity: (maturity != null ? maturity.value : this.maturity),
        compatible: (compatible != null ? compatible.value : this.compatible),
        contentType:
            (contentType != null ? contentType.value : this.contentType),
        link: (link != null ? link.value : this.link),
        author: (author != null ? author.value : this.author),
        verifiedAuthor: (verifiedAuthor != null
            ? verifiedAuthor.value
            : this.verifiedAuthor),
        installed: (installed != null ? installed.value : this.installed),
        type: (type != null ? type.value : this.type),
        description:
            (description != null ? description.value : this.description),
        detailedDescription: (detailedDescription != null
            ? detailedDescription.value
            : this.detailedDescription),
        configDescriptionURI: (configDescriptionURI != null
            ? configDescriptionURI.value
            : this.configDescriptionURI),
        keywords: (keywords != null ? keywords.value : this.keywords),
        countries: (countries != null ? countries.value : this.countries),
        license: (license != null ? license.value : this.license),
        connection: (connection != null ? connection.value : this.connection),
        backgroundColor: (backgroundColor != null
            ? backgroundColor.value
            : this.backgroundColor),
        imageLink: (imageLink != null ? imageLink.value : this.imageLink),
        properties: (properties != null ? properties.value : this.properties),
        loggerPackages: (loggerPackages != null
            ? loggerPackages.value
            : this.loggerPackages));
  }
}

@JsonSerializable(explicitToJson: true)
class AddonType {
  AddonType({
    this.id,
    this.label,
  });

  factory AddonType.fromJson(Map<String, dynamic> json) =>
      _$AddonTypeFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  static const fromJsonFactory = _$AddonTypeFromJson;
  static const toJsonFactory = _$AddonTypeToJson;
  Map<String, dynamic> toJson() => _$AddonTypeToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddonType &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      runtimeType.hashCode;
}

extension $AddonTypeExtension on AddonType {
  AddonType copyWith({String? id, String? label}) {
    return AddonType(id: id ?? this.id, label: label ?? this.label);
  }

  AddonType copyWithWrapped({Wrapped<String?>? id, Wrapped<String?>? label}) {
    return AddonType(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label));
  }
}

@JsonSerializable(explicitToJson: true)
class BindingInfoDTO {
  BindingInfoDTO({
    this.author,
    this.description,
    this.id,
    this.name,
    this.configDescriptionURI,
  });

  factory BindingInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$BindingInfoDTOFromJson(json);

  @JsonKey(name: 'author')
  final String? author;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'configDescriptionURI')
  final String? configDescriptionURI;
  static const fromJsonFactory = _$BindingInfoDTOFromJson;
  static const toJsonFactory = _$BindingInfoDTOToJson;
  Map<String, dynamic> toJson() => _$BindingInfoDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BindingInfoDTO &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.configDescriptionURI, configDescriptionURI) ||
                const DeepCollectionEquality()
                    .equals(other.configDescriptionURI, configDescriptionURI)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(configDescriptionURI) ^
      runtimeType.hashCode;
}

extension $BindingInfoDTOExtension on BindingInfoDTO {
  BindingInfoDTO copyWith(
      {String? author,
      String? description,
      String? id,
      String? name,
      String? configDescriptionURI}) {
    return BindingInfoDTO(
        author: author ?? this.author,
        description: description ?? this.description,
        id: id ?? this.id,
        name: name ?? this.name,
        configDescriptionURI:
            configDescriptionURI ?? this.configDescriptionURI);
  }

  BindingInfoDTO copyWithWrapped(
      {Wrapped<String?>? author,
      Wrapped<String?>? description,
      Wrapped<String?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? configDescriptionURI}) {
    return BindingInfoDTO(
        author: (author != null ? author.value : this.author),
        description:
            (description != null ? description.value : this.description),
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        configDescriptionURI: (configDescriptionURI != null
            ? configDescriptionURI.value
            : this.configDescriptionURI));
  }
}

@JsonSerializable(explicitToJson: true)
class ChannelTypeDTO {
  ChannelTypeDTO({
    this.parameters,
    this.parameterGroups,
    this.description,
    this.label,
    this.category,
    this.itemType,
    this.kind,
    this.stateDescription,
    this.tags,
    this.uid,
    this.advanced,
    this.commandDescription,
  });

  factory ChannelTypeDTO.fromJson(Map<String, dynamic> json) =>
      _$ChannelTypeDTOFromJson(json);

  @JsonKey(name: 'parameters', defaultValue: <ConfigDescriptionParameterDTO>[])
  final List<ConfigDescriptionParameterDTO>? parameters;
  @JsonKey(
      name: 'parameterGroups',
      defaultValue: <ConfigDescriptionParameterGroupDTO>[])
  final List<ConfigDescriptionParameterGroupDTO>? parameterGroups;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'itemType')
  final String? itemType;
  @JsonKey(name: 'kind')
  final String? kind;
  @JsonKey(name: 'stateDescription')
  final StateDescription? stateDescription;
  @JsonKey(name: 'tags', defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(name: 'UID')
  final String? uid;
  @JsonKey(name: 'advanced')
  final bool? advanced;
  @JsonKey(name: 'commandDescription')
  final CommandDescription? commandDescription;
  static const fromJsonFactory = _$ChannelTypeDTOFromJson;
  static const toJsonFactory = _$ChannelTypeDTOToJson;
  Map<String, dynamic> toJson() => _$ChannelTypeDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChannelTypeDTO &&
            (identical(other.parameters, parameters) ||
                const DeepCollectionEquality()
                    .equals(other.parameters, parameters)) &&
            (identical(other.parameterGroups, parameterGroups) ||
                const DeepCollectionEquality()
                    .equals(other.parameterGroups, parameterGroups)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.itemType, itemType) ||
                const DeepCollectionEquality()
                    .equals(other.itemType, itemType)) &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.stateDescription, stateDescription) ||
                const DeepCollectionEquality()
                    .equals(other.stateDescription, stateDescription)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.advanced, advanced) ||
                const DeepCollectionEquality()
                    .equals(other.advanced, advanced)) &&
            (identical(other.commandDescription, commandDescription) ||
                const DeepCollectionEquality()
                    .equals(other.commandDescription, commandDescription)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(parameters) ^
      const DeepCollectionEquality().hash(parameterGroups) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(itemType) ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(stateDescription) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(advanced) ^
      const DeepCollectionEquality().hash(commandDescription) ^
      runtimeType.hashCode;
}

extension $ChannelTypeDTOExtension on ChannelTypeDTO {
  ChannelTypeDTO copyWith(
      {List<ConfigDescriptionParameterDTO>? parameters,
      List<ConfigDescriptionParameterGroupDTO>? parameterGroups,
      String? description,
      String? label,
      String? category,
      String? itemType,
      String? kind,
      StateDescription? stateDescription,
      List<String>? tags,
      String? uid,
      bool? advanced,
      CommandDescription? commandDescription}) {
    return ChannelTypeDTO(
        parameters: parameters ?? this.parameters,
        parameterGroups: parameterGroups ?? this.parameterGroups,
        description: description ?? this.description,
        label: label ?? this.label,
        category: category ?? this.category,
        itemType: itemType ?? this.itemType,
        kind: kind ?? this.kind,
        stateDescription: stateDescription ?? this.stateDescription,
        tags: tags ?? this.tags,
        uid: uid ?? this.uid,
        advanced: advanced ?? this.advanced,
        commandDescription: commandDescription ?? this.commandDescription);
  }

  ChannelTypeDTO copyWithWrapped(
      {Wrapped<List<ConfigDescriptionParameterDTO>?>? parameters,
      Wrapped<List<ConfigDescriptionParameterGroupDTO>?>? parameterGroups,
      Wrapped<String?>? description,
      Wrapped<String?>? label,
      Wrapped<String?>? category,
      Wrapped<String?>? itemType,
      Wrapped<String?>? kind,
      Wrapped<StateDescription?>? stateDescription,
      Wrapped<List<String>?>? tags,
      Wrapped<String?>? uid,
      Wrapped<bool?>? advanced,
      Wrapped<CommandDescription?>? commandDescription}) {
    return ChannelTypeDTO(
        parameters: (parameters != null ? parameters.value : this.parameters),
        parameterGroups: (parameterGroups != null
            ? parameterGroups.value
            : this.parameterGroups),
        description:
            (description != null ? description.value : this.description),
        label: (label != null ? label.value : this.label),
        category: (category != null ? category.value : this.category),
        itemType: (itemType != null ? itemType.value : this.itemType),
        kind: (kind != null ? kind.value : this.kind),
        stateDescription: (stateDescription != null
            ? stateDescription.value
            : this.stateDescription),
        tags: (tags != null ? tags.value : this.tags),
        uid: (uid != null ? uid.value : this.uid),
        advanced: (advanced != null ? advanced.value : this.advanced),
        commandDescription: (commandDescription != null
            ? commandDescription.value
            : this.commandDescription));
  }
}

@JsonSerializable(explicitToJson: true)
class CommandDescription {
  CommandDescription({
    this.commandOptions,
  });

  factory CommandDescription.fromJson(Map<String, dynamic> json) =>
      _$CommandDescriptionFromJson(json);

  @JsonKey(name: 'commandOptions', defaultValue: <CommandOption>[])
  final List<CommandOption>? commandOptions;
  static const fromJsonFactory = _$CommandDescriptionFromJson;
  static const toJsonFactory = _$CommandDescriptionToJson;
  Map<String, dynamic> toJson() => _$CommandDescriptionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommandDescription &&
            (identical(other.commandOptions, commandOptions) ||
                const DeepCollectionEquality()
                    .equals(other.commandOptions, commandOptions)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(commandOptions) ^
      runtimeType.hashCode;
}

extension $CommandDescriptionExtension on CommandDescription {
  CommandDescription copyWith({List<CommandOption>? commandOptions}) {
    return CommandDescription(
        commandOptions: commandOptions ?? this.commandOptions);
  }

  CommandDescription copyWithWrapped(
      {Wrapped<List<CommandOption>?>? commandOptions}) {
    return CommandDescription(
        commandOptions: (commandOptions != null
            ? commandOptions.value
            : this.commandOptions));
  }
}

@JsonSerializable(explicitToJson: true)
class CommandOption {
  CommandOption({
    this.command,
    this.label,
  });

  factory CommandOption.fromJson(Map<String, dynamic> json) =>
      _$CommandOptionFromJson(json);

  @JsonKey(name: 'command')
  final String? command;
  @JsonKey(name: 'label')
  final String? label;
  static const fromJsonFactory = _$CommandOptionFromJson;
  static const toJsonFactory = _$CommandOptionToJson;
  Map<String, dynamic> toJson() => _$CommandOptionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CommandOption &&
            (identical(other.command, command) ||
                const DeepCollectionEquality()
                    .equals(other.command, command)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(command) ^
      const DeepCollectionEquality().hash(label) ^
      runtimeType.hashCode;
}

extension $CommandOptionExtension on CommandOption {
  CommandOption copyWith({String? command, String? label}) {
    return CommandOption(
        command: command ?? this.command, label: label ?? this.label);
  }

  CommandOption copyWithWrapped(
      {Wrapped<String?>? command, Wrapped<String?>? label}) {
    return CommandOption(
        command: (command != null ? command.value : this.command),
        label: (label != null ? label.value : this.label));
  }
}

@JsonSerializable(explicitToJson: true)
class ConfigDescriptionParameterGroupDTO {
  ConfigDescriptionParameterGroupDTO({
    this.name,
    this.context,
    this.advanced,
    this.label,
    this.description,
  });

  factory ConfigDescriptionParameterGroupDTO.fromJson(
          Map<String, dynamic> json) =>
      _$ConfigDescriptionParameterGroupDTOFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'context')
  final String? context;
  @JsonKey(name: 'advanced')
  final bool? advanced;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  static const fromJsonFactory = _$ConfigDescriptionParameterGroupDTOFromJson;
  static const toJsonFactory = _$ConfigDescriptionParameterGroupDTOToJson;
  Map<String, dynamic> toJson() =>
      _$ConfigDescriptionParameterGroupDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfigDescriptionParameterGroupDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.context, context) ||
                const DeepCollectionEquality()
                    .equals(other.context, context)) &&
            (identical(other.advanced, advanced) ||
                const DeepCollectionEquality()
                    .equals(other.advanced, advanced)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(context) ^
      const DeepCollectionEquality().hash(advanced) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $ConfigDescriptionParameterGroupDTOExtension
    on ConfigDescriptionParameterGroupDTO {
  ConfigDescriptionParameterGroupDTO copyWith(
      {String? name,
      String? context,
      bool? advanced,
      String? label,
      String? description}) {
    return ConfigDescriptionParameterGroupDTO(
        name: name ?? this.name,
        context: context ?? this.context,
        advanced: advanced ?? this.advanced,
        label: label ?? this.label,
        description: description ?? this.description);
  }

  ConfigDescriptionParameterGroupDTO copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<String?>? context,
      Wrapped<bool?>? advanced,
      Wrapped<String?>? label,
      Wrapped<String?>? description}) {
    return ConfigDescriptionParameterGroupDTO(
        name: (name != null ? name.value : this.name),
        context: (context != null ? context.value : this.context),
        advanced: (advanced != null ? advanced.value : this.advanced),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class StateDescription {
  StateDescription({
    this.minimum,
    this.maximum,
    this.step,
    this.pattern,
    this.readOnly,
    this.options,
  });

  factory StateDescription.fromJson(Map<String, dynamic> json) =>
      _$StateDescriptionFromJson(json);

  @JsonKey(name: 'minimum')
  final double? minimum;
  @JsonKey(name: 'maximum')
  final double? maximum;
  @JsonKey(name: 'step')
  final double? step;
  @JsonKey(name: 'pattern')
  final String? pattern;
  @JsonKey(name: 'readOnly')
  final bool? readOnly;
  @JsonKey(name: 'options', defaultValue: <StateOption>[])
  final List<StateOption>? options;
  static const fromJsonFactory = _$StateDescriptionFromJson;
  static const toJsonFactory = _$StateDescriptionToJson;
  Map<String, dynamic> toJson() => _$StateDescriptionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StateDescription &&
            (identical(other.minimum, minimum) ||
                const DeepCollectionEquality()
                    .equals(other.minimum, minimum)) &&
            (identical(other.maximum, maximum) ||
                const DeepCollectionEquality()
                    .equals(other.maximum, maximum)) &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)) &&
            (identical(other.pattern, pattern) ||
                const DeepCollectionEquality()
                    .equals(other.pattern, pattern)) &&
            (identical(other.readOnly, readOnly) ||
                const DeepCollectionEquality()
                    .equals(other.readOnly, readOnly)) &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(minimum) ^
      const DeepCollectionEquality().hash(maximum) ^
      const DeepCollectionEquality().hash(step) ^
      const DeepCollectionEquality().hash(pattern) ^
      const DeepCollectionEquality().hash(readOnly) ^
      const DeepCollectionEquality().hash(options) ^
      runtimeType.hashCode;
}

extension $StateDescriptionExtension on StateDescription {
  StateDescription copyWith(
      {double? minimum,
      double? maximum,
      double? step,
      String? pattern,
      bool? readOnly,
      List<StateOption>? options}) {
    return StateDescription(
        minimum: minimum ?? this.minimum,
        maximum: maximum ?? this.maximum,
        step: step ?? this.step,
        pattern: pattern ?? this.pattern,
        readOnly: readOnly ?? this.readOnly,
        options: options ?? this.options);
  }

  StateDescription copyWithWrapped(
      {Wrapped<double?>? minimum,
      Wrapped<double?>? maximum,
      Wrapped<double?>? step,
      Wrapped<String?>? pattern,
      Wrapped<bool?>? readOnly,
      Wrapped<List<StateOption>?>? options}) {
    return StateDescription(
        minimum: (minimum != null ? minimum.value : this.minimum),
        maximum: (maximum != null ? maximum.value : this.maximum),
        step: (step != null ? step.value : this.step),
        pattern: (pattern != null ? pattern.value : this.pattern),
        readOnly: (readOnly != null ? readOnly.value : this.readOnly),
        options: (options != null ? options.value : this.options));
  }
}

@JsonSerializable(explicitToJson: true)
class StateOption {
  StateOption({
    this.value,
    this.label,
  });

  factory StateOption.fromJson(Map<String, dynamic> json) =>
      _$StateOptionFromJson(json);

  @JsonKey(name: 'value')
  final String? value;
  @JsonKey(name: 'label')
  final String? label;
  static const fromJsonFactory = _$StateOptionFromJson;
  static const toJsonFactory = _$StateOptionToJson;
  Map<String, dynamic> toJson() => _$StateOptionToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StateOption &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(label) ^
      runtimeType.hashCode;
}

extension $StateOptionExtension on StateOption {
  StateOption copyWith({String? value, String? label}) {
    return StateOption(value: value ?? this.value, label: label ?? this.label);
  }

  StateOption copyWithWrapped(
      {Wrapped<String?>? value, Wrapped<String?>? label}) {
    return StateOption(
        value: (value != null ? value.value : this.value),
        label: (label != null ? label.value : this.label));
  }
}

@JsonSerializable(explicitToJson: true)
class ConfigDescriptionDTO {
  ConfigDescriptionDTO({
    this.uri,
    this.parameters,
    this.parameterGroups,
  });

  factory ConfigDescriptionDTO.fromJson(Map<String, dynamic> json) =>
      _$ConfigDescriptionDTOFromJson(json);

  @JsonKey(name: 'uri')
  final String? uri;
  @JsonKey(name: 'parameters', defaultValue: <ConfigDescriptionParameterDTO>[])
  final List<ConfigDescriptionParameterDTO>? parameters;
  @JsonKey(
      name: 'parameterGroups',
      defaultValue: <ConfigDescriptionParameterGroupDTO>[])
  final List<ConfigDescriptionParameterGroupDTO>? parameterGroups;
  static const fromJsonFactory = _$ConfigDescriptionDTOFromJson;
  static const toJsonFactory = _$ConfigDescriptionDTOToJson;
  Map<String, dynamic> toJson() => _$ConfigDescriptionDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfigDescriptionDTO &&
            (identical(other.uri, uri) ||
                const DeepCollectionEquality().equals(other.uri, uri)) &&
            (identical(other.parameters, parameters) ||
                const DeepCollectionEquality()
                    .equals(other.parameters, parameters)) &&
            (identical(other.parameterGroups, parameterGroups) ||
                const DeepCollectionEquality()
                    .equals(other.parameterGroups, parameterGroups)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uri) ^
      const DeepCollectionEquality().hash(parameters) ^
      const DeepCollectionEquality().hash(parameterGroups) ^
      runtimeType.hashCode;
}

extension $ConfigDescriptionDTOExtension on ConfigDescriptionDTO {
  ConfigDescriptionDTO copyWith(
      {String? uri,
      List<ConfigDescriptionParameterDTO>? parameters,
      List<ConfigDescriptionParameterGroupDTO>? parameterGroups}) {
    return ConfigDescriptionDTO(
        uri: uri ?? this.uri,
        parameters: parameters ?? this.parameters,
        parameterGroups: parameterGroups ?? this.parameterGroups);
  }

  ConfigDescriptionDTO copyWithWrapped(
      {Wrapped<String?>? uri,
      Wrapped<List<ConfigDescriptionParameterDTO>?>? parameters,
      Wrapped<List<ConfigDescriptionParameterGroupDTO>?>? parameterGroups}) {
    return ConfigDescriptionDTO(
        uri: (uri != null ? uri.value : this.uri),
        parameters: (parameters != null ? parameters.value : this.parameters),
        parameterGroups: (parameterGroups != null
            ? parameterGroups.value
            : this.parameterGroups));
  }
}

@JsonSerializable(explicitToJson: true)
class DiscoveryResultDTO {
  DiscoveryResultDTO({
    this.bridgeUID,
    this.flag,
    this.label,
    this.properties,
    this.representationProperty,
    this.thingUID,
    this.thingTypeUID,
  });

  factory DiscoveryResultDTO.fromJson(Map<String, dynamic> json) =>
      _$DiscoveryResultDTOFromJson(json);

  @JsonKey(name: 'bridgeUID')
  final String? bridgeUID;
  @JsonKey(
    name: 'flag',
    toJson: discoveryResultDTOFlagToJson,
    fromJson: discoveryResultDTOFlagFromJson,
  )
  final enums.DiscoveryResultDTOFlag? flag;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'properties')
  final Map<String, dynamic>? properties;
  @JsonKey(name: 'representationProperty')
  final String? representationProperty;
  @JsonKey(name: 'thingUID')
  final String? thingUID;
  @JsonKey(name: 'thingTypeUID')
  final String? thingTypeUID;
  static const fromJsonFactory = _$DiscoveryResultDTOFromJson;
  static const toJsonFactory = _$DiscoveryResultDTOToJson;
  Map<String, dynamic> toJson() => _$DiscoveryResultDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DiscoveryResultDTO &&
            (identical(other.bridgeUID, bridgeUID) ||
                const DeepCollectionEquality()
                    .equals(other.bridgeUID, bridgeUID)) &&
            (identical(other.flag, flag) ||
                const DeepCollectionEquality().equals(other.flag, flag)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.properties, properties) ||
                const DeepCollectionEquality()
                    .equals(other.properties, properties)) &&
            (identical(other.representationProperty, representationProperty) ||
                const DeepCollectionEquality().equals(
                    other.representationProperty, representationProperty)) &&
            (identical(other.thingUID, thingUID) ||
                const DeepCollectionEquality()
                    .equals(other.thingUID, thingUID)) &&
            (identical(other.thingTypeUID, thingTypeUID) ||
                const DeepCollectionEquality()
                    .equals(other.thingTypeUID, thingTypeUID)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bridgeUID) ^
      const DeepCollectionEquality().hash(flag) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(properties) ^
      const DeepCollectionEquality().hash(representationProperty) ^
      const DeepCollectionEquality().hash(thingUID) ^
      const DeepCollectionEquality().hash(thingTypeUID) ^
      runtimeType.hashCode;
}

extension $DiscoveryResultDTOExtension on DiscoveryResultDTO {
  DiscoveryResultDTO copyWith(
      {String? bridgeUID,
      enums.DiscoveryResultDTOFlag? flag,
      String? label,
      Map<String, dynamic>? properties,
      String? representationProperty,
      String? thingUID,
      String? thingTypeUID}) {
    return DiscoveryResultDTO(
        bridgeUID: bridgeUID ?? this.bridgeUID,
        flag: flag ?? this.flag,
        label: label ?? this.label,
        properties: properties ?? this.properties,
        representationProperty:
            representationProperty ?? this.representationProperty,
        thingUID: thingUID ?? this.thingUID,
        thingTypeUID: thingTypeUID ?? this.thingTypeUID);
  }

  DiscoveryResultDTO copyWithWrapped(
      {Wrapped<String?>? bridgeUID,
      Wrapped<enums.DiscoveryResultDTOFlag?>? flag,
      Wrapped<String?>? label,
      Wrapped<Map<String, dynamic>?>? properties,
      Wrapped<String?>? representationProperty,
      Wrapped<String?>? thingUID,
      Wrapped<String?>? thingTypeUID}) {
    return DiscoveryResultDTO(
        bridgeUID: (bridgeUID != null ? bridgeUID.value : this.bridgeUID),
        flag: (flag != null ? flag.value : this.flag),
        label: (label != null ? label.value : this.label),
        properties: (properties != null ? properties.value : this.properties),
        representationProperty: (representationProperty != null
            ? representationProperty.value
            : this.representationProperty),
        thingUID: (thingUID != null ? thingUID.value : this.thingUID),
        thingTypeUID:
            (thingTypeUID != null ? thingTypeUID.value : this.thingTypeUID));
  }
}

@JsonSerializable(explicitToJson: true)
class MetadataDTO {
  MetadataDTO({
    this.value,
    this.config,
  });

  factory MetadataDTO.fromJson(Map<String, dynamic> json) =>
      _$MetadataDTOFromJson(json);

  @JsonKey(name: 'value')
  final String? value;
  @JsonKey(name: 'config')
  final Map<String, dynamic>? config;
  static const fromJsonFactory = _$MetadataDTOFromJson;
  static const toJsonFactory = _$MetadataDTOToJson;
  Map<String, dynamic> toJson() => _$MetadataDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MetadataDTO &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.config, config) ||
                const DeepCollectionEquality().equals(other.config, config)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(config) ^
      runtimeType.hashCode;
}

extension $MetadataDTOExtension on MetadataDTO {
  MetadataDTO copyWith({String? value, Map<String, dynamic>? config}) {
    return MetadataDTO(
        value: value ?? this.value, config: config ?? this.config);
  }

  MetadataDTO copyWithWrapped(
      {Wrapped<String?>? value, Wrapped<Map<String, dynamic>?>? config}) {
    return MetadataDTO(
        value: (value != null ? value.value : this.value),
        config: (config != null ? config.value : this.config));
  }
}

@JsonSerializable(explicitToJson: true)
class EnrichedItemDTO {
  EnrichedItemDTO({
    this.type,
    this.name,
    this.label,
    this.category,
    this.tags,
    this.groupNames,
    this.link,
    this.state,
    this.transformedState,
    this.stateDescription,
    this.commandDescription,
    this.metadata,
    this.editable,
  });

  factory EnrichedItemDTO.fromJson(Map<String, dynamic> json) =>
      _$EnrichedItemDTOFromJson(json);

  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'tags', defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(name: 'groupNames', defaultValue: <String>[])
  final List<String>? groupNames;
  @JsonKey(name: 'link')
  final String? link;
  @JsonKey(name: 'state')
  final String? state;
  @JsonKey(name: 'transformedState')
  final String? transformedState;
  @JsonKey(name: 'stateDescription')
  final StateDescription? stateDescription;
  @JsonKey(name: 'commandDescription')
  final CommandDescription? commandDescription;
  @JsonKey(name: 'metadata')
  final Map<String, dynamic>? metadata;
  @JsonKey(name: 'editable')
  final bool? editable;
  static const fromJsonFactory = _$EnrichedItemDTOFromJson;
  static const toJsonFactory = _$EnrichedItemDTOToJson;
  Map<String, dynamic> toJson() => _$EnrichedItemDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EnrichedItemDTO &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.groupNames, groupNames) ||
                const DeepCollectionEquality()
                    .equals(other.groupNames, groupNames)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.transformedState, transformedState) ||
                const DeepCollectionEquality()
                    .equals(other.transformedState, transformedState)) &&
            (identical(other.stateDescription, stateDescription) ||
                const DeepCollectionEquality()
                    .equals(other.stateDescription, stateDescription)) &&
            (identical(other.commandDescription, commandDescription) ||
                const DeepCollectionEquality()
                    .equals(other.commandDescription, commandDescription)) &&
            (identical(other.metadata, metadata) ||
                const DeepCollectionEquality()
                    .equals(other.metadata, metadata)) &&
            (identical(other.editable, editable) ||
                const DeepCollectionEquality()
                    .equals(other.editable, editable)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(groupNames) ^
      const DeepCollectionEquality().hash(link) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(transformedState) ^
      const DeepCollectionEquality().hash(stateDescription) ^
      const DeepCollectionEquality().hash(commandDescription) ^
      const DeepCollectionEquality().hash(metadata) ^
      const DeepCollectionEquality().hash(editable) ^
      runtimeType.hashCode;
}

extension $EnrichedItemDTOExtension on EnrichedItemDTO {
  EnrichedItemDTO copyWith(
      {String? type,
      String? name,
      String? label,
      String? category,
      List<String>? tags,
      List<String>? groupNames,
      String? link,
      String? state,
      String? transformedState,
      StateDescription? stateDescription,
      CommandDescription? commandDescription,
      Map<String, dynamic>? metadata,
      bool? editable}) {
    return EnrichedItemDTO(
        type: type ?? this.type,
        name: name ?? this.name,
        label: label ?? this.label,
        category: category ?? this.category,
        tags: tags ?? this.tags,
        groupNames: groupNames ?? this.groupNames,
        link: link ?? this.link,
        state: state ?? this.state,
        transformedState: transformedState ?? this.transformedState,
        stateDescription: stateDescription ?? this.stateDescription,
        commandDescription: commandDescription ?? this.commandDescription,
        metadata: metadata ?? this.metadata,
        editable: editable ?? this.editable);
  }

  EnrichedItemDTO copyWithWrapped(
      {Wrapped<String?>? type,
      Wrapped<String?>? name,
      Wrapped<String?>? label,
      Wrapped<String?>? category,
      Wrapped<List<String>?>? tags,
      Wrapped<List<String>?>? groupNames,
      Wrapped<String?>? link,
      Wrapped<String?>? state,
      Wrapped<String?>? transformedState,
      Wrapped<StateDescription?>? stateDescription,
      Wrapped<CommandDescription?>? commandDescription,
      Wrapped<Map<String, dynamic>?>? metadata,
      Wrapped<bool?>? editable}) {
    return EnrichedItemDTO(
        type: (type != null ? type.value : this.type),
        name: (name != null ? name.value : this.name),
        label: (label != null ? label.value : this.label),
        category: (category != null ? category.value : this.category),
        tags: (tags != null ? tags.value : this.tags),
        groupNames: (groupNames != null ? groupNames.value : this.groupNames),
        link: (link != null ? link.value : this.link),
        state: (state != null ? state.value : this.state),
        transformedState: (transformedState != null
            ? transformedState.value
            : this.transformedState),
        stateDescription: (stateDescription != null
            ? stateDescription.value
            : this.stateDescription),
        commandDescription: (commandDescription != null
            ? commandDescription.value
            : this.commandDescription),
        metadata: (metadata != null ? metadata.value : this.metadata),
        editable: (editable != null ? editable.value : this.editable));
  }
}

@JsonSerializable(explicitToJson: true)
class GroupFunctionDTO {
  GroupFunctionDTO({
    this.name,
    this.params,
  });

  factory GroupFunctionDTO.fromJson(Map<String, dynamic> json) =>
      _$GroupFunctionDTOFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'params', defaultValue: <String>[])
  final List<String>? params;
  static const fromJsonFactory = _$GroupFunctionDTOFromJson;
  static const toJsonFactory = _$GroupFunctionDTOToJson;
  Map<String, dynamic> toJson() => _$GroupFunctionDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupFunctionDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.params, params) ||
                const DeepCollectionEquality().equals(other.params, params)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(params) ^
      runtimeType.hashCode;
}

extension $GroupFunctionDTOExtension on GroupFunctionDTO {
  GroupFunctionDTO copyWith({String? name, List<String>? params}) {
    return GroupFunctionDTO(
        name: name ?? this.name, params: params ?? this.params);
  }

  GroupFunctionDTO copyWithWrapped(
      {Wrapped<String?>? name, Wrapped<List<String>?>? params}) {
    return GroupFunctionDTO(
        name: (name != null ? name.value : this.name),
        params: (params != null ? params.value : this.params));
  }
}

@JsonSerializable(explicitToJson: true)
class GroupItemDTO {
  GroupItemDTO({
    this.type,
    this.name,
    this.label,
    this.category,
    this.tags,
    this.groupNames,
    this.groupType,
    this.function,
  });

  factory GroupItemDTO.fromJson(Map<String, dynamic> json) =>
      _$GroupItemDTOFromJson(json);

  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'tags', defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(name: 'groupNames', defaultValue: <String>[])
  final List<String>? groupNames;
  @JsonKey(name: 'groupType')
  final String? groupType;
  @JsonKey(name: 'function')
  final GroupFunctionDTO? function;
  static const fromJsonFactory = _$GroupItemDTOFromJson;
  static const toJsonFactory = _$GroupItemDTOToJson;
  Map<String, dynamic> toJson() => _$GroupItemDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupItemDTO &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.groupNames, groupNames) ||
                const DeepCollectionEquality()
                    .equals(other.groupNames, groupNames)) &&
            (identical(other.groupType, groupType) ||
                const DeepCollectionEquality()
                    .equals(other.groupType, groupType)) &&
            (identical(other.function, function) ||
                const DeepCollectionEquality()
                    .equals(other.function, function)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(groupNames) ^
      const DeepCollectionEquality().hash(groupType) ^
      const DeepCollectionEquality().hash(function) ^
      runtimeType.hashCode;
}

extension $GroupItemDTOExtension on GroupItemDTO {
  GroupItemDTO copyWith(
      {String? type,
      String? name,
      String? label,
      String? category,
      List<String>? tags,
      List<String>? groupNames,
      String? groupType,
      GroupFunctionDTO? function}) {
    return GroupItemDTO(
        type: type ?? this.type,
        name: name ?? this.name,
        label: label ?? this.label,
        category: category ?? this.category,
        tags: tags ?? this.tags,
        groupNames: groupNames ?? this.groupNames,
        groupType: groupType ?? this.groupType,
        function: function ?? this.function);
  }

  GroupItemDTO copyWithWrapped(
      {Wrapped<String?>? type,
      Wrapped<String?>? name,
      Wrapped<String?>? label,
      Wrapped<String?>? category,
      Wrapped<List<String>?>? tags,
      Wrapped<List<String>?>? groupNames,
      Wrapped<String?>? groupType,
      Wrapped<GroupFunctionDTO?>? function}) {
    return GroupItemDTO(
        type: (type != null ? type.value : this.type),
        name: (name != null ? name.value : this.name),
        label: (label != null ? label.value : this.label),
        category: (category != null ? category.value : this.category),
        tags: (tags != null ? tags.value : this.tags),
        groupNames: (groupNames != null ? groupNames.value : this.groupNames),
        groupType: (groupType != null ? groupType.value : this.groupType),
        function: (function != null ? function.value : this.function));
  }
}

@JsonSerializable(explicitToJson: true)
class EnrichedItemChannelLinkDTO {
  EnrichedItemChannelLinkDTO({
    this.itemName,
    this.channelUID,
    this.configuration,
    this.editable,
  });

  factory EnrichedItemChannelLinkDTO.fromJson(Map<String, dynamic> json) =>
      _$EnrichedItemChannelLinkDTOFromJson(json);

  @JsonKey(name: 'itemName')
  final String? itemName;
  @JsonKey(name: 'channelUID')
  final String? channelUID;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(name: 'editable')
  final bool? editable;
  static const fromJsonFactory = _$EnrichedItemChannelLinkDTOFromJson;
  static const toJsonFactory = _$EnrichedItemChannelLinkDTOToJson;
  Map<String, dynamic> toJson() => _$EnrichedItemChannelLinkDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EnrichedItemChannelLinkDTO &&
            (identical(other.itemName, itemName) ||
                const DeepCollectionEquality()
                    .equals(other.itemName, itemName)) &&
            (identical(other.channelUID, channelUID) ||
                const DeepCollectionEquality()
                    .equals(other.channelUID, channelUID)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.editable, editable) ||
                const DeepCollectionEquality()
                    .equals(other.editable, editable)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(itemName) ^
      const DeepCollectionEquality().hash(channelUID) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(editable) ^
      runtimeType.hashCode;
}

extension $EnrichedItemChannelLinkDTOExtension on EnrichedItemChannelLinkDTO {
  EnrichedItemChannelLinkDTO copyWith(
      {String? itemName,
      String? channelUID,
      Map<String, dynamic>? configuration,
      bool? editable}) {
    return EnrichedItemChannelLinkDTO(
        itemName: itemName ?? this.itemName,
        channelUID: channelUID ?? this.channelUID,
        configuration: configuration ?? this.configuration,
        editable: editable ?? this.editable);
  }

  EnrichedItemChannelLinkDTO copyWithWrapped(
      {Wrapped<String?>? itemName,
      Wrapped<String?>? channelUID,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<bool?>? editable}) {
    return EnrichedItemChannelLinkDTO(
        itemName: (itemName != null ? itemName.value : this.itemName),
        channelUID: (channelUID != null ? channelUID.value : this.channelUID),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        editable: (editable != null ? editable.value : this.editable));
  }
}

@JsonSerializable(explicitToJson: true)
class ItemChannelLinkDTO {
  ItemChannelLinkDTO({
    this.itemName,
    this.channelUID,
    this.configuration,
  });

  factory ItemChannelLinkDTO.fromJson(Map<String, dynamic> json) =>
      _$ItemChannelLinkDTOFromJson(json);

  @JsonKey(name: 'itemName')
  final String? itemName;
  @JsonKey(name: 'channelUID')
  final String? channelUID;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  static const fromJsonFactory = _$ItemChannelLinkDTOFromJson;
  static const toJsonFactory = _$ItemChannelLinkDTOToJson;
  Map<String, dynamic> toJson() => _$ItemChannelLinkDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ItemChannelLinkDTO &&
            (identical(other.itemName, itemName) ||
                const DeepCollectionEquality()
                    .equals(other.itemName, itemName)) &&
            (identical(other.channelUID, channelUID) ||
                const DeepCollectionEquality()
                    .equals(other.channelUID, channelUID)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(itemName) ^
      const DeepCollectionEquality().hash(channelUID) ^
      const DeepCollectionEquality().hash(configuration) ^
      runtimeType.hashCode;
}

extension $ItemChannelLinkDTOExtension on ItemChannelLinkDTO {
  ItemChannelLinkDTO copyWith(
      {String? itemName,
      String? channelUID,
      Map<String, dynamic>? configuration}) {
    return ItemChannelLinkDTO(
        itemName: itemName ?? this.itemName,
        channelUID: channelUID ?? this.channelUID,
        configuration: configuration ?? this.configuration);
  }

  ItemChannelLinkDTO copyWithWrapped(
      {Wrapped<String?>? itemName,
      Wrapped<String?>? channelUID,
      Wrapped<Map<String, dynamic>?>? configuration}) {
    return ItemChannelLinkDTO(
        itemName: (itemName != null ? itemName.value : this.itemName),
        channelUID: (channelUID != null ? channelUID.value : this.channelUID),
        configuration:
            (configuration != null ? configuration.value : this.configuration));
  }
}

@JsonSerializable(explicitToJson: true)
class HistoryDataBean {
  HistoryDataBean({
    this.time,
    this.state,
  });

  factory HistoryDataBean.fromJson(Map<String, dynamic> json) =>
      _$HistoryDataBeanFromJson(json);

  @JsonKey(name: 'time')
  final num? time;
  @JsonKey(name: 'state')
  final String? state;
  static const fromJsonFactory = _$HistoryDataBeanFromJson;
  static const toJsonFactory = _$HistoryDataBeanToJson;
  Map<String, dynamic> toJson() => _$HistoryDataBeanToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HistoryDataBean &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(state) ^
      runtimeType.hashCode;
}

extension $HistoryDataBeanExtension on HistoryDataBean {
  HistoryDataBean copyWith({num? time, String? state}) {
    return HistoryDataBean(time: time ?? this.time, state: state ?? this.state);
  }

  HistoryDataBean copyWithWrapped(
      {Wrapped<num?>? time, Wrapped<String?>? state}) {
    return HistoryDataBean(
        time: (time != null ? time.value : this.time),
        state: (state != null ? state.value : this.state));
  }
}

@JsonSerializable(explicitToJson: true)
class ItemHistoryDTO {
  ItemHistoryDTO({
    this.name,
    this.totalrecords,
    this.datapoints,
    this.data,
  });

  factory ItemHistoryDTO.fromJson(Map<String, dynamic> json) =>
      _$ItemHistoryDTOFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'totalrecords')
  final String? totalrecords;
  @JsonKey(name: 'datapoints')
  final String? datapoints;
  @JsonKey(name: 'data', defaultValue: <HistoryDataBean>[])
  final List<HistoryDataBean>? data;
  static const fromJsonFactory = _$ItemHistoryDTOFromJson;
  static const toJsonFactory = _$ItemHistoryDTOToJson;
  Map<String, dynamic> toJson() => _$ItemHistoryDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ItemHistoryDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.totalrecords, totalrecords) ||
                const DeepCollectionEquality()
                    .equals(other.totalrecords, totalrecords)) &&
            (identical(other.datapoints, datapoints) ||
                const DeepCollectionEquality()
                    .equals(other.datapoints, datapoints)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(totalrecords) ^
      const DeepCollectionEquality().hash(datapoints) ^
      const DeepCollectionEquality().hash(data) ^
      runtimeType.hashCode;
}

extension $ItemHistoryDTOExtension on ItemHistoryDTO {
  ItemHistoryDTO copyWith(
      {String? name,
      String? totalrecords,
      String? datapoints,
      List<HistoryDataBean>? data}) {
    return ItemHistoryDTO(
        name: name ?? this.name,
        totalrecords: totalrecords ?? this.totalrecords,
        datapoints: datapoints ?? this.datapoints,
        data: data ?? this.data);
  }

  ItemHistoryDTO copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<String?>? totalrecords,
      Wrapped<String?>? datapoints,
      Wrapped<List<HistoryDataBean>?>? data}) {
    return ItemHistoryDTO(
        name: (name != null ? name.value : this.name),
        totalrecords:
            (totalrecords != null ? totalrecords.value : this.totalrecords),
        datapoints: (datapoints != null ? datapoints.value : this.datapoints),
        data: (data != null ? data.value : this.data));
  }
}

@JsonSerializable(explicitToJson: true)
class PersistenceItemInfo {
  PersistenceItemInfo({
    this.earliest,
    this.latest,
    this.count,
    this.name,
  });

  factory PersistenceItemInfo.fromJson(Map<String, dynamic> json) =>
      _$PersistenceItemInfoFromJson(json);

  @JsonKey(name: 'earliest')
  final DateTime? earliest;
  @JsonKey(name: 'latest')
  final DateTime? latest;
  @JsonKey(name: 'count')
  final int? count;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$PersistenceItemInfoFromJson;
  static const toJsonFactory = _$PersistenceItemInfoToJson;
  Map<String, dynamic> toJson() => _$PersistenceItemInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PersistenceItemInfo &&
            (identical(other.earliest, earliest) ||
                const DeepCollectionEquality()
                    .equals(other.earliest, earliest)) &&
            (identical(other.latest, latest) ||
                const DeepCollectionEquality().equals(other.latest, latest)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(earliest) ^
      const DeepCollectionEquality().hash(latest) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $PersistenceItemInfoExtension on PersistenceItemInfo {
  PersistenceItemInfo copyWith(
      {DateTime? earliest, DateTime? latest, int? count, String? name}) {
    return PersistenceItemInfo(
        earliest: earliest ?? this.earliest,
        latest: latest ?? this.latest,
        count: count ?? this.count,
        name: name ?? this.name);
  }

  PersistenceItemInfo copyWithWrapped(
      {Wrapped<DateTime?>? earliest,
      Wrapped<DateTime?>? latest,
      Wrapped<int?>? count,
      Wrapped<String?>? name}) {
    return PersistenceItemInfo(
        earliest: (earliest != null ? earliest.value : this.earliest),
        latest: (latest != null ? latest.value : this.latest),
        count: (count != null ? count.value : this.count),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class PersistenceServiceDTO {
  PersistenceServiceDTO({
    this.id,
    this.label,
    this.type,
  });

  factory PersistenceServiceDTO.fromJson(Map<String, dynamic> json) =>
      _$PersistenceServiceDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'type')
  final String? type;
  static const fromJsonFactory = _$PersistenceServiceDTOFromJson;
  static const toJsonFactory = _$PersistenceServiceDTOToJson;
  Map<String, dynamic> toJson() => _$PersistenceServiceDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PersistenceServiceDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $PersistenceServiceDTOExtension on PersistenceServiceDTO {
  PersistenceServiceDTO copyWith({String? id, String? label, String? type}) {
    return PersistenceServiceDTO(
        id: id ?? this.id, label: label ?? this.label, type: type ?? this.type);
  }

  PersistenceServiceDTO copyWithWrapped(
      {Wrapped<String?>? id, Wrapped<String?>? label, Wrapped<String?>? type}) {
    return PersistenceServiceDTO(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label),
        type: (type != null ? type.value : this.type));
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileTypeDTO {
  ProfileTypeDTO({
    this.uid,
    this.label,
    this.kind,
    this.supportedItemTypes,
  });

  factory ProfileTypeDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileTypeDTOFromJson(json);

  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'kind')
  final String? kind;
  @JsonKey(name: 'supportedItemTypes', defaultValue: <String>[])
  final List<String>? supportedItemTypes;
  static const fromJsonFactory = _$ProfileTypeDTOFromJson;
  static const toJsonFactory = _$ProfileTypeDTOToJson;
  Map<String, dynamic> toJson() => _$ProfileTypeDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileTypeDTO &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.supportedItemTypes, supportedItemTypes) ||
                const DeepCollectionEquality()
                    .equals(other.supportedItemTypes, supportedItemTypes)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(supportedItemTypes) ^
      runtimeType.hashCode;
}

extension $ProfileTypeDTOExtension on ProfileTypeDTO {
  ProfileTypeDTO copyWith(
      {String? uid,
      String? label,
      String? kind,
      List<String>? supportedItemTypes}) {
    return ProfileTypeDTO(
        uid: uid ?? this.uid,
        label: label ?? this.label,
        kind: kind ?? this.kind,
        supportedItemTypes: supportedItemTypes ?? this.supportedItemTypes);
  }

  ProfileTypeDTO copyWithWrapped(
      {Wrapped<String?>? uid,
      Wrapped<String?>? label,
      Wrapped<String?>? kind,
      Wrapped<List<String>?>? supportedItemTypes}) {
    return ProfileTypeDTO(
        uid: (uid != null ? uid.value : this.uid),
        label: (label != null ? label.value : this.label),
        kind: (kind != null ? kind.value : this.kind),
        supportedItemTypes: (supportedItemTypes != null
            ? supportedItemTypes.value
            : this.supportedItemTypes));
  }
}

@JsonSerializable(explicitToJson: true)
class ConfigurableServiceDTO {
  ConfigurableServiceDTO({
    this.id,
    this.label,
    this.category,
    this.configDescriptionURI,
    this.multiple,
  });

  factory ConfigurableServiceDTO.fromJson(Map<String, dynamic> json) =>
      _$ConfigurableServiceDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'configDescriptionURI')
  final String? configDescriptionURI;
  @JsonKey(name: 'multiple')
  final bool? multiple;
  static const fromJsonFactory = _$ConfigurableServiceDTOFromJson;
  static const toJsonFactory = _$ConfigurableServiceDTOToJson;
  Map<String, dynamic> toJson() => _$ConfigurableServiceDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfigurableServiceDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.configDescriptionURI, configDescriptionURI) ||
                const DeepCollectionEquality().equals(
                    other.configDescriptionURI, configDescriptionURI)) &&
            (identical(other.multiple, multiple) ||
                const DeepCollectionEquality()
                    .equals(other.multiple, multiple)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(configDescriptionURI) ^
      const DeepCollectionEquality().hash(multiple) ^
      runtimeType.hashCode;
}

extension $ConfigurableServiceDTOExtension on ConfigurableServiceDTO {
  ConfigurableServiceDTO copyWith(
      {String? id,
      String? label,
      String? category,
      String? configDescriptionURI,
      bool? multiple}) {
    return ConfigurableServiceDTO(
        id: id ?? this.id,
        label: label ?? this.label,
        category: category ?? this.category,
        configDescriptionURI: configDescriptionURI ?? this.configDescriptionURI,
        multiple: multiple ?? this.multiple);
  }

  ConfigurableServiceDTO copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? label,
      Wrapped<String?>? category,
      Wrapped<String?>? configDescriptionURI,
      Wrapped<bool?>? multiple}) {
    return ConfigurableServiceDTO(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label),
        category: (category != null ? category.value : this.category),
        configDescriptionURI: (configDescriptionURI != null
            ? configDescriptionURI.value
            : this.configDescriptionURI),
        multiple: (multiple != null ? multiple.value : this.multiple));
  }
}

@JsonSerializable(explicitToJson: true)
class EnrichedChannelDTO {
  EnrichedChannelDTO({
    this.uid,
    this.id,
    this.channelTypeUID,
    this.itemType,
    this.kind,
    this.label,
    this.description,
    this.defaultTags,
    this.properties,
    this.configuration,
    this.autoUpdatePolicy,
    this.linkedItems,
  });

  factory EnrichedChannelDTO.fromJson(Map<String, dynamic> json) =>
      _$EnrichedChannelDTOFromJson(json);

  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'channelTypeUID')
  final String? channelTypeUID;
  @JsonKey(name: 'itemType')
  final String? itemType;
  @JsonKey(name: 'kind')
  final String? kind;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'defaultTags', defaultValue: <String>[])
  final List<String>? defaultTags;
  @JsonKey(name: 'properties')
  final Map<String, dynamic>? properties;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(name: 'autoUpdatePolicy')
  final String? autoUpdatePolicy;
  @JsonKey(name: 'linkedItems', defaultValue: <String>[])
  final List<String>? linkedItems;
  static const fromJsonFactory = _$EnrichedChannelDTOFromJson;
  static const toJsonFactory = _$EnrichedChannelDTOToJson;
  Map<String, dynamic> toJson() => _$EnrichedChannelDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EnrichedChannelDTO &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.channelTypeUID, channelTypeUID) ||
                const DeepCollectionEquality()
                    .equals(other.channelTypeUID, channelTypeUID)) &&
            (identical(other.itemType, itemType) ||
                const DeepCollectionEquality()
                    .equals(other.itemType, itemType)) &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.defaultTags, defaultTags) ||
                const DeepCollectionEquality()
                    .equals(other.defaultTags, defaultTags)) &&
            (identical(other.properties, properties) ||
                const DeepCollectionEquality()
                    .equals(other.properties, properties)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.autoUpdatePolicy, autoUpdatePolicy) ||
                const DeepCollectionEquality()
                    .equals(other.autoUpdatePolicy, autoUpdatePolicy)) &&
            (identical(other.linkedItems, linkedItems) ||
                const DeepCollectionEquality()
                    .equals(other.linkedItems, linkedItems)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(channelTypeUID) ^
      const DeepCollectionEquality().hash(itemType) ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(defaultTags) ^
      const DeepCollectionEquality().hash(properties) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(autoUpdatePolicy) ^
      const DeepCollectionEquality().hash(linkedItems) ^
      runtimeType.hashCode;
}

extension $EnrichedChannelDTOExtension on EnrichedChannelDTO {
  EnrichedChannelDTO copyWith(
      {String? uid,
      String? id,
      String? channelTypeUID,
      String? itemType,
      String? kind,
      String? label,
      String? description,
      List<String>? defaultTags,
      Map<String, dynamic>? properties,
      Map<String, dynamic>? configuration,
      String? autoUpdatePolicy,
      List<String>? linkedItems}) {
    return EnrichedChannelDTO(
        uid: uid ?? this.uid,
        id: id ?? this.id,
        channelTypeUID: channelTypeUID ?? this.channelTypeUID,
        itemType: itemType ?? this.itemType,
        kind: kind ?? this.kind,
        label: label ?? this.label,
        description: description ?? this.description,
        defaultTags: defaultTags ?? this.defaultTags,
        properties: properties ?? this.properties,
        configuration: configuration ?? this.configuration,
        autoUpdatePolicy: autoUpdatePolicy ?? this.autoUpdatePolicy,
        linkedItems: linkedItems ?? this.linkedItems);
  }

  EnrichedChannelDTO copyWithWrapped(
      {Wrapped<String?>? uid,
      Wrapped<String?>? id,
      Wrapped<String?>? channelTypeUID,
      Wrapped<String?>? itemType,
      Wrapped<String?>? kind,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<List<String>?>? defaultTags,
      Wrapped<Map<String, dynamic>?>? properties,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<String?>? autoUpdatePolicy,
      Wrapped<List<String>?>? linkedItems}) {
    return EnrichedChannelDTO(
        uid: (uid != null ? uid.value : this.uid),
        id: (id != null ? id.value : this.id),
        channelTypeUID: (channelTypeUID != null
            ? channelTypeUID.value
            : this.channelTypeUID),
        itemType: (itemType != null ? itemType.value : this.itemType),
        kind: (kind != null ? kind.value : this.kind),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        defaultTags:
            (defaultTags != null ? defaultTags.value : this.defaultTags),
        properties: (properties != null ? properties.value : this.properties),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        autoUpdatePolicy: (autoUpdatePolicy != null
            ? autoUpdatePolicy.value
            : this.autoUpdatePolicy),
        linkedItems:
            (linkedItems != null ? linkedItems.value : this.linkedItems));
  }
}

@JsonSerializable(explicitToJson: true)
class EnrichedThingDTO {
  EnrichedThingDTO({
    this.label,
    this.bridgeUID,
    this.configuration,
    this.properties,
    this.uid,
    this.thingTypeUID,
    this.location,
    this.channels,
    this.statusInfo,
    this.firmwareStatus,
    this.editable,
  });

  factory EnrichedThingDTO.fromJson(Map<String, dynamic> json) =>
      _$EnrichedThingDTOFromJson(json);

  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'bridgeUID')
  final String? bridgeUID;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(name: 'properties')
  final Map<String, dynamic>? properties;
  @JsonKey(name: 'UID')
  final String? uid;
  @JsonKey(name: 'thingTypeUID')
  final String? thingTypeUID;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'channels', defaultValue: <EnrichedChannelDTO>[])
  final List<EnrichedChannelDTO>? channels;
  @JsonKey(name: 'statusInfo')
  final ThingStatusInfo? statusInfo;
  @JsonKey(name: 'firmwareStatus')
  final FirmwareStatusDTO? firmwareStatus;
  @JsonKey(name: 'editable')
  final bool? editable;
  static const fromJsonFactory = _$EnrichedThingDTOFromJson;
  static const toJsonFactory = _$EnrichedThingDTOToJson;
  Map<String, dynamic> toJson() => _$EnrichedThingDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EnrichedThingDTO &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.bridgeUID, bridgeUID) ||
                const DeepCollectionEquality()
                    .equals(other.bridgeUID, bridgeUID)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.properties, properties) ||
                const DeepCollectionEquality()
                    .equals(other.properties, properties)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.thingTypeUID, thingTypeUID) ||
                const DeepCollectionEquality()
                    .equals(other.thingTypeUID, thingTypeUID)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.channels, channels) ||
                const DeepCollectionEquality()
                    .equals(other.channels, channels)) &&
            (identical(other.statusInfo, statusInfo) ||
                const DeepCollectionEquality()
                    .equals(other.statusInfo, statusInfo)) &&
            (identical(other.firmwareStatus, firmwareStatus) ||
                const DeepCollectionEquality()
                    .equals(other.firmwareStatus, firmwareStatus)) &&
            (identical(other.editable, editable) ||
                const DeepCollectionEquality()
                    .equals(other.editable, editable)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(bridgeUID) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(properties) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(thingTypeUID) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(channels) ^
      const DeepCollectionEquality().hash(statusInfo) ^
      const DeepCollectionEquality().hash(firmwareStatus) ^
      const DeepCollectionEquality().hash(editable) ^
      runtimeType.hashCode;
}

extension $EnrichedThingDTOExtension on EnrichedThingDTO {
  EnrichedThingDTO copyWith(
      {String? label,
      String? bridgeUID,
      Map<String, dynamic>? configuration,
      Map<String, dynamic>? properties,
      String? uid,
      String? thingTypeUID,
      String? location,
      List<EnrichedChannelDTO>? channels,
      ThingStatusInfo? statusInfo,
      FirmwareStatusDTO? firmwareStatus,
      bool? editable}) {
    return EnrichedThingDTO(
        label: label ?? this.label,
        bridgeUID: bridgeUID ?? this.bridgeUID,
        configuration: configuration ?? this.configuration,
        properties: properties ?? this.properties,
        uid: uid ?? this.uid,
        thingTypeUID: thingTypeUID ?? this.thingTypeUID,
        location: location ?? this.location,
        channels: channels ?? this.channels,
        statusInfo: statusInfo ?? this.statusInfo,
        firmwareStatus: firmwareStatus ?? this.firmwareStatus,
        editable: editable ?? this.editable);
  }

  EnrichedThingDTO copyWithWrapped(
      {Wrapped<String?>? label,
      Wrapped<String?>? bridgeUID,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<Map<String, dynamic>?>? properties,
      Wrapped<String?>? uid,
      Wrapped<String?>? thingTypeUID,
      Wrapped<String?>? location,
      Wrapped<List<EnrichedChannelDTO>?>? channels,
      Wrapped<ThingStatusInfo?>? statusInfo,
      Wrapped<FirmwareStatusDTO?>? firmwareStatus,
      Wrapped<bool?>? editable}) {
    return EnrichedThingDTO(
        label: (label != null ? label.value : this.label),
        bridgeUID: (bridgeUID != null ? bridgeUID.value : this.bridgeUID),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        properties: (properties != null ? properties.value : this.properties),
        uid: (uid != null ? uid.value : this.uid),
        thingTypeUID:
            (thingTypeUID != null ? thingTypeUID.value : this.thingTypeUID),
        location: (location != null ? location.value : this.location),
        channels: (channels != null ? channels.value : this.channels),
        statusInfo: (statusInfo != null ? statusInfo.value : this.statusInfo),
        firmwareStatus: (firmwareStatus != null
            ? firmwareStatus.value
            : this.firmwareStatus),
        editable: (editable != null ? editable.value : this.editable));
  }
}

@JsonSerializable(explicitToJson: true)
class FirmwareStatusDTO {
  FirmwareStatusDTO({
    this.status,
    this.updatableVersion,
  });

  factory FirmwareStatusDTO.fromJson(Map<String, dynamic> json) =>
      _$FirmwareStatusDTOFromJson(json);

  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'updatableVersion')
  final String? updatableVersion;
  static const fromJsonFactory = _$FirmwareStatusDTOFromJson;
  static const toJsonFactory = _$FirmwareStatusDTOToJson;
  Map<String, dynamic> toJson() => _$FirmwareStatusDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FirmwareStatusDTO &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.updatableVersion, updatableVersion) ||
                const DeepCollectionEquality()
                    .equals(other.updatableVersion, updatableVersion)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(updatableVersion) ^
      runtimeType.hashCode;
}

extension $FirmwareStatusDTOExtension on FirmwareStatusDTO {
  FirmwareStatusDTO copyWith({String? status, String? updatableVersion}) {
    return FirmwareStatusDTO(
        status: status ?? this.status,
        updatableVersion: updatableVersion ?? this.updatableVersion);
  }

  FirmwareStatusDTO copyWithWrapped(
      {Wrapped<String?>? status, Wrapped<String?>? updatableVersion}) {
    return FirmwareStatusDTO(
        status: (status != null ? status.value : this.status),
        updatableVersion: (updatableVersion != null
            ? updatableVersion.value
            : this.updatableVersion));
  }
}

@JsonSerializable(explicitToJson: true)
class ThingStatusInfo {
  ThingStatusInfo({
    this.status,
    this.statusDetail,
    this.description,
  });

  factory ThingStatusInfo.fromJson(Map<String, dynamic> json) =>
      _$ThingStatusInfoFromJson(json);

  @JsonKey(
    name: 'status',
    toJson: thingStatusInfoStatusToJson,
    fromJson: thingStatusInfoStatusFromJson,
  )
  final enums.ThingStatusInfoStatus? status;
  @JsonKey(
    name: 'statusDetail',
    toJson: thingStatusInfoStatusDetailToJson,
    fromJson: thingStatusInfoStatusDetailFromJson,
  )
  final enums.ThingStatusInfoStatusDetail? statusDetail;
  @JsonKey(name: 'description')
  final String? description;
  static const fromJsonFactory = _$ThingStatusInfoFromJson;
  static const toJsonFactory = _$ThingStatusInfoToJson;
  Map<String, dynamic> toJson() => _$ThingStatusInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ThingStatusInfo &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statusDetail, statusDetail) ||
                const DeepCollectionEquality()
                    .equals(other.statusDetail, statusDetail)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statusDetail) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $ThingStatusInfoExtension on ThingStatusInfo {
  ThingStatusInfo copyWith(
      {enums.ThingStatusInfoStatus? status,
      enums.ThingStatusInfoStatusDetail? statusDetail,
      String? description}) {
    return ThingStatusInfo(
        status: status ?? this.status,
        statusDetail: statusDetail ?? this.statusDetail,
        description: description ?? this.description);
  }

  ThingStatusInfo copyWithWrapped(
      {Wrapped<enums.ThingStatusInfoStatus?>? status,
      Wrapped<enums.ThingStatusInfoStatusDetail?>? statusDetail,
      Wrapped<String?>? description}) {
    return ThingStatusInfo(
        status: (status != null ? status.value : this.status),
        statusDetail:
            (statusDetail != null ? statusDetail.value : this.statusDetail),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class ChannelDTO {
  ChannelDTO({
    this.uid,
    this.id,
    this.channelTypeUID,
    this.itemType,
    this.kind,
    this.label,
    this.description,
    this.defaultTags,
    this.properties,
    this.configuration,
    this.autoUpdatePolicy,
  });

  factory ChannelDTO.fromJson(Map<String, dynamic> json) =>
      _$ChannelDTOFromJson(json);

  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'channelTypeUID')
  final String? channelTypeUID;
  @JsonKey(name: 'itemType')
  final String? itemType;
  @JsonKey(name: 'kind')
  final String? kind;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'defaultTags', defaultValue: <String>[])
  final List<String>? defaultTags;
  @JsonKey(name: 'properties')
  final Map<String, dynamic>? properties;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(name: 'autoUpdatePolicy')
  final String? autoUpdatePolicy;
  static const fromJsonFactory = _$ChannelDTOFromJson;
  static const toJsonFactory = _$ChannelDTOToJson;
  Map<String, dynamic> toJson() => _$ChannelDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChannelDTO &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.channelTypeUID, channelTypeUID) ||
                const DeepCollectionEquality()
                    .equals(other.channelTypeUID, channelTypeUID)) &&
            (identical(other.itemType, itemType) ||
                const DeepCollectionEquality()
                    .equals(other.itemType, itemType)) &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.defaultTags, defaultTags) ||
                const DeepCollectionEquality()
                    .equals(other.defaultTags, defaultTags)) &&
            (identical(other.properties, properties) ||
                const DeepCollectionEquality()
                    .equals(other.properties, properties)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.autoUpdatePolicy, autoUpdatePolicy) ||
                const DeepCollectionEquality()
                    .equals(other.autoUpdatePolicy, autoUpdatePolicy)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(channelTypeUID) ^
      const DeepCollectionEquality().hash(itemType) ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(defaultTags) ^
      const DeepCollectionEquality().hash(properties) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(autoUpdatePolicy) ^
      runtimeType.hashCode;
}

extension $ChannelDTOExtension on ChannelDTO {
  ChannelDTO copyWith(
      {String? uid,
      String? id,
      String? channelTypeUID,
      String? itemType,
      String? kind,
      String? label,
      String? description,
      List<String>? defaultTags,
      Map<String, dynamic>? properties,
      Map<String, dynamic>? configuration,
      String? autoUpdatePolicy}) {
    return ChannelDTO(
        uid: uid ?? this.uid,
        id: id ?? this.id,
        channelTypeUID: channelTypeUID ?? this.channelTypeUID,
        itemType: itemType ?? this.itemType,
        kind: kind ?? this.kind,
        label: label ?? this.label,
        description: description ?? this.description,
        defaultTags: defaultTags ?? this.defaultTags,
        properties: properties ?? this.properties,
        configuration: configuration ?? this.configuration,
        autoUpdatePolicy: autoUpdatePolicy ?? this.autoUpdatePolicy);
  }

  ChannelDTO copyWithWrapped(
      {Wrapped<String?>? uid,
      Wrapped<String?>? id,
      Wrapped<String?>? channelTypeUID,
      Wrapped<String?>? itemType,
      Wrapped<String?>? kind,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<List<String>?>? defaultTags,
      Wrapped<Map<String, dynamic>?>? properties,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<String?>? autoUpdatePolicy}) {
    return ChannelDTO(
        uid: (uid != null ? uid.value : this.uid),
        id: (id != null ? id.value : this.id),
        channelTypeUID: (channelTypeUID != null
            ? channelTypeUID.value
            : this.channelTypeUID),
        itemType: (itemType != null ? itemType.value : this.itemType),
        kind: (kind != null ? kind.value : this.kind),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        defaultTags:
            (defaultTags != null ? defaultTags.value : this.defaultTags),
        properties: (properties != null ? properties.value : this.properties),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        autoUpdatePolicy: (autoUpdatePolicy != null
            ? autoUpdatePolicy.value
            : this.autoUpdatePolicy));
  }
}

@JsonSerializable(explicitToJson: true)
class ThingDTO {
  ThingDTO({
    this.label,
    this.bridgeUID,
    this.configuration,
    this.properties,
    this.uid,
    this.thingTypeUID,
    this.location,
    this.channels,
  });

  factory ThingDTO.fromJson(Map<String, dynamic> json) =>
      _$ThingDTOFromJson(json);

  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'bridgeUID')
  final String? bridgeUID;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(name: 'properties')
  final Map<String, dynamic>? properties;
  @JsonKey(name: 'UID')
  final String? uid;
  @JsonKey(name: 'thingTypeUID')
  final String? thingTypeUID;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'channels', defaultValue: <ChannelDTO>[])
  final List<ChannelDTO>? channels;
  static const fromJsonFactory = _$ThingDTOFromJson;
  static const toJsonFactory = _$ThingDTOToJson;
  Map<String, dynamic> toJson() => _$ThingDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ThingDTO &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.bridgeUID, bridgeUID) ||
                const DeepCollectionEquality()
                    .equals(other.bridgeUID, bridgeUID)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.properties, properties) ||
                const DeepCollectionEquality()
                    .equals(other.properties, properties)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.thingTypeUID, thingTypeUID) ||
                const DeepCollectionEquality()
                    .equals(other.thingTypeUID, thingTypeUID)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.channels, channels) ||
                const DeepCollectionEquality()
                    .equals(other.channels, channels)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(bridgeUID) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(properties) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(thingTypeUID) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(channels) ^
      runtimeType.hashCode;
}

extension $ThingDTOExtension on ThingDTO {
  ThingDTO copyWith(
      {String? label,
      String? bridgeUID,
      Map<String, dynamic>? configuration,
      Map<String, dynamic>? properties,
      String? uid,
      String? thingTypeUID,
      String? location,
      List<ChannelDTO>? channels}) {
    return ThingDTO(
        label: label ?? this.label,
        bridgeUID: bridgeUID ?? this.bridgeUID,
        configuration: configuration ?? this.configuration,
        properties: properties ?? this.properties,
        uid: uid ?? this.uid,
        thingTypeUID: thingTypeUID ?? this.thingTypeUID,
        location: location ?? this.location,
        channels: channels ?? this.channels);
  }

  ThingDTO copyWithWrapped(
      {Wrapped<String?>? label,
      Wrapped<String?>? bridgeUID,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<Map<String, dynamic>?>? properties,
      Wrapped<String?>? uid,
      Wrapped<String?>? thingTypeUID,
      Wrapped<String?>? location,
      Wrapped<List<ChannelDTO>?>? channels}) {
    return ThingDTO(
        label: (label != null ? label.value : this.label),
        bridgeUID: (bridgeUID != null ? bridgeUID.value : this.bridgeUID),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        properties: (properties != null ? properties.value : this.properties),
        uid: (uid != null ? uid.value : this.uid),
        thingTypeUID:
            (thingTypeUID != null ? thingTypeUID.value : this.thingTypeUID),
        location: (location != null ? location.value : this.location),
        channels: (channels != null ? channels.value : this.channels));
  }
}

@JsonSerializable(explicitToJson: true)
class ConfigStatusMessage {
  ConfigStatusMessage({
    this.parameterName,
    this.type,
    this.message,
    this.statusCode,
  });

  factory ConfigStatusMessage.fromJson(Map<String, dynamic> json) =>
      _$ConfigStatusMessageFromJson(json);

  @JsonKey(name: 'parameterName')
  final String? parameterName;
  @JsonKey(
    name: 'type',
    toJson: configStatusMessageTypeToJson,
    fromJson: configStatusMessageTypeFromJson,
  )
  final enums.ConfigStatusMessageType? type;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'statusCode')
  final int? statusCode;
  static const fromJsonFactory = _$ConfigStatusMessageFromJson;
  static const toJsonFactory = _$ConfigStatusMessageToJson;
  Map<String, dynamic> toJson() => _$ConfigStatusMessageToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfigStatusMessage &&
            (identical(other.parameterName, parameterName) ||
                const DeepCollectionEquality()
                    .equals(other.parameterName, parameterName)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(parameterName) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(statusCode) ^
      runtimeType.hashCode;
}

extension $ConfigStatusMessageExtension on ConfigStatusMessage {
  ConfigStatusMessage copyWith(
      {String? parameterName,
      enums.ConfigStatusMessageType? type,
      String? message,
      int? statusCode}) {
    return ConfigStatusMessage(
        parameterName: parameterName ?? this.parameterName,
        type: type ?? this.type,
        message: message ?? this.message,
        statusCode: statusCode ?? this.statusCode);
  }

  ConfigStatusMessage copyWithWrapped(
      {Wrapped<String?>? parameterName,
      Wrapped<enums.ConfigStatusMessageType?>? type,
      Wrapped<String?>? message,
      Wrapped<int?>? statusCode}) {
    return ConfigStatusMessage(
        parameterName:
            (parameterName != null ? parameterName.value : this.parameterName),
        type: (type != null ? type.value : this.type),
        message: (message != null ? message.value : this.message),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode));
  }
}

@JsonSerializable(explicitToJson: true)
class FirmwareDTO {
  FirmwareDTO({
    this.thingTypeUID,
    this.vendor,
    this.model,
    this.modelRestricted,
    this.description,
    this.version,
    this.changelog,
    this.prerequisiteVersion,
  });

  factory FirmwareDTO.fromJson(Map<String, dynamic> json) =>
      _$FirmwareDTOFromJson(json);

  @JsonKey(name: 'thingTypeUID')
  final String? thingTypeUID;
  @JsonKey(name: 'vendor')
  final String? vendor;
  @JsonKey(name: 'model')
  final String? model;
  @JsonKey(name: 'modelRestricted')
  final bool? modelRestricted;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'changelog')
  final String? changelog;
  @JsonKey(name: 'prerequisiteVersion')
  final String? prerequisiteVersion;
  static const fromJsonFactory = _$FirmwareDTOFromJson;
  static const toJsonFactory = _$FirmwareDTOToJson;
  Map<String, dynamic> toJson() => _$FirmwareDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FirmwareDTO &&
            (identical(other.thingTypeUID, thingTypeUID) ||
                const DeepCollectionEquality()
                    .equals(other.thingTypeUID, thingTypeUID)) &&
            (identical(other.vendor, vendor) ||
                const DeepCollectionEquality().equals(other.vendor, vendor)) &&
            (identical(other.model, model) ||
                const DeepCollectionEquality().equals(other.model, model)) &&
            (identical(other.modelRestricted, modelRestricted) ||
                const DeepCollectionEquality()
                    .equals(other.modelRestricted, modelRestricted)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.changelog, changelog) ||
                const DeepCollectionEquality()
                    .equals(other.changelog, changelog)) &&
            (identical(other.prerequisiteVersion, prerequisiteVersion) ||
                const DeepCollectionEquality()
                    .equals(other.prerequisiteVersion, prerequisiteVersion)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(thingTypeUID) ^
      const DeepCollectionEquality().hash(vendor) ^
      const DeepCollectionEquality().hash(model) ^
      const DeepCollectionEquality().hash(modelRestricted) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(changelog) ^
      const DeepCollectionEquality().hash(prerequisiteVersion) ^
      runtimeType.hashCode;
}

extension $FirmwareDTOExtension on FirmwareDTO {
  FirmwareDTO copyWith(
      {String? thingTypeUID,
      String? vendor,
      String? model,
      bool? modelRestricted,
      String? description,
      String? version,
      String? changelog,
      String? prerequisiteVersion}) {
    return FirmwareDTO(
        thingTypeUID: thingTypeUID ?? this.thingTypeUID,
        vendor: vendor ?? this.vendor,
        model: model ?? this.model,
        modelRestricted: modelRestricted ?? this.modelRestricted,
        description: description ?? this.description,
        version: version ?? this.version,
        changelog: changelog ?? this.changelog,
        prerequisiteVersion: prerequisiteVersion ?? this.prerequisiteVersion);
  }

  FirmwareDTO copyWithWrapped(
      {Wrapped<String?>? thingTypeUID,
      Wrapped<String?>? vendor,
      Wrapped<String?>? model,
      Wrapped<bool?>? modelRestricted,
      Wrapped<String?>? description,
      Wrapped<String?>? version,
      Wrapped<String?>? changelog,
      Wrapped<String?>? prerequisiteVersion}) {
    return FirmwareDTO(
        thingTypeUID:
            (thingTypeUID != null ? thingTypeUID.value : this.thingTypeUID),
        vendor: (vendor != null ? vendor.value : this.vendor),
        model: (model != null ? model.value : this.model),
        modelRestricted: (modelRestricted != null
            ? modelRestricted.value
            : this.modelRestricted),
        description:
            (description != null ? description.value : this.description),
        version: (version != null ? version.value : this.version),
        changelog: (changelog != null ? changelog.value : this.changelog),
        prerequisiteVersion: (prerequisiteVersion != null
            ? prerequisiteVersion.value
            : this.prerequisiteVersion));
  }
}

@JsonSerializable(explicitToJson: true)
class StrippedThingTypeDTO {
  StrippedThingTypeDTO({
    this.uid,
    this.label,
    this.description,
    this.category,
    this.listed,
    this.supportedBridgeTypeUIDs,
    this.bridge,
  });

  factory StrippedThingTypeDTO.fromJson(Map<String, dynamic> json) =>
      _$StrippedThingTypeDTOFromJson(json);

  @JsonKey(name: 'UID')
  final String? uid;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'listed')
  final bool? listed;
  @JsonKey(name: 'supportedBridgeTypeUIDs', defaultValue: <String>[])
  final List<String>? supportedBridgeTypeUIDs;
  @JsonKey(name: 'bridge')
  final bool? bridge;
  static const fromJsonFactory = _$StrippedThingTypeDTOFromJson;
  static const toJsonFactory = _$StrippedThingTypeDTOToJson;
  Map<String, dynamic> toJson() => _$StrippedThingTypeDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StrippedThingTypeDTO &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.listed, listed) ||
                const DeepCollectionEquality().equals(other.listed, listed)) &&
            (identical(
                    other.supportedBridgeTypeUIDs, supportedBridgeTypeUIDs) ||
                const DeepCollectionEquality().equals(
                    other.supportedBridgeTypeUIDs, supportedBridgeTypeUIDs)) &&
            (identical(other.bridge, bridge) ||
                const DeepCollectionEquality().equals(other.bridge, bridge)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(listed) ^
      const DeepCollectionEquality().hash(supportedBridgeTypeUIDs) ^
      const DeepCollectionEquality().hash(bridge) ^
      runtimeType.hashCode;
}

extension $StrippedThingTypeDTOExtension on StrippedThingTypeDTO {
  StrippedThingTypeDTO copyWith(
      {String? uid,
      String? label,
      String? description,
      String? category,
      bool? listed,
      List<String>? supportedBridgeTypeUIDs,
      bool? bridge}) {
    return StrippedThingTypeDTO(
        uid: uid ?? this.uid,
        label: label ?? this.label,
        description: description ?? this.description,
        category: category ?? this.category,
        listed: listed ?? this.listed,
        supportedBridgeTypeUIDs:
            supportedBridgeTypeUIDs ?? this.supportedBridgeTypeUIDs,
        bridge: bridge ?? this.bridge);
  }

  StrippedThingTypeDTO copyWithWrapped(
      {Wrapped<String?>? uid,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<String?>? category,
      Wrapped<bool?>? listed,
      Wrapped<List<String>?>? supportedBridgeTypeUIDs,
      Wrapped<bool?>? bridge}) {
    return StrippedThingTypeDTO(
        uid: (uid != null ? uid.value : this.uid),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        category: (category != null ? category.value : this.category),
        listed: (listed != null ? listed.value : this.listed),
        supportedBridgeTypeUIDs: (supportedBridgeTypeUIDs != null
            ? supportedBridgeTypeUIDs.value
            : this.supportedBridgeTypeUIDs),
        bridge: (bridge != null ? bridge.value : this.bridge));
  }
}

@JsonSerializable(explicitToJson: true)
class ChannelDefinitionDTO {
  ChannelDefinitionDTO({
    this.description,
    this.id,
    this.label,
    this.tags,
    this.properties,
    this.category,
    this.stateDescription,
    this.advanced,
    this.typeUID,
  });

  factory ChannelDefinitionDTO.fromJson(Map<String, dynamic> json) =>
      _$ChannelDefinitionDTOFromJson(json);

  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'tags', defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(name: 'properties')
  final Map<String, dynamic>? properties;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'stateDescription')
  final StateDescription? stateDescription;
  @JsonKey(name: 'advanced')
  final bool? advanced;
  @JsonKey(name: 'typeUID')
  final String? typeUID;
  static const fromJsonFactory = _$ChannelDefinitionDTOFromJson;
  static const toJsonFactory = _$ChannelDefinitionDTOToJson;
  Map<String, dynamic> toJson() => _$ChannelDefinitionDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChannelDefinitionDTO &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.properties, properties) ||
                const DeepCollectionEquality()
                    .equals(other.properties, properties)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.stateDescription, stateDescription) ||
                const DeepCollectionEquality()
                    .equals(other.stateDescription, stateDescription)) &&
            (identical(other.advanced, advanced) ||
                const DeepCollectionEquality()
                    .equals(other.advanced, advanced)) &&
            (identical(other.typeUID, typeUID) ||
                const DeepCollectionEquality().equals(other.typeUID, typeUID)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(properties) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(stateDescription) ^
      const DeepCollectionEquality().hash(advanced) ^
      const DeepCollectionEquality().hash(typeUID) ^
      runtimeType.hashCode;
}

extension $ChannelDefinitionDTOExtension on ChannelDefinitionDTO {
  ChannelDefinitionDTO copyWith(
      {String? description,
      String? id,
      String? label,
      List<String>? tags,
      Map<String, dynamic>? properties,
      String? category,
      StateDescription? stateDescription,
      bool? advanced,
      String? typeUID}) {
    return ChannelDefinitionDTO(
        description: description ?? this.description,
        id: id ?? this.id,
        label: label ?? this.label,
        tags: tags ?? this.tags,
        properties: properties ?? this.properties,
        category: category ?? this.category,
        stateDescription: stateDescription ?? this.stateDescription,
        advanced: advanced ?? this.advanced,
        typeUID: typeUID ?? this.typeUID);
  }

  ChannelDefinitionDTO copyWithWrapped(
      {Wrapped<String?>? description,
      Wrapped<String?>? id,
      Wrapped<String?>? label,
      Wrapped<List<String>?>? tags,
      Wrapped<Map<String, dynamic>?>? properties,
      Wrapped<String?>? category,
      Wrapped<StateDescription?>? stateDescription,
      Wrapped<bool?>? advanced,
      Wrapped<String?>? typeUID}) {
    return ChannelDefinitionDTO(
        description:
            (description != null ? description.value : this.description),
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label),
        tags: (tags != null ? tags.value : this.tags),
        properties: (properties != null ? properties.value : this.properties),
        category: (category != null ? category.value : this.category),
        stateDescription: (stateDescription != null
            ? stateDescription.value
            : this.stateDescription),
        advanced: (advanced != null ? advanced.value : this.advanced),
        typeUID: (typeUID != null ? typeUID.value : this.typeUID));
  }
}

@JsonSerializable(explicitToJson: true)
class ChannelGroupDefinitionDTO {
  ChannelGroupDefinitionDTO({
    this.id,
    this.description,
    this.label,
    this.channels,
  });

  factory ChannelGroupDefinitionDTO.fromJson(Map<String, dynamic> json) =>
      _$ChannelGroupDefinitionDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'channels', defaultValue: <ChannelDefinitionDTO>[])
  final List<ChannelDefinitionDTO>? channels;
  static const fromJsonFactory = _$ChannelGroupDefinitionDTOFromJson;
  static const toJsonFactory = _$ChannelGroupDefinitionDTOToJson;
  Map<String, dynamic> toJson() => _$ChannelGroupDefinitionDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChannelGroupDefinitionDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.channels, channels) ||
                const DeepCollectionEquality()
                    .equals(other.channels, channels)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(channels) ^
      runtimeType.hashCode;
}

extension $ChannelGroupDefinitionDTOExtension on ChannelGroupDefinitionDTO {
  ChannelGroupDefinitionDTO copyWith(
      {String? id,
      String? description,
      String? label,
      List<ChannelDefinitionDTO>? channels}) {
    return ChannelGroupDefinitionDTO(
        id: id ?? this.id,
        description: description ?? this.description,
        label: label ?? this.label,
        channels: channels ?? this.channels);
  }

  ChannelGroupDefinitionDTO copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? description,
      Wrapped<String?>? label,
      Wrapped<List<ChannelDefinitionDTO>?>? channels}) {
    return ChannelGroupDefinitionDTO(
        id: (id != null ? id.value : this.id),
        description:
            (description != null ? description.value : this.description),
        label: (label != null ? label.value : this.label),
        channels: (channels != null ? channels.value : this.channels));
  }
}

@JsonSerializable(explicitToJson: true)
class ThingTypeDTO {
  ThingTypeDTO({
    this.uid,
    this.label,
    this.description,
    this.category,
    this.listed,
    this.supportedBridgeTypeUIDs,
    this.bridge,
    this.channels,
    this.channelGroups,
    this.configParameters,
    this.parameterGroups,
    this.properties,
    this.extensibleChannelTypeIds,
  });

  factory ThingTypeDTO.fromJson(Map<String, dynamic> json) =>
      _$ThingTypeDTOFromJson(json);

  @JsonKey(name: 'UID')
  final String? uid;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'listed')
  final bool? listed;
  @JsonKey(name: 'supportedBridgeTypeUIDs', defaultValue: <String>[])
  final List<String>? supportedBridgeTypeUIDs;
  @JsonKey(name: 'bridge')
  final bool? bridge;
  @JsonKey(name: 'channels', defaultValue: <ChannelDefinitionDTO>[])
  final List<ChannelDefinitionDTO>? channels;
  @JsonKey(name: 'channelGroups', defaultValue: <ChannelGroupDefinitionDTO>[])
  final List<ChannelGroupDefinitionDTO>? channelGroups;
  @JsonKey(
      name: 'configParameters', defaultValue: <ConfigDescriptionParameterDTO>[])
  final List<ConfigDescriptionParameterDTO>? configParameters;
  @JsonKey(
      name: 'parameterGroups',
      defaultValue: <ConfigDescriptionParameterGroupDTO>[])
  final List<ConfigDescriptionParameterGroupDTO>? parameterGroups;
  @JsonKey(name: 'properties')
  final Map<String, dynamic>? properties;
  @JsonKey(name: 'extensibleChannelTypeIds', defaultValue: <String>[])
  final List<String>? extensibleChannelTypeIds;
  static const fromJsonFactory = _$ThingTypeDTOFromJson;
  static const toJsonFactory = _$ThingTypeDTOToJson;
  Map<String, dynamic> toJson() => _$ThingTypeDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ThingTypeDTO &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.listed, listed) ||
                const DeepCollectionEquality().equals(other.listed, listed)) &&
            (identical(
                    other.supportedBridgeTypeUIDs, supportedBridgeTypeUIDs) ||
                const DeepCollectionEquality().equals(
                    other.supportedBridgeTypeUIDs, supportedBridgeTypeUIDs)) &&
            (identical(other.bridge, bridge) ||
                const DeepCollectionEquality().equals(other.bridge, bridge)) &&
            (identical(other.channels, channels) ||
                const DeepCollectionEquality()
                    .equals(other.channels, channels)) &&
            (identical(other.channelGroups, channelGroups) ||
                const DeepCollectionEquality()
                    .equals(other.channelGroups, channelGroups)) &&
            (identical(other.configParameters, configParameters) ||
                const DeepCollectionEquality()
                    .equals(other.configParameters, configParameters)) &&
            (identical(other.parameterGroups, parameterGroups) ||
                const DeepCollectionEquality()
                    .equals(other.parameterGroups, parameterGroups)) &&
            (identical(other.properties, properties) ||
                const DeepCollectionEquality()
                    .equals(other.properties, properties)) &&
            (identical(
                    other.extensibleChannelTypeIds, extensibleChannelTypeIds) ||
                const DeepCollectionEquality().equals(
                    other.extensibleChannelTypeIds, extensibleChannelTypeIds)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(listed) ^
      const DeepCollectionEquality().hash(supportedBridgeTypeUIDs) ^
      const DeepCollectionEquality().hash(bridge) ^
      const DeepCollectionEquality().hash(channels) ^
      const DeepCollectionEquality().hash(channelGroups) ^
      const DeepCollectionEquality().hash(configParameters) ^
      const DeepCollectionEquality().hash(parameterGroups) ^
      const DeepCollectionEquality().hash(properties) ^
      const DeepCollectionEquality().hash(extensibleChannelTypeIds) ^
      runtimeType.hashCode;
}

extension $ThingTypeDTOExtension on ThingTypeDTO {
  ThingTypeDTO copyWith(
      {String? uid,
      String? label,
      String? description,
      String? category,
      bool? listed,
      List<String>? supportedBridgeTypeUIDs,
      bool? bridge,
      List<ChannelDefinitionDTO>? channels,
      List<ChannelGroupDefinitionDTO>? channelGroups,
      List<ConfigDescriptionParameterDTO>? configParameters,
      List<ConfigDescriptionParameterGroupDTO>? parameterGroups,
      Map<String, dynamic>? properties,
      List<String>? extensibleChannelTypeIds}) {
    return ThingTypeDTO(
        uid: uid ?? this.uid,
        label: label ?? this.label,
        description: description ?? this.description,
        category: category ?? this.category,
        listed: listed ?? this.listed,
        supportedBridgeTypeUIDs:
            supportedBridgeTypeUIDs ?? this.supportedBridgeTypeUIDs,
        bridge: bridge ?? this.bridge,
        channels: channels ?? this.channels,
        channelGroups: channelGroups ?? this.channelGroups,
        configParameters: configParameters ?? this.configParameters,
        parameterGroups: parameterGroups ?? this.parameterGroups,
        properties: properties ?? this.properties,
        extensibleChannelTypeIds:
            extensibleChannelTypeIds ?? this.extensibleChannelTypeIds);
  }

  ThingTypeDTO copyWithWrapped(
      {Wrapped<String?>? uid,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<String?>? category,
      Wrapped<bool?>? listed,
      Wrapped<List<String>?>? supportedBridgeTypeUIDs,
      Wrapped<bool?>? bridge,
      Wrapped<List<ChannelDefinitionDTO>?>? channels,
      Wrapped<List<ChannelGroupDefinitionDTO>?>? channelGroups,
      Wrapped<List<ConfigDescriptionParameterDTO>?>? configParameters,
      Wrapped<List<ConfigDescriptionParameterGroupDTO>?>? parameterGroups,
      Wrapped<Map<String, dynamic>?>? properties,
      Wrapped<List<String>?>? extensibleChannelTypeIds}) {
    return ThingTypeDTO(
        uid: (uid != null ? uid.value : this.uid),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        category: (category != null ? category.value : this.category),
        listed: (listed != null ? listed.value : this.listed),
        supportedBridgeTypeUIDs: (supportedBridgeTypeUIDs != null
            ? supportedBridgeTypeUIDs.value
            : this.supportedBridgeTypeUIDs),
        bridge: (bridge != null ? bridge.value : this.bridge),
        channels: (channels != null ? channels.value : this.channels),
        channelGroups:
            (channelGroups != null ? channelGroups.value : this.channelGroups),
        configParameters: (configParameters != null
            ? configParameters.value
            : this.configParameters),
        parameterGroups: (parameterGroups != null
            ? parameterGroups.value
            : this.parameterGroups),
        properties: (properties != null ? properties.value : this.properties),
        extensibleChannelTypeIds: (extensibleChannelTypeIds != null
            ? extensibleChannelTypeIds.value
            : this.extensibleChannelTypeIds));
  }
}

@JsonSerializable(explicitToJson: true)
class Links {
  Links({
    this.type,
    this.url,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'url')
  final String? url;
  static const fromJsonFactory = _$LinksFromJson;
  static const toJsonFactory = _$LinksToJson;
  Map<String, dynamic> toJson() => _$LinksToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Links &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(url) ^
      runtimeType.hashCode;
}

extension $LinksExtension on Links {
  Links copyWith({String? type, String? url}) {
    return Links(type: type ?? this.type, url: url ?? this.url);
  }

  Links copyWithWrapped({Wrapped<String?>? type, Wrapped<String?>? url}) {
    return Links(
        type: (type != null ? type.value : this.type),
        url: (url != null ? url.value : this.url));
  }
}

@JsonSerializable(explicitToJson: true)
class RootBean {
  RootBean({
    this.version,
    this.locale,
    this.measurementSystem,
    this.runtimeInfo,
    this.links,
  });

  factory RootBean.fromJson(Map<String, dynamic> json) =>
      _$RootBeanFromJson(json);

  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'locale')
  final String? locale;
  @JsonKey(name: 'measurementSystem')
  final String? measurementSystem;
  @JsonKey(name: 'runtimeInfo')
  final RuntimeInfo? runtimeInfo;
  @JsonKey(name: 'links', defaultValue: <Links>[])
  final List<Links>? links;
  static const fromJsonFactory = _$RootBeanFromJson;
  static const toJsonFactory = _$RootBeanToJson;
  Map<String, dynamic> toJson() => _$RootBeanToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RootBean &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)) &&
            (identical(other.measurementSystem, measurementSystem) ||
                const DeepCollectionEquality()
                    .equals(other.measurementSystem, measurementSystem)) &&
            (identical(other.runtimeInfo, runtimeInfo) ||
                const DeepCollectionEquality()
                    .equals(other.runtimeInfo, runtimeInfo)) &&
            (identical(other.links, links) ||
                const DeepCollectionEquality().equals(other.links, links)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(locale) ^
      const DeepCollectionEquality().hash(measurementSystem) ^
      const DeepCollectionEquality().hash(runtimeInfo) ^
      const DeepCollectionEquality().hash(links) ^
      runtimeType.hashCode;
}

extension $RootBeanExtension on RootBean {
  RootBean copyWith(
      {String? version,
      String? locale,
      String? measurementSystem,
      RuntimeInfo? runtimeInfo,
      List<Links>? links}) {
    return RootBean(
        version: version ?? this.version,
        locale: locale ?? this.locale,
        measurementSystem: measurementSystem ?? this.measurementSystem,
        runtimeInfo: runtimeInfo ?? this.runtimeInfo,
        links: links ?? this.links);
  }

  RootBean copyWithWrapped(
      {Wrapped<String?>? version,
      Wrapped<String?>? locale,
      Wrapped<String?>? measurementSystem,
      Wrapped<RuntimeInfo?>? runtimeInfo,
      Wrapped<List<Links>?>? links}) {
    return RootBean(
        version: (version != null ? version.value : this.version),
        locale: (locale != null ? locale.value : this.locale),
        measurementSystem: (measurementSystem != null
            ? measurementSystem.value
            : this.measurementSystem),
        runtimeInfo:
            (runtimeInfo != null ? runtimeInfo.value : this.runtimeInfo),
        links: (links != null ? links.value : this.links));
  }
}

@JsonSerializable(explicitToJson: true)
class RuntimeInfo {
  RuntimeInfo({
    this.version,
    this.buildString,
  });

  factory RuntimeInfo.fromJson(Map<String, dynamic> json) =>
      _$RuntimeInfoFromJson(json);

  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'buildString')
  final String? buildString;
  static const fromJsonFactory = _$RuntimeInfoFromJson;
  static const toJsonFactory = _$RuntimeInfoToJson;
  Map<String, dynamic> toJson() => _$RuntimeInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RuntimeInfo &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.buildString, buildString) ||
                const DeepCollectionEquality()
                    .equals(other.buildString, buildString)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(buildString) ^
      runtimeType.hashCode;
}

extension $RuntimeInfoExtension on RuntimeInfo {
  RuntimeInfo copyWith({String? version, String? buildString}) {
    return RuntimeInfo(
        version: version ?? this.version,
        buildString: buildString ?? this.buildString);
  }

  RuntimeInfo copyWithWrapped(
      {Wrapped<String?>? version, Wrapped<String?>? buildString}) {
    return RuntimeInfo(
        version: (version != null ? version.value : this.version),
        buildString:
            (buildString != null ? buildString.value : this.buildString));
  }
}

@JsonSerializable(explicitToJson: true)
class SystemInfo {
  SystemInfo({
    this.configFolder,
    this.userdataFolder,
    this.logFolder,
    this.javaVersion,
    this.javaVendor,
    this.javaVendorVersion,
    this.osName,
    this.osVersion,
    this.osArchitecture,
    this.availableProcessors,
    this.freeMemory,
    this.totalMemory,
    this.startLevel,
  });

  factory SystemInfo.fromJson(Map<String, dynamic> json) =>
      _$SystemInfoFromJson(json);

  @JsonKey(name: 'configFolder')
  final String? configFolder;
  @JsonKey(name: 'userdataFolder')
  final String? userdataFolder;
  @JsonKey(name: 'logFolder')
  final String? logFolder;
  @JsonKey(name: 'javaVersion')
  final String? javaVersion;
  @JsonKey(name: 'javaVendor')
  final String? javaVendor;
  @JsonKey(name: 'javaVendorVersion')
  final String? javaVendorVersion;
  @JsonKey(name: 'osName')
  final String? osName;
  @JsonKey(name: 'osVersion')
  final String? osVersion;
  @JsonKey(name: 'osArchitecture')
  final String? osArchitecture;
  @JsonKey(name: 'availableProcessors')
  final int? availableProcessors;
  @JsonKey(name: 'freeMemory')
  final num? freeMemory;
  @JsonKey(name: 'totalMemory')
  final num? totalMemory;
  @JsonKey(name: 'startLevel')
  final int? startLevel;
  static const fromJsonFactory = _$SystemInfoFromJson;
  static const toJsonFactory = _$SystemInfoToJson;
  Map<String, dynamic> toJson() => _$SystemInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SystemInfo &&
            (identical(other.configFolder, configFolder) ||
                const DeepCollectionEquality()
                    .equals(other.configFolder, configFolder)) &&
            (identical(other.userdataFolder, userdataFolder) ||
                const DeepCollectionEquality()
                    .equals(other.userdataFolder, userdataFolder)) &&
            (identical(other.logFolder, logFolder) ||
                const DeepCollectionEquality()
                    .equals(other.logFolder, logFolder)) &&
            (identical(other.javaVersion, javaVersion) ||
                const DeepCollectionEquality()
                    .equals(other.javaVersion, javaVersion)) &&
            (identical(other.javaVendor, javaVendor) ||
                const DeepCollectionEquality()
                    .equals(other.javaVendor, javaVendor)) &&
            (identical(other.javaVendorVersion, javaVendorVersion) ||
                const DeepCollectionEquality()
                    .equals(other.javaVendorVersion, javaVendorVersion)) &&
            (identical(other.osName, osName) ||
                const DeepCollectionEquality().equals(other.osName, osName)) &&
            (identical(other.osVersion, osVersion) ||
                const DeepCollectionEquality()
                    .equals(other.osVersion, osVersion)) &&
            (identical(other.osArchitecture, osArchitecture) ||
                const DeepCollectionEquality()
                    .equals(other.osArchitecture, osArchitecture)) &&
            (identical(other.availableProcessors, availableProcessors) ||
                const DeepCollectionEquality()
                    .equals(other.availableProcessors, availableProcessors)) &&
            (identical(other.freeMemory, freeMemory) ||
                const DeepCollectionEquality()
                    .equals(other.freeMemory, freeMemory)) &&
            (identical(other.totalMemory, totalMemory) ||
                const DeepCollectionEquality()
                    .equals(other.totalMemory, totalMemory)) &&
            (identical(other.startLevel, startLevel) ||
                const DeepCollectionEquality()
                    .equals(other.startLevel, startLevel)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(configFolder) ^
      const DeepCollectionEquality().hash(userdataFolder) ^
      const DeepCollectionEquality().hash(logFolder) ^
      const DeepCollectionEquality().hash(javaVersion) ^
      const DeepCollectionEquality().hash(javaVendor) ^
      const DeepCollectionEquality().hash(javaVendorVersion) ^
      const DeepCollectionEquality().hash(osName) ^
      const DeepCollectionEquality().hash(osVersion) ^
      const DeepCollectionEquality().hash(osArchitecture) ^
      const DeepCollectionEquality().hash(availableProcessors) ^
      const DeepCollectionEquality().hash(freeMemory) ^
      const DeepCollectionEquality().hash(totalMemory) ^
      const DeepCollectionEquality().hash(startLevel) ^
      runtimeType.hashCode;
}

extension $SystemInfoExtension on SystemInfo {
  SystemInfo copyWith(
      {String? configFolder,
      String? userdataFolder,
      String? logFolder,
      String? javaVersion,
      String? javaVendor,
      String? javaVendorVersion,
      String? osName,
      String? osVersion,
      String? osArchitecture,
      int? availableProcessors,
      num? freeMemory,
      num? totalMemory,
      int? startLevel}) {
    return SystemInfo(
        configFolder: configFolder ?? this.configFolder,
        userdataFolder: userdataFolder ?? this.userdataFolder,
        logFolder: logFolder ?? this.logFolder,
        javaVersion: javaVersion ?? this.javaVersion,
        javaVendor: javaVendor ?? this.javaVendor,
        javaVendorVersion: javaVendorVersion ?? this.javaVendorVersion,
        osName: osName ?? this.osName,
        osVersion: osVersion ?? this.osVersion,
        osArchitecture: osArchitecture ?? this.osArchitecture,
        availableProcessors: availableProcessors ?? this.availableProcessors,
        freeMemory: freeMemory ?? this.freeMemory,
        totalMemory: totalMemory ?? this.totalMemory,
        startLevel: startLevel ?? this.startLevel);
  }

  SystemInfo copyWithWrapped(
      {Wrapped<String?>? configFolder,
      Wrapped<String?>? userdataFolder,
      Wrapped<String?>? logFolder,
      Wrapped<String?>? javaVersion,
      Wrapped<String?>? javaVendor,
      Wrapped<String?>? javaVendorVersion,
      Wrapped<String?>? osName,
      Wrapped<String?>? osVersion,
      Wrapped<String?>? osArchitecture,
      Wrapped<int?>? availableProcessors,
      Wrapped<num?>? freeMemory,
      Wrapped<num?>? totalMemory,
      Wrapped<int?>? startLevel}) {
    return SystemInfo(
        configFolder:
            (configFolder != null ? configFolder.value : this.configFolder),
        userdataFolder: (userdataFolder != null
            ? userdataFolder.value
            : this.userdataFolder),
        logFolder: (logFolder != null ? logFolder.value : this.logFolder),
        javaVersion:
            (javaVersion != null ? javaVersion.value : this.javaVersion),
        javaVendor: (javaVendor != null ? javaVendor.value : this.javaVendor),
        javaVendorVersion: (javaVendorVersion != null
            ? javaVendorVersion.value
            : this.javaVendorVersion),
        osName: (osName != null ? osName.value : this.osName),
        osVersion: (osVersion != null ? osVersion.value : this.osVersion),
        osArchitecture: (osArchitecture != null
            ? osArchitecture.value
            : this.osArchitecture),
        availableProcessors: (availableProcessors != null
            ? availableProcessors.value
            : this.availableProcessors),
        freeMemory: (freeMemory != null ? freeMemory.value : this.freeMemory),
        totalMemory:
            (totalMemory != null ? totalMemory.value : this.totalMemory),
        startLevel: (startLevel != null ? startLevel.value : this.startLevel));
  }
}

@JsonSerializable(explicitToJson: true)
class SystemInfoBean {
  SystemInfoBean({
    this.systemInfo,
  });

  factory SystemInfoBean.fromJson(Map<String, dynamic> json) =>
      _$SystemInfoBeanFromJson(json);

  @JsonKey(name: 'systemInfo')
  final SystemInfo? systemInfo;
  static const fromJsonFactory = _$SystemInfoBeanFromJson;
  static const toJsonFactory = _$SystemInfoBeanToJson;
  Map<String, dynamic> toJson() => _$SystemInfoBeanToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SystemInfoBean &&
            (identical(other.systemInfo, systemInfo) ||
                const DeepCollectionEquality()
                    .equals(other.systemInfo, systemInfo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(systemInfo) ^ runtimeType.hashCode;
}

extension $SystemInfoBeanExtension on SystemInfoBean {
  SystemInfoBean copyWith({SystemInfo? systemInfo}) {
    return SystemInfoBean(systemInfo: systemInfo ?? this.systemInfo);
  }

  SystemInfoBean copyWithWrapped({Wrapped<SystemInfo?>? systemInfo}) {
    return SystemInfoBean(
        systemInfo: (systemInfo != null ? systemInfo.value : this.systemInfo));
  }
}

@JsonSerializable(explicitToJson: true)
class MappingDTO {
  MappingDTO({
    this.command,
    this.label,
  });

  factory MappingDTO.fromJson(Map<String, dynamic> json) =>
      _$MappingDTOFromJson(json);

  @JsonKey(name: 'command')
  final String? command;
  @JsonKey(name: 'label')
  final String? label;
  static const fromJsonFactory = _$MappingDTOFromJson;
  static const toJsonFactory = _$MappingDTOToJson;
  Map<String, dynamic> toJson() => _$MappingDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MappingDTO &&
            (identical(other.command, command) ||
                const DeepCollectionEquality()
                    .equals(other.command, command)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(command) ^
      const DeepCollectionEquality().hash(label) ^
      runtimeType.hashCode;
}

extension $MappingDTOExtension on MappingDTO {
  MappingDTO copyWith({String? command, String? label}) {
    return MappingDTO(
        command: command ?? this.command, label: label ?? this.label);
  }

  MappingDTO copyWithWrapped(
      {Wrapped<String?>? command, Wrapped<String?>? label}) {
    return MappingDTO(
        command: (command != null ? command.value : this.command),
        label: (label != null ? label.value : this.label));
  }
}

@JsonSerializable(explicitToJson: true)
class PageDTO {
  PageDTO({
    this.id,
    this.title,
    this.icon,
    this.link,
    this.parent,
    this.leaf,
    this.timeout,
    this.widgets,
  });

  factory PageDTO.fromJson(Map<String, dynamic> json) =>
      _$PageDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'link')
  final String? link;
  @JsonKey(name: 'parent')
  final PageDTO? parent;
  @JsonKey(name: 'leaf')
  final bool? leaf;
  @JsonKey(name: 'timeout')
  final bool? timeout;
  @JsonKey(name: 'widgets', defaultValue: <WidgetDTO>[])
  final List<WidgetDTO>? widgets;
  static const fromJsonFactory = _$PageDTOFromJson;
  static const toJsonFactory = _$PageDTOToJson;
  Map<String, dynamic> toJson() => _$PageDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PageDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)) &&
            (identical(other.parent, parent) ||
                const DeepCollectionEquality().equals(other.parent, parent)) &&
            (identical(other.leaf, leaf) ||
                const DeepCollectionEquality().equals(other.leaf, leaf)) &&
            (identical(other.timeout, timeout) ||
                const DeepCollectionEquality()
                    .equals(other.timeout, timeout)) &&
            (identical(other.widgets, widgets) ||
                const DeepCollectionEquality().equals(other.widgets, widgets)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(link) ^
      const DeepCollectionEquality().hash(parent) ^
      const DeepCollectionEquality().hash(leaf) ^
      const DeepCollectionEquality().hash(timeout) ^
      const DeepCollectionEquality().hash(widgets) ^
      runtimeType.hashCode;
}

extension $PageDTOExtension on PageDTO {
  PageDTO copyWith(
      {String? id,
      String? title,
      String? icon,
      String? link,
      PageDTO? parent,
      bool? leaf,
      bool? timeout,
      List<WidgetDTO>? widgets}) {
    return PageDTO(
        id: id ?? this.id,
        title: title ?? this.title,
        icon: icon ?? this.icon,
        link: link ?? this.link,
        parent: parent ?? this.parent,
        leaf: leaf ?? this.leaf,
        timeout: timeout ?? this.timeout,
        widgets: widgets ?? this.widgets);
  }

  PageDTO copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? title,
      Wrapped<String?>? icon,
      Wrapped<String?>? link,
      Wrapped<PageDTO?>? parent,
      Wrapped<bool?>? leaf,
      Wrapped<bool?>? timeout,
      Wrapped<List<WidgetDTO>?>? widgets}) {
    return PageDTO(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        icon: (icon != null ? icon.value : this.icon),
        link: (link != null ? link.value : this.link),
        parent: (parent != null ? parent.value : this.parent),
        leaf: (leaf != null ? leaf.value : this.leaf),
        timeout: (timeout != null ? timeout.value : this.timeout),
        widgets: (widgets != null ? widgets.value : this.widgets));
  }
}

@JsonSerializable(explicitToJson: true)
class WidgetDTO {
  WidgetDTO({
    this.widgetId,
    this.type,
    this.name,
    this.visibility,
    this.label,
    this.icon,
    this.labelcolor,
    this.valuecolor,
    this.mappings,
    this.switchSupport,
    this.sendFrequency,
    this.separator,
    this.refresh,
    this.height,
    this.minValue,
    this.maxValue,
    this.step,
    this.url,
    this.encoding,
    this.service,
    this.period,
    this.yAxisDecimalPattern,
    this.legend,
    this.forceAsItem,
    this.state,
    this.item,
    this.linkedPage,
  });

  factory WidgetDTO.fromJson(Map<String, dynamic> json) =>
      _$WidgetDTOFromJson(json);

  @JsonKey(name: 'widgetId')
  final String? widgetId;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'visibility')
  final bool? visibility;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'labelcolor')
  final String? labelcolor;
  @JsonKey(name: 'valuecolor')
  final String? valuecolor;
  @JsonKey(name: 'mappings', defaultValue: <MappingDTO>[])
  final List<MappingDTO>? mappings;
  @JsonKey(name: 'switchSupport')
  final bool? switchSupport;
  @JsonKey(name: 'sendFrequency')
  final int? sendFrequency;
  @JsonKey(name: 'separator')
  final String? separator;
  @JsonKey(name: 'refresh')
  final int? refresh;
  @JsonKey(name: 'height')
  final int? height;
  @JsonKey(name: 'minValue')
  final double? minValue;
  @JsonKey(name: 'maxValue')
  final double? maxValue;
  @JsonKey(name: 'step')
  final double? step;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'encoding')
  final String? encoding;
  @JsonKey(name: 'service')
  final String? service;
  @JsonKey(name: 'period')
  final String? period;
  @JsonKey(name: 'yAxisDecimalPattern')
  final String? yAxisDecimalPattern;
  @JsonKey(name: 'legend')
  final bool? legend;
  @JsonKey(name: 'forceAsItem')
  final bool? forceAsItem;
  @JsonKey(name: 'state')
  final String? state;
  @JsonKey(name: 'item')
  final EnrichedItemDTO? item;
  @JsonKey(name: 'linkedPage')
  final PageDTO? linkedPage;
  static const fromJsonFactory = _$WidgetDTOFromJson;
  static const toJsonFactory = _$WidgetDTOToJson;
  Map<String, dynamic> toJson() => _$WidgetDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WidgetDTO &&
            (identical(other.widgetId, widgetId) ||
                const DeepCollectionEquality()
                    .equals(other.widgetId, widgetId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.labelcolor, labelcolor) ||
                const DeepCollectionEquality()
                    .equals(other.labelcolor, labelcolor)) &&
            (identical(other.valuecolor, valuecolor) ||
                const DeepCollectionEquality()
                    .equals(other.valuecolor, valuecolor)) &&
            (identical(other.mappings, mappings) ||
                const DeepCollectionEquality()
                    .equals(other.mappings, mappings)) &&
            (identical(other.switchSupport, switchSupport) ||
                const DeepCollectionEquality()
                    .equals(other.switchSupport, switchSupport)) &&
            (identical(other.sendFrequency, sendFrequency) ||
                const DeepCollectionEquality()
                    .equals(other.sendFrequency, sendFrequency)) &&
            (identical(other.separator, separator) ||
                const DeepCollectionEquality()
                    .equals(other.separator, separator)) &&
            (identical(other.refresh, refresh) ||
                const DeepCollectionEquality()
                    .equals(other.refresh, refresh)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.minValue, minValue) ||
                const DeepCollectionEquality()
                    .equals(other.minValue, minValue)) &&
            (identical(other.maxValue, maxValue) ||
                const DeepCollectionEquality()
                    .equals(other.maxValue, maxValue)) &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.encoding, encoding) ||
                const DeepCollectionEquality()
                    .equals(other.encoding, encoding)) &&
            (identical(other.service, service) ||
                const DeepCollectionEquality()
                    .equals(other.service, service)) &&
            (identical(other.period, period) ||
                const DeepCollectionEquality().equals(other.period, period)) &&
            (identical(other.yAxisDecimalPattern, yAxisDecimalPattern) ||
                const DeepCollectionEquality()
                    .equals(other.yAxisDecimalPattern, yAxisDecimalPattern)) &&
            (identical(other.legend, legend) ||
                const DeepCollectionEquality().equals(other.legend, legend)) &&
            (identical(other.forceAsItem, forceAsItem) ||
                const DeepCollectionEquality()
                    .equals(other.forceAsItem, forceAsItem)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.item, item) ||
                const DeepCollectionEquality().equals(other.item, item)) &&
            (identical(other.linkedPage, linkedPage) ||
                const DeepCollectionEquality()
                    .equals(other.linkedPage, linkedPage)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(widgetId) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(labelcolor) ^
      const DeepCollectionEquality().hash(valuecolor) ^
      const DeepCollectionEquality().hash(mappings) ^
      const DeepCollectionEquality().hash(switchSupport) ^
      const DeepCollectionEquality().hash(sendFrequency) ^
      const DeepCollectionEquality().hash(separator) ^
      const DeepCollectionEquality().hash(refresh) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue) ^
      const DeepCollectionEquality().hash(step) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(encoding) ^
      const DeepCollectionEquality().hash(service) ^
      const DeepCollectionEquality().hash(period) ^
      const DeepCollectionEquality().hash(yAxisDecimalPattern) ^
      const DeepCollectionEquality().hash(legend) ^
      const DeepCollectionEquality().hash(forceAsItem) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(item) ^
      const DeepCollectionEquality().hash(linkedPage) ^
      runtimeType.hashCode;
}

extension $WidgetDTOExtension on WidgetDTO {
  WidgetDTO copyWith(
      {String? widgetId,
      String? type,
      String? name,
      bool? visibility,
      String? label,
      String? icon,
      String? labelcolor,
      String? valuecolor,
      List<MappingDTO>? mappings,
      bool? switchSupport,
      int? sendFrequency,
      String? separator,
      int? refresh,
      int? height,
      double? minValue,
      double? maxValue,
      double? step,
      String? url,
      String? encoding,
      String? service,
      String? period,
      String? yAxisDecimalPattern,
      bool? legend,
      bool? forceAsItem,
      String? state,
      EnrichedItemDTO? item,
      PageDTO? linkedPage}) {
    return WidgetDTO(
        widgetId: widgetId ?? this.widgetId,
        type: type ?? this.type,
        name: name ?? this.name,
        visibility: visibility ?? this.visibility,
        label: label ?? this.label,
        icon: icon ?? this.icon,
        labelcolor: labelcolor ?? this.labelcolor,
        valuecolor: valuecolor ?? this.valuecolor,
        mappings: mappings ?? this.mappings,
        switchSupport: switchSupport ?? this.switchSupport,
        sendFrequency: sendFrequency ?? this.sendFrequency,
        separator: separator ?? this.separator,
        refresh: refresh ?? this.refresh,
        height: height ?? this.height,
        minValue: minValue ?? this.minValue,
        maxValue: maxValue ?? this.maxValue,
        step: step ?? this.step,
        url: url ?? this.url,
        encoding: encoding ?? this.encoding,
        service: service ?? this.service,
        period: period ?? this.period,
        yAxisDecimalPattern: yAxisDecimalPattern ?? this.yAxisDecimalPattern,
        legend: legend ?? this.legend,
        forceAsItem: forceAsItem ?? this.forceAsItem,
        state: state ?? this.state,
        item: item ?? this.item,
        linkedPage: linkedPage ?? this.linkedPage);
  }

  WidgetDTO copyWithWrapped(
      {Wrapped<String?>? widgetId,
      Wrapped<String?>? type,
      Wrapped<String?>? name,
      Wrapped<bool?>? visibility,
      Wrapped<String?>? label,
      Wrapped<String?>? icon,
      Wrapped<String?>? labelcolor,
      Wrapped<String?>? valuecolor,
      Wrapped<List<MappingDTO>?>? mappings,
      Wrapped<bool?>? switchSupport,
      Wrapped<int?>? sendFrequency,
      Wrapped<String?>? separator,
      Wrapped<int?>? refresh,
      Wrapped<int?>? height,
      Wrapped<double?>? minValue,
      Wrapped<double?>? maxValue,
      Wrapped<double?>? step,
      Wrapped<String?>? url,
      Wrapped<String?>? encoding,
      Wrapped<String?>? service,
      Wrapped<String?>? period,
      Wrapped<String?>? yAxisDecimalPattern,
      Wrapped<bool?>? legend,
      Wrapped<bool?>? forceAsItem,
      Wrapped<String?>? state,
      Wrapped<EnrichedItemDTO?>? item,
      Wrapped<PageDTO?>? linkedPage}) {
    return WidgetDTO(
        widgetId: (widgetId != null ? widgetId.value : this.widgetId),
        type: (type != null ? type.value : this.type),
        name: (name != null ? name.value : this.name),
        visibility: (visibility != null ? visibility.value : this.visibility),
        label: (label != null ? label.value : this.label),
        icon: (icon != null ? icon.value : this.icon),
        labelcolor: (labelcolor != null ? labelcolor.value : this.labelcolor),
        valuecolor: (valuecolor != null ? valuecolor.value : this.valuecolor),
        mappings: (mappings != null ? mappings.value : this.mappings),
        switchSupport:
            (switchSupport != null ? switchSupport.value : this.switchSupport),
        sendFrequency:
            (sendFrequency != null ? sendFrequency.value : this.sendFrequency),
        separator: (separator != null ? separator.value : this.separator),
        refresh: (refresh != null ? refresh.value : this.refresh),
        height: (height != null ? height.value : this.height),
        minValue: (minValue != null ? minValue.value : this.minValue),
        maxValue: (maxValue != null ? maxValue.value : this.maxValue),
        step: (step != null ? step.value : this.step),
        url: (url != null ? url.value : this.url),
        encoding: (encoding != null ? encoding.value : this.encoding),
        service: (service != null ? service.value : this.service),
        period: (period != null ? period.value : this.period),
        yAxisDecimalPattern: (yAxisDecimalPattern != null
            ? yAxisDecimalPattern.value
            : this.yAxisDecimalPattern),
        legend: (legend != null ? legend.value : this.legend),
        forceAsItem:
            (forceAsItem != null ? forceAsItem.value : this.forceAsItem),
        state: (state != null ? state.value : this.state),
        item: (item != null ? item.value : this.item),
        linkedPage: (linkedPage != null ? linkedPage.value : this.linkedPage));
  }
}

@JsonSerializable(explicitToJson: true)
class SitemapDTO {
  SitemapDTO({
    this.name,
    this.icon,
    this.label,
    this.link,
    this.homepage,
  });

  factory SitemapDTO.fromJson(Map<String, dynamic> json) =>
      _$SitemapDTOFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'link')
  final String? link;
  @JsonKey(name: 'homepage')
  final PageDTO? homepage;
  static const fromJsonFactory = _$SitemapDTOFromJson;
  static const toJsonFactory = _$SitemapDTOToJson;
  Map<String, dynamic> toJson() => _$SitemapDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SitemapDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)) &&
            (identical(other.homepage, homepage) ||
                const DeepCollectionEquality()
                    .equals(other.homepage, homepage)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(link) ^
      const DeepCollectionEquality().hash(homepage) ^
      runtimeType.hashCode;
}

extension $SitemapDTOExtension on SitemapDTO {
  SitemapDTO copyWith(
      {String? name,
      String? icon,
      String? label,
      String? link,
      PageDTO? homepage}) {
    return SitemapDTO(
        name: name ?? this.name,
        icon: icon ?? this.icon,
        label: label ?? this.label,
        link: link ?? this.link,
        homepage: homepage ?? this.homepage);
  }

  SitemapDTO copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<String?>? icon,
      Wrapped<String?>? label,
      Wrapped<String?>? link,
      Wrapped<PageDTO?>? homepage}) {
    return SitemapDTO(
        name: (name != null ? name.value : this.name),
        icon: (icon != null ? icon.value : this.icon),
        label: (label != null ? label.value : this.label),
        link: (link != null ? link.value : this.link),
        homepage: (homepage != null ? homepage.value : this.homepage));
  }
}

@JsonSerializable(explicitToJson: true)
class Transformation {
  Transformation({
    this.uid,
    this.label,
    this.type,
    this.configuration,
  });

  factory Transformation.fromJson(Map<String, dynamic> json) =>
      _$TransformationFromJson(json);

  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  static const fromJsonFactory = _$TransformationFromJson;
  static const toJsonFactory = _$TransformationToJson;
  Map<String, dynamic> toJson() => _$TransformationToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Transformation &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(configuration) ^
      runtimeType.hashCode;
}

extension $TransformationExtension on Transformation {
  Transformation copyWith(
      {String? uid,
      String? label,
      String? type,
      Map<String, dynamic>? configuration}) {
    return Transformation(
        uid: uid ?? this.uid,
        label: label ?? this.label,
        type: type ?? this.type,
        configuration: configuration ?? this.configuration);
  }

  Transformation copyWithWrapped(
      {Wrapped<String?>? uid,
      Wrapped<String?>? label,
      Wrapped<String?>? type,
      Wrapped<Map<String, dynamic>?>? configuration}) {
    return Transformation(
        uid: (uid != null ? uid.value : this.uid),
        label: (label != null ? label.value : this.label),
        type: (type != null ? type.value : this.type),
        configuration:
            (configuration != null ? configuration.value : this.configuration));
  }
}

@JsonSerializable(explicitToJson: true)
class TransformationDTO {
  TransformationDTO({
    this.uid,
    this.label,
    this.type,
    this.configuration,
    this.editable,
  });

  factory TransformationDTO.fromJson(Map<String, dynamic> json) =>
      _$TransformationDTOFromJson(json);

  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'configuration')
  final Map<String, dynamic>? configuration;
  @JsonKey(name: 'editable')
  final bool? editable;
  static const fromJsonFactory = _$TransformationDTOFromJson;
  static const toJsonFactory = _$TransformationDTOToJson;
  Map<String, dynamic> toJson() => _$TransformationDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TransformationDTO &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.configuration, configuration) ||
                const DeepCollectionEquality()
                    .equals(other.configuration, configuration)) &&
            (identical(other.editable, editable) ||
                const DeepCollectionEquality()
                    .equals(other.editable, editable)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(configuration) ^
      const DeepCollectionEquality().hash(editable) ^
      runtimeType.hashCode;
}

extension $TransformationDTOExtension on TransformationDTO {
  TransformationDTO copyWith(
      {String? uid,
      String? label,
      String? type,
      Map<String, dynamic>? configuration,
      bool? editable}) {
    return TransformationDTO(
        uid: uid ?? this.uid,
        label: label ?? this.label,
        type: type ?? this.type,
        configuration: configuration ?? this.configuration,
        editable: editable ?? this.editable);
  }

  TransformationDTO copyWithWrapped(
      {Wrapped<String?>? uid,
      Wrapped<String?>? label,
      Wrapped<String?>? type,
      Wrapped<Map<String, dynamic>?>? configuration,
      Wrapped<bool?>? editable}) {
    return TransformationDTO(
        uid: (uid != null ? uid.value : this.uid),
        label: (label != null ? label.value : this.label),
        type: (type != null ? type.value : this.type),
        configuration:
            (configuration != null ? configuration.value : this.configuration),
        editable: (editable != null ? editable.value : this.editable));
  }
}

@JsonSerializable(explicitToJson: true)
class RootUIComponent {
  RootUIComponent({
    this.component,
    this.config,
    this.slots,
    this.uid,
    this.tags,
    this.props,
    this.timestamp,
    this.type,
  });

  factory RootUIComponent.fromJson(Map<String, dynamic> json) =>
      _$RootUIComponentFromJson(json);

  @JsonKey(name: 'component')
  final String? component;
  @JsonKey(name: 'config')
  final Map<String, dynamic>? config;
  @JsonKey(name: 'slots')
  final Map<String, dynamic>? slots;
  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(name: 'tags', defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(name: 'props')
  final ConfigDescriptionDTO? props;
  @JsonKey(name: 'timestamp')
  final DateTime? timestamp;
  @JsonKey(name: 'type')
  final String? type;
  static const fromJsonFactory = _$RootUIComponentFromJson;
  static const toJsonFactory = _$RootUIComponentToJson;
  Map<String, dynamic> toJson() => _$RootUIComponentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RootUIComponent &&
            (identical(other.component, component) ||
                const DeepCollectionEquality()
                    .equals(other.component, component)) &&
            (identical(other.config, config) ||
                const DeepCollectionEquality().equals(other.config, config)) &&
            (identical(other.slots, slots) ||
                const DeepCollectionEquality().equals(other.slots, slots)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.props, props) ||
                const DeepCollectionEquality().equals(other.props, props)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(component) ^
      const DeepCollectionEquality().hash(config) ^
      const DeepCollectionEquality().hash(slots) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(props) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $RootUIComponentExtension on RootUIComponent {
  RootUIComponent copyWith(
      {String? component,
      Map<String, dynamic>? config,
      Map<String, dynamic>? slots,
      String? uid,
      List<String>? tags,
      ConfigDescriptionDTO? props,
      DateTime? timestamp,
      String? type}) {
    return RootUIComponent(
        component: component ?? this.component,
        config: config ?? this.config,
        slots: slots ?? this.slots,
        uid: uid ?? this.uid,
        tags: tags ?? this.tags,
        props: props ?? this.props,
        timestamp: timestamp ?? this.timestamp,
        type: type ?? this.type);
  }

  RootUIComponent copyWithWrapped(
      {Wrapped<String?>? component,
      Wrapped<Map<String, dynamic>?>? config,
      Wrapped<Map<String, dynamic>?>? slots,
      Wrapped<String?>? uid,
      Wrapped<List<String>?>? tags,
      Wrapped<ConfigDescriptionDTO?>? props,
      Wrapped<DateTime?>? timestamp,
      Wrapped<String?>? type}) {
    return RootUIComponent(
        component: (component != null ? component.value : this.component),
        config: (config != null ? config.value : this.config),
        slots: (slots != null ? slots.value : this.slots),
        uid: (uid != null ? uid.value : this.uid),
        tags: (tags != null ? tags.value : this.tags),
        props: (props != null ? props.value : this.props),
        timestamp: (timestamp != null ? timestamp.value : this.timestamp),
        type: (type != null ? type.value : this.type));
  }
}

@JsonSerializable(explicitToJson: true)
class UIComponent {
  UIComponent({
    this.component,
    this.config,
    this.type,
  });

  factory UIComponent.fromJson(Map<String, dynamic> json) =>
      _$UIComponentFromJson(json);

  @JsonKey(name: 'component')
  final String? component;
  @JsonKey(name: 'config')
  final Map<String, dynamic>? config;
  @JsonKey(name: 'type')
  final String? type;
  static const fromJsonFactory = _$UIComponentFromJson;
  static const toJsonFactory = _$UIComponentToJson;
  Map<String, dynamic> toJson() => _$UIComponentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UIComponent &&
            (identical(other.component, component) ||
                const DeepCollectionEquality()
                    .equals(other.component, component)) &&
            (identical(other.config, config) ||
                const DeepCollectionEquality().equals(other.config, config)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(component) ^
      const DeepCollectionEquality().hash(config) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $UIComponentExtension on UIComponent {
  UIComponent copyWith(
      {String? component, Map<String, dynamic>? config, String? type}) {
    return UIComponent(
        component: component ?? this.component,
        config: config ?? this.config,
        type: type ?? this.type);
  }

  UIComponent copyWithWrapped(
      {Wrapped<String?>? component,
      Wrapped<Map<String, dynamic>?>? config,
      Wrapped<String?>? type}) {
    return UIComponent(
        component: (component != null ? component.value : this.component),
        config: (config != null ? config.value : this.config),
        type: (type != null ? type.value : this.type));
  }
}

@JsonSerializable(explicitToJson: true)
class TileDTO {
  TileDTO({
    this.name,
    this.url,
    this.overlay,
    this.imageUrl,
  });

  factory TileDTO.fromJson(Map<String, dynamic> json) =>
      _$TileDTOFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'overlay')
  final String? overlay;
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  static const fromJsonFactory = _$TileDTOFromJson;
  static const toJsonFactory = _$TileDTOToJson;
  Map<String, dynamic> toJson() => _$TileDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TileDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.overlay, overlay) ||
                const DeepCollectionEquality()
                    .equals(other.overlay, overlay)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(overlay) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      runtimeType.hashCode;
}

extension $TileDTOExtension on TileDTO {
  TileDTO copyWith(
      {String? name, String? url, String? overlay, String? imageUrl}) {
    return TileDTO(
        name: name ?? this.name,
        url: url ?? this.url,
        overlay: overlay ?? this.overlay,
        imageUrl: imageUrl ?? this.imageUrl);
  }

  TileDTO copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<String?>? url,
      Wrapped<String?>? overlay,
      Wrapped<String?>? imageUrl}) {
    return TileDTO(
        name: (name != null ? name.value : this.name),
        url: (url != null ? url.value : this.url),
        overlay: (overlay != null ? overlay.value : this.overlay),
        imageUrl: (imageUrl != null ? imageUrl.value : this.imageUrl));
  }
}

@JsonSerializable(explicitToJson: true)
class VoiceDTO {
  VoiceDTO({
    this.id,
    this.label,
    this.locale,
  });

  factory VoiceDTO.fromJson(Map<String, dynamic> json) =>
      _$VoiceDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'locale')
  final String? locale;
  static const fromJsonFactory = _$VoiceDTOFromJson;
  static const toJsonFactory = _$VoiceDTOToJson;
  Map<String, dynamic> toJson() => _$VoiceDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VoiceDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.locale, locale) ||
                const DeepCollectionEquality().equals(other.locale, locale)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(locale) ^
      runtimeType.hashCode;
}

extension $VoiceDTOExtension on VoiceDTO {
  VoiceDTO copyWith({String? id, String? label, String? locale}) {
    return VoiceDTO(
        id: id ?? this.id,
        label: label ?? this.label,
        locale: locale ?? this.locale);
  }

  VoiceDTO copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? label,
      Wrapped<String?>? locale}) {
    return VoiceDTO(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label),
        locale: (locale != null ? locale.value : this.locale));
  }
}

@JsonSerializable(explicitToJson: true)
class HumanLanguageInterpreterDTO {
  HumanLanguageInterpreterDTO({
    this.id,
    this.label,
    this.locales,
  });

  factory HumanLanguageInterpreterDTO.fromJson(Map<String, dynamic> json) =>
      _$HumanLanguageInterpreterDTOFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'locales', defaultValue: <String>[])
  final List<String>? locales;
  static const fromJsonFactory = _$HumanLanguageInterpreterDTOFromJson;
  static const toJsonFactory = _$HumanLanguageInterpreterDTOToJson;
  Map<String, dynamic> toJson() => _$HumanLanguageInterpreterDTOToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HumanLanguageInterpreterDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.locales, locales) ||
                const DeepCollectionEquality().equals(other.locales, locales)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(locales) ^
      runtimeType.hashCode;
}

extension $HumanLanguageInterpreterDTOExtension on HumanLanguageInterpreterDTO {
  HumanLanguageInterpreterDTO copyWith(
      {String? id, String? label, List<String>? locales}) {
    return HumanLanguageInterpreterDTO(
        id: id ?? this.id,
        label: label ?? this.label,
        locales: locales ?? this.locales);
  }

  HumanLanguageInterpreterDTO copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? label,
      Wrapped<List<String>?>? locales}) {
    return HumanLanguageInterpreterDTO(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label),
        locales: (locales != null ? locales.value : this.locales));
  }
}

@JsonSerializable(explicitToJson: true)
class LoggerInfo {
  LoggerInfo({
    this.loggerName,
    this.level,
  });

  factory LoggerInfo.fromJson(Map<String, dynamic> json) =>
      _$LoggerInfoFromJson(json);

  @JsonKey(name: 'loggerName')
  final String? loggerName;
  @JsonKey(name: 'level')
  final String? level;
  static const fromJsonFactory = _$LoggerInfoFromJson;
  static const toJsonFactory = _$LoggerInfoToJson;
  Map<String, dynamic> toJson() => _$LoggerInfoToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoggerInfo &&
            (identical(other.loggerName, loggerName) ||
                const DeepCollectionEquality()
                    .equals(other.loggerName, loggerName)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(loggerName) ^
      const DeepCollectionEquality().hash(level) ^
      runtimeType.hashCode;
}

extension $LoggerInfoExtension on LoggerInfo {
  LoggerInfo copyWith({String? loggerName, String? level}) {
    return LoggerInfo(
        loggerName: loggerName ?? this.loggerName, level: level ?? this.level);
  }

  LoggerInfo copyWithWrapped(
      {Wrapped<String?>? loggerName, Wrapped<String?>? level}) {
    return LoggerInfo(
        loggerName: (loggerName != null ? loggerName.value : this.loggerName),
        level: (level != null ? level.value : this.level));
  }
}

@JsonSerializable(explicitToJson: true)
class LoggerBean {
  LoggerBean({
    this.loggers,
  });

  factory LoggerBean.fromJson(Map<String, dynamic> json) =>
      _$LoggerBeanFromJson(json);

  @JsonKey(name: 'loggers', defaultValue: <LoggerInfo>[])
  final List<LoggerInfo>? loggers;
  static const fromJsonFactory = _$LoggerBeanFromJson;
  static const toJsonFactory = _$LoggerBeanToJson;
  Map<String, dynamic> toJson() => _$LoggerBeanToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoggerBean &&
            (identical(other.loggers, loggers) ||
                const DeepCollectionEquality().equals(other.loggers, loggers)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(loggers) ^ runtimeType.hashCode;
}

extension $LoggerBeanExtension on LoggerBean {
  LoggerBean copyWith({List<LoggerInfo>? loggers}) {
    return LoggerBean(loggers: loggers ?? this.loggers);
  }

  LoggerBean copyWithWrapped({Wrapped<List<LoggerInfo>?>? loggers}) {
    return LoggerBean(
        loggers: (loggers != null ? loggers.value : this.loggers));
  }
}

@JsonSerializable(explicitToJson: true)
class IconSet {
  IconSet({
    this.id,
    this.label,
    this.description,
    this.formats,
  });

  factory IconSet.fromJson(Map<String, dynamic> json) =>
      _$IconSetFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'label')
  final String? label;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(
    name: 'formats',
    toJson: iconSetFormatsListToJson,
    fromJson: iconSetFormatsListFromJson,
  )
  final List<enums.IconSetFormats>? formats;
  static const fromJsonFactory = _$IconSetFromJson;
  static const toJsonFactory = _$IconSetToJson;
  Map<String, dynamic> toJson() => _$IconSetToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is IconSet &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.formats, formats) ||
                const DeepCollectionEquality().equals(other.formats, formats)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(formats) ^
      runtimeType.hashCode;
}

extension $IconSetExtension on IconSet {
  IconSet copyWith(
      {String? id,
      String? label,
      String? description,
      List<enums.IconSetFormats>? formats}) {
    return IconSet(
        id: id ?? this.id,
        label: label ?? this.label,
        description: description ?? this.description,
        formats: formats ?? this.formats);
  }

  IconSet copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? label,
      Wrapped<String?>? description,
      Wrapped<List<enums.IconSetFormats>?>? formats}) {
    return IconSet(
        id: (id != null ? id.value : this.id),
        label: (label != null ? label.value : this.label),
        description:
            (description != null ? description.value : this.description),
        formats: (formats != null ? formats.value : this.formats));
  }
}

@JsonSerializable(explicitToJson: true)
class Card {
  Card({
    this.config,
    this.slots,
    this.uid,
    this.title,
    this.subtitle,
    this.tags,
    this.bookmarked,
    this.notReuseableInChat,
    this.addToDeckDenied,
    this.ephemeral,
    this.timestamp,
    this.objectAttributes,
    this.locationAttributes,
    this.bookmark,
    this.name,
  });

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  @JsonKey(name: 'config')
  final Map<String, dynamic>? config;
  @JsonKey(name: 'slots')
  final Map<String, dynamic>? slots;
  @JsonKey(name: 'uid')
  final String? uid;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'subtitle')
  final String? subtitle;
  @JsonKey(name: 'tags', defaultValue: <String>[])
  final List<String>? tags;
  @JsonKey(name: 'bookmarked')
  final bool? bookmarked;
  @JsonKey(name: 'notReuseableInChat')
  final bool? notReuseableInChat;
  @JsonKey(name: 'addToDeckDenied')
  final bool? addToDeckDenied;
  @JsonKey(name: 'ephemeral')
  final bool? ephemeral;
  @JsonKey(name: 'timestamp')
  final DateTime? timestamp;
  @JsonKey(name: 'objectAttributes', defaultValue: <String>[])
  final List<String>? objectAttributes;
  @JsonKey(name: 'locationAttributes', defaultValue: <String>[])
  final List<String>? locationAttributes;
  @JsonKey(name: 'bookmark')
  final bool? bookmark;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CardFromJson;
  static const toJsonFactory = _$CardToJson;
  Map<String, dynamic> toJson() => _$CardToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Card &&
            (identical(other.config, config) ||
                const DeepCollectionEquality().equals(other.config, config)) &&
            (identical(other.slots, slots) ||
                const DeepCollectionEquality().equals(other.slots, slots)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.subtitle, subtitle) ||
                const DeepCollectionEquality()
                    .equals(other.subtitle, subtitle)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.bookmarked, bookmarked) ||
                const DeepCollectionEquality()
                    .equals(other.bookmarked, bookmarked)) &&
            (identical(other.notReuseableInChat, notReuseableInChat) ||
                const DeepCollectionEquality()
                    .equals(other.notReuseableInChat, notReuseableInChat)) &&
            (identical(other.addToDeckDenied, addToDeckDenied) ||
                const DeepCollectionEquality()
                    .equals(other.addToDeckDenied, addToDeckDenied)) &&
            (identical(other.ephemeral, ephemeral) ||
                const DeepCollectionEquality()
                    .equals(other.ephemeral, ephemeral)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.objectAttributes, objectAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.objectAttributes, objectAttributes)) &&
            (identical(other.locationAttributes, locationAttributes) ||
                const DeepCollectionEquality()
                    .equals(other.locationAttributes, locationAttributes)) &&
            (identical(other.bookmark, bookmark) ||
                const DeepCollectionEquality()
                    .equals(other.bookmark, bookmark)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(config) ^
      const DeepCollectionEquality().hash(slots) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(subtitle) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(bookmarked) ^
      const DeepCollectionEquality().hash(notReuseableInChat) ^
      const DeepCollectionEquality().hash(addToDeckDenied) ^
      const DeepCollectionEquality().hash(ephemeral) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(objectAttributes) ^
      const DeepCollectionEquality().hash(locationAttributes) ^
      const DeepCollectionEquality().hash(bookmark) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $CardExtension on Card {
  Card copyWith(
      {Map<String, dynamic>? config,
      Map<String, dynamic>? slots,
      String? uid,
      String? title,
      String? subtitle,
      List<String>? tags,
      bool? bookmarked,
      bool? notReuseableInChat,
      bool? addToDeckDenied,
      bool? ephemeral,
      DateTime? timestamp,
      List<String>? objectAttributes,
      List<String>? locationAttributes,
      bool? bookmark,
      String? name}) {
    return Card(
        config: config ?? this.config,
        slots: slots ?? this.slots,
        uid: uid ?? this.uid,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        tags: tags ?? this.tags,
        bookmarked: bookmarked ?? this.bookmarked,
        notReuseableInChat: notReuseableInChat ?? this.notReuseableInChat,
        addToDeckDenied: addToDeckDenied ?? this.addToDeckDenied,
        ephemeral: ephemeral ?? this.ephemeral,
        timestamp: timestamp ?? this.timestamp,
        objectAttributes: objectAttributes ?? this.objectAttributes,
        locationAttributes: locationAttributes ?? this.locationAttributes,
        bookmark: bookmark ?? this.bookmark,
        name: name ?? this.name);
  }

  Card copyWithWrapped(
      {Wrapped<Map<String, dynamic>?>? config,
      Wrapped<Map<String, dynamic>?>? slots,
      Wrapped<String?>? uid,
      Wrapped<String?>? title,
      Wrapped<String?>? subtitle,
      Wrapped<List<String>?>? tags,
      Wrapped<bool?>? bookmarked,
      Wrapped<bool?>? notReuseableInChat,
      Wrapped<bool?>? addToDeckDenied,
      Wrapped<bool?>? ephemeral,
      Wrapped<DateTime?>? timestamp,
      Wrapped<List<String>?>? objectAttributes,
      Wrapped<List<String>?>? locationAttributes,
      Wrapped<bool?>? bookmark,
      Wrapped<String?>? name}) {
    return Card(
        config: (config != null ? config.value : this.config),
        slots: (slots != null ? slots.value : this.slots),
        uid: (uid != null ? uid.value : this.uid),
        title: (title != null ? title.value : this.title),
        subtitle: (subtitle != null ? subtitle.value : this.subtitle),
        tags: (tags != null ? tags.value : this.tags),
        bookmarked: (bookmarked != null ? bookmarked.value : this.bookmarked),
        notReuseableInChat: (notReuseableInChat != null
            ? notReuseableInChat.value
            : this.notReuseableInChat),
        addToDeckDenied: (addToDeckDenied != null
            ? addToDeckDenied.value
            : this.addToDeckDenied),
        ephemeral: (ephemeral != null ? ephemeral.value : this.ephemeral),
        timestamp: (timestamp != null ? timestamp.value : this.timestamp),
        objectAttributes: (objectAttributes != null
            ? objectAttributes.value
            : this.objectAttributes),
        locationAttributes: (locationAttributes != null
            ? locationAttributes.value
            : this.locationAttributes),
        bookmark: (bookmark != null ? bookmark.value : this.bookmark),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class ChatReply {
  ChatReply({
    this.language,
    this.query,
    this.answer,
    this.hint,
    this.intent,
    this.matchedItemNames,
    this.card,
    this.matchedItems,
  });

  factory ChatReply.fromJson(Map<String, dynamic> json) =>
      _$ChatReplyFromJson(json);

  @JsonKey(name: 'language')
  final String? language;
  @JsonKey(name: 'query')
  final String? query;
  @JsonKey(name: 'answer')
  final String? answer;
  @JsonKey(name: 'hint')
  final String? hint;
  @JsonKey(name: 'intent')
  final Intent? intent;
  @JsonKey(name: 'matchedItemNames', defaultValue: <String>[])
  final List<String>? matchedItemNames;
  @JsonKey(name: 'card')
  final Card? card;
  @JsonKey(name: 'matchedItems', defaultValue: <String>[])
  final List<String>? matchedItems;
  static const fromJsonFactory = _$ChatReplyFromJson;
  static const toJsonFactory = _$ChatReplyToJson;
  Map<String, dynamic> toJson() => _$ChatReplyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatReply &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.hint, hint) ||
                const DeepCollectionEquality().equals(other.hint, hint)) &&
            (identical(other.intent, intent) ||
                const DeepCollectionEquality().equals(other.intent, intent)) &&
            (identical(other.matchedItemNames, matchedItemNames) ||
                const DeepCollectionEquality()
                    .equals(other.matchedItemNames, matchedItemNames)) &&
            (identical(other.card, card) ||
                const DeepCollectionEquality().equals(other.card, card)) &&
            (identical(other.matchedItems, matchedItems) ||
                const DeepCollectionEquality()
                    .equals(other.matchedItems, matchedItems)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(query) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(hint) ^
      const DeepCollectionEquality().hash(intent) ^
      const DeepCollectionEquality().hash(matchedItemNames) ^
      const DeepCollectionEquality().hash(card) ^
      const DeepCollectionEquality().hash(matchedItems) ^
      runtimeType.hashCode;
}

extension $ChatReplyExtension on ChatReply {
  ChatReply copyWith(
      {String? language,
      String? query,
      String? answer,
      String? hint,
      Intent? intent,
      List<String>? matchedItemNames,
      Card? card,
      List<String>? matchedItems}) {
    return ChatReply(
        language: language ?? this.language,
        query: query ?? this.query,
        answer: answer ?? this.answer,
        hint: hint ?? this.hint,
        intent: intent ?? this.intent,
        matchedItemNames: matchedItemNames ?? this.matchedItemNames,
        card: card ?? this.card,
        matchedItems: matchedItems ?? this.matchedItems);
  }

  ChatReply copyWithWrapped(
      {Wrapped<String?>? language,
      Wrapped<String?>? query,
      Wrapped<String?>? answer,
      Wrapped<String?>? hint,
      Wrapped<Intent?>? intent,
      Wrapped<List<String>?>? matchedItemNames,
      Wrapped<Card?>? card,
      Wrapped<List<String>?>? matchedItems}) {
    return ChatReply(
        language: (language != null ? language.value : this.language),
        query: (query != null ? query.value : this.query),
        answer: (answer != null ? answer.value : this.answer),
        hint: (hint != null ? hint.value : this.hint),
        intent: (intent != null ? intent.value : this.intent),
        matchedItemNames: (matchedItemNames != null
            ? matchedItemNames.value
            : this.matchedItemNames),
        card: (card != null ? card.value : this.card),
        matchedItems:
            (matchedItems != null ? matchedItems.value : this.matchedItems));
  }
}

@JsonSerializable(explicitToJson: true)
class Component {
  Component({
    this.config,
    this.name,
  });

  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);

  @JsonKey(name: 'config')
  final Map<String, dynamic>? config;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$ComponentFromJson;
  static const toJsonFactory = _$ComponentToJson;
  Map<String, dynamic> toJson() => _$ComponentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Component &&
            (identical(other.config, config) ||
                const DeepCollectionEquality().equals(other.config, config)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(config) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $ComponentExtension on Component {
  Component copyWith({Map<String, dynamic>? config, String? name}) {
    return Component(config: config ?? this.config, name: name ?? this.name);
  }

  Component copyWithWrapped(
      {Wrapped<Map<String, dynamic>?>? config, Wrapped<String?>? name}) {
    return Component(
        config: (config != null ? config.value : this.config),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class Intent {
  Intent({
    this.name,
    this.entities,
  });

  factory Intent.fromJson(Map<String, dynamic> json) => _$IntentFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'entities')
  final Map<String, dynamic>? entities;
  static const fromJsonFactory = _$IntentFromJson;
  static const toJsonFactory = _$IntentToJson;
  Map<String, dynamic> toJson() => _$IntentToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Intent &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.entities, entities) ||
                const DeepCollectionEquality()
                    .equals(other.entities, entities)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(entities) ^
      runtimeType.hashCode;
}

extension $IntentExtension on Intent {
  Intent copyWith({String? name, Map<String, dynamic>? entities}) {
    return Intent(name: name ?? this.name, entities: entities ?? this.entities);
  }

  Intent copyWithWrapped(
      {Wrapped<String?>? name, Wrapped<Map<String, dynamic>?>? entities}) {
    return Intent(
        name: (name != null ? name.value : this.name),
        entities: (entities != null ? entities.value : this.entities));
  }
}

@JsonSerializable(explicitToJson: true)
class GalleryWidgetsListItem {
  GalleryWidgetsListItem({
    this.id,
    this.title,
    this.description,
    this.likes,
    this.views,
    this.posts,
    this.imageUrl,
    this.createdDate,
  });

  factory GalleryWidgetsListItem.fromJson(Map<String, dynamic> json) =>
      _$GalleryWidgetsListItemFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'likes')
  final int? likes;
  @JsonKey(name: 'views')
  final int? views;
  @JsonKey(name: 'posts')
  final int? posts;
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  static const fromJsonFactory = _$GalleryWidgetsListItemFromJson;
  static const toJsonFactory = _$GalleryWidgetsListItemToJson;
  Map<String, dynamic> toJson() => _$GalleryWidgetsListItemToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GalleryWidgetsListItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)) &&
            (identical(other.views, views) ||
                const DeepCollectionEquality().equals(other.views, views)) &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(likes) ^
      const DeepCollectionEquality().hash(views) ^
      const DeepCollectionEquality().hash(posts) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(createdDate) ^
      runtimeType.hashCode;
}

extension $GalleryWidgetsListItemExtension on GalleryWidgetsListItem {
  GalleryWidgetsListItem copyWith(
      {String? id,
      String? title,
      String? description,
      int? likes,
      int? views,
      int? posts,
      String? imageUrl,
      DateTime? createdDate}) {
    return GalleryWidgetsListItem(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        likes: likes ?? this.likes,
        views: views ?? this.views,
        posts: posts ?? this.posts,
        imageUrl: imageUrl ?? this.imageUrl,
        createdDate: createdDate ?? this.createdDate);
  }

  GalleryWidgetsListItem copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<int?>? likes,
      Wrapped<int?>? views,
      Wrapped<int?>? posts,
      Wrapped<String?>? imageUrl,
      Wrapped<DateTime?>? createdDate}) {
    return GalleryWidgetsListItem(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        likes: (likes != null ? likes.value : this.likes),
        views: (views != null ? views.value : this.views),
        posts: (posts != null ? posts.value : this.posts),
        imageUrl: (imageUrl != null ? imageUrl.value : this.imageUrl),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate));
  }
}

@JsonSerializable(explicitToJson: true)
class GalleryItem {
  GalleryItem({
    this.id,
    this.title,
    this.description,
    this.likes,
    this.views,
    this.posts,
    this.imageUrl,
    this.author,
    this.authorName,
    this.authorAvatarUrl,
    this.createdDate,
    this.updatedDate,
    this.readme,
  });

  factory GalleryItem.fromJson(Map<String, dynamic> json) =>
      _$GalleryItemFromJson(json);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'likes')
  final int? likes;
  @JsonKey(name: 'views')
  final int? views;
  @JsonKey(name: 'posts')
  final int? posts;
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @JsonKey(name: 'author')
  final String? author;
  @JsonKey(name: 'authorName')
  final String? authorName;
  @JsonKey(name: 'authorAvatarUrl')
  final String? authorAvatarUrl;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'updatedDate')
  final DateTime? updatedDate;
  @JsonKey(name: 'readme')
  final String? readme;
  static const fromJsonFactory = _$GalleryItemFromJson;
  static const toJsonFactory = _$GalleryItemToJson;
  Map<String, dynamic> toJson() => _$GalleryItemToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GalleryItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)) &&
            (identical(other.views, views) ||
                const DeepCollectionEquality().equals(other.views, views)) &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.authorName, authorName) ||
                const DeepCollectionEquality()
                    .equals(other.authorName, authorName)) &&
            (identical(other.authorAvatarUrl, authorAvatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.authorAvatarUrl, authorAvatarUrl)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.updatedDate, updatedDate) ||
                const DeepCollectionEquality()
                    .equals(other.updatedDate, updatedDate)) &&
            (identical(other.readme, readme) ||
                const DeepCollectionEquality().equals(other.readme, readme)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(likes) ^
      const DeepCollectionEquality().hash(views) ^
      const DeepCollectionEquality().hash(posts) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(authorName) ^
      const DeepCollectionEquality().hash(authorAvatarUrl) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(updatedDate) ^
      const DeepCollectionEquality().hash(readme) ^
      runtimeType.hashCode;
}

extension $GalleryItemExtension on GalleryItem {
  GalleryItem copyWith(
      {String? id,
      String? title,
      String? description,
      int? likes,
      int? views,
      int? posts,
      String? imageUrl,
      String? author,
      String? authorName,
      String? authorAvatarUrl,
      DateTime? createdDate,
      DateTime? updatedDate,
      String? readme}) {
    return GalleryItem(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        likes: likes ?? this.likes,
        views: views ?? this.views,
        posts: posts ?? this.posts,
        imageUrl: imageUrl ?? this.imageUrl,
        author: author ?? this.author,
        authorName: authorName ?? this.authorName,
        authorAvatarUrl: authorAvatarUrl ?? this.authorAvatarUrl,
        createdDate: createdDate ?? this.createdDate,
        updatedDate: updatedDate ?? this.updatedDate,
        readme: readme ?? this.readme);
  }

  GalleryItem copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<int?>? likes,
      Wrapped<int?>? views,
      Wrapped<int?>? posts,
      Wrapped<String?>? imageUrl,
      Wrapped<String?>? author,
      Wrapped<String?>? authorName,
      Wrapped<String?>? authorAvatarUrl,
      Wrapped<DateTime?>? createdDate,
      Wrapped<DateTime?>? updatedDate,
      Wrapped<String?>? readme}) {
    return GalleryItem(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        likes: (likes != null ? likes.value : this.likes),
        views: (views != null ? views.value : this.views),
        posts: (posts != null ? posts.value : this.posts),
        imageUrl: (imageUrl != null ? imageUrl.value : this.imageUrl),
        author: (author != null ? author.value : this.author),
        authorName: (authorName != null ? authorName.value : this.authorName),
        authorAvatarUrl: (authorAvatarUrl != null
            ? authorAvatarUrl.value
            : this.authorAvatarUrl),
        createdDate:
            (createdDate != null ? createdDate.value : this.createdDate),
        updatedDate:
            (updatedDate != null ? updatedDate.value : this.updatedDate),
        readme: (readme != null ? readme.value : this.readme));
  }
}

String? configDescriptionParameterDTOTypeToJson(
    enums.ConfigDescriptionParameterDTOType?
        configDescriptionParameterDTOType) {
  return configDescriptionParameterDTOType?.value;
}

enums.ConfigDescriptionParameterDTOType
    configDescriptionParameterDTOTypeFromJson(
  Object? configDescriptionParameterDTOType, [
  enums.ConfigDescriptionParameterDTOType? defaultValue,
]) {
  return enums.ConfigDescriptionParameterDTOType.values.firstWhereOrNull(
          (e) => e.value == configDescriptionParameterDTOType) ??
      defaultValue ??
      enums.ConfigDescriptionParameterDTOType.swaggerGeneratedUnknown;
}

List<String> configDescriptionParameterDTOTypeListToJson(
    List<enums.ConfigDescriptionParameterDTOType>?
        configDescriptionParameterDTOType) {
  if (configDescriptionParameterDTOType == null) {
    return [];
  }

  return configDescriptionParameterDTOType.map((e) => e.value!).toList();
}

List<enums.ConfigDescriptionParameterDTOType>
    configDescriptionParameterDTOTypeListFromJson(
  List? configDescriptionParameterDTOType, [
  List<enums.ConfigDescriptionParameterDTOType>? defaultValue,
]) {
  if (configDescriptionParameterDTOType == null) {
    return defaultValue ?? [];
  }

  return configDescriptionParameterDTOType
      .map((e) => configDescriptionParameterDTOTypeFromJson(e.toString()))
      .toList();
}

List<enums.ConfigDescriptionParameterDTOType>?
    configDescriptionParameterDTOTypeNullableListFromJson(
  List? configDescriptionParameterDTOType, [
  List<enums.ConfigDescriptionParameterDTOType>? defaultValue,
]) {
  if (configDescriptionParameterDTOType == null) {
    return defaultValue;
  }

  return configDescriptionParameterDTOType
      .map((e) => configDescriptionParameterDTOTypeFromJson(e.toString()))
      .toList();
}

String? moduleTypeDTOVisibilityToJson(
    enums.ModuleTypeDTOVisibility? moduleTypeDTOVisibility) {
  return moduleTypeDTOVisibility?.value;
}

enums.ModuleTypeDTOVisibility moduleTypeDTOVisibilityFromJson(
  Object? moduleTypeDTOVisibility, [
  enums.ModuleTypeDTOVisibility? defaultValue,
]) {
  return enums.ModuleTypeDTOVisibility.values
          .firstWhereOrNull((e) => e.value == moduleTypeDTOVisibility) ??
      defaultValue ??
      enums.ModuleTypeDTOVisibility.swaggerGeneratedUnknown;
}

List<String> moduleTypeDTOVisibilityListToJson(
    List<enums.ModuleTypeDTOVisibility>? moduleTypeDTOVisibility) {
  if (moduleTypeDTOVisibility == null) {
    return [];
  }

  return moduleTypeDTOVisibility.map((e) => e.value!).toList();
}

List<enums.ModuleTypeDTOVisibility> moduleTypeDTOVisibilityListFromJson(
  List? moduleTypeDTOVisibility, [
  List<enums.ModuleTypeDTOVisibility>? defaultValue,
]) {
  if (moduleTypeDTOVisibility == null) {
    return defaultValue ?? [];
  }

  return moduleTypeDTOVisibility
      .map((e) => moduleTypeDTOVisibilityFromJson(e.toString()))
      .toList();
}

List<enums.ModuleTypeDTOVisibility>?
    moduleTypeDTOVisibilityNullableListFromJson(
  List? moduleTypeDTOVisibility, [
  List<enums.ModuleTypeDTOVisibility>? defaultValue,
]) {
  if (moduleTypeDTOVisibility == null) {
    return defaultValue;
  }

  return moduleTypeDTOVisibility
      .map((e) => moduleTypeDTOVisibilityFromJson(e.toString()))
      .toList();
}

String? ruleDTOVisibilityToJson(enums.RuleDTOVisibility? ruleDTOVisibility) {
  return ruleDTOVisibility?.value;
}

enums.RuleDTOVisibility ruleDTOVisibilityFromJson(
  Object? ruleDTOVisibility, [
  enums.RuleDTOVisibility? defaultValue,
]) {
  return enums.RuleDTOVisibility.values
          .firstWhereOrNull((e) => e.value == ruleDTOVisibility) ??
      defaultValue ??
      enums.RuleDTOVisibility.swaggerGeneratedUnknown;
}

List<String> ruleDTOVisibilityListToJson(
    List<enums.RuleDTOVisibility>? ruleDTOVisibility) {
  if (ruleDTOVisibility == null) {
    return [];
  }

  return ruleDTOVisibility.map((e) => e.value!).toList();
}

List<enums.RuleDTOVisibility> ruleDTOVisibilityListFromJson(
  List? ruleDTOVisibility, [
  List<enums.RuleDTOVisibility>? defaultValue,
]) {
  if (ruleDTOVisibility == null) {
    return defaultValue ?? [];
  }

  return ruleDTOVisibility
      .map((e) => ruleDTOVisibilityFromJson(e.toString()))
      .toList();
}

List<enums.RuleDTOVisibility>? ruleDTOVisibilityNullableListFromJson(
  List? ruleDTOVisibility, [
  List<enums.RuleDTOVisibility>? defaultValue,
]) {
  if (ruleDTOVisibility == null) {
    return defaultValue;
  }

  return ruleDTOVisibility
      .map((e) => ruleDTOVisibilityFromJson(e.toString()))
      .toList();
}

String? enrichedRuleDTOVisibilityToJson(
    enums.EnrichedRuleDTOVisibility? enrichedRuleDTOVisibility) {
  return enrichedRuleDTOVisibility?.value;
}

enums.EnrichedRuleDTOVisibility enrichedRuleDTOVisibilityFromJson(
  Object? enrichedRuleDTOVisibility, [
  enums.EnrichedRuleDTOVisibility? defaultValue,
]) {
  return enums.EnrichedRuleDTOVisibility.values
          .firstWhereOrNull((e) => e.value == enrichedRuleDTOVisibility) ??
      defaultValue ??
      enums.EnrichedRuleDTOVisibility.swaggerGeneratedUnknown;
}

List<String> enrichedRuleDTOVisibilityListToJson(
    List<enums.EnrichedRuleDTOVisibility>? enrichedRuleDTOVisibility) {
  if (enrichedRuleDTOVisibility == null) {
    return [];
  }

  return enrichedRuleDTOVisibility.map((e) => e.value!).toList();
}

List<enums.EnrichedRuleDTOVisibility> enrichedRuleDTOVisibilityListFromJson(
  List? enrichedRuleDTOVisibility, [
  List<enums.EnrichedRuleDTOVisibility>? defaultValue,
]) {
  if (enrichedRuleDTOVisibility == null) {
    return defaultValue ?? [];
  }

  return enrichedRuleDTOVisibility
      .map((e) => enrichedRuleDTOVisibilityFromJson(e.toString()))
      .toList();
}

List<enums.EnrichedRuleDTOVisibility>?
    enrichedRuleDTOVisibilityNullableListFromJson(
  List? enrichedRuleDTOVisibility, [
  List<enums.EnrichedRuleDTOVisibility>? defaultValue,
]) {
  if (enrichedRuleDTOVisibility == null) {
    return defaultValue;
  }

  return enrichedRuleDTOVisibility
      .map((e) => enrichedRuleDTOVisibilityFromJson(e.toString()))
      .toList();
}

String? ruleStatusInfoStatusToJson(
    enums.RuleStatusInfoStatus? ruleStatusInfoStatus) {
  return ruleStatusInfoStatus?.value;
}

enums.RuleStatusInfoStatus ruleStatusInfoStatusFromJson(
  Object? ruleStatusInfoStatus, [
  enums.RuleStatusInfoStatus? defaultValue,
]) {
  return enums.RuleStatusInfoStatus.values
          .firstWhereOrNull((e) => e.value == ruleStatusInfoStatus) ??
      defaultValue ??
      enums.RuleStatusInfoStatus.swaggerGeneratedUnknown;
}

List<String> ruleStatusInfoStatusListToJson(
    List<enums.RuleStatusInfoStatus>? ruleStatusInfoStatus) {
  if (ruleStatusInfoStatus == null) {
    return [];
  }

  return ruleStatusInfoStatus.map((e) => e.value!).toList();
}

List<enums.RuleStatusInfoStatus> ruleStatusInfoStatusListFromJson(
  List? ruleStatusInfoStatus, [
  List<enums.RuleStatusInfoStatus>? defaultValue,
]) {
  if (ruleStatusInfoStatus == null) {
    return defaultValue ?? [];
  }

  return ruleStatusInfoStatus
      .map((e) => ruleStatusInfoStatusFromJson(e.toString()))
      .toList();
}

List<enums.RuleStatusInfoStatus>? ruleStatusInfoStatusNullableListFromJson(
  List? ruleStatusInfoStatus, [
  List<enums.RuleStatusInfoStatus>? defaultValue,
]) {
  if (ruleStatusInfoStatus == null) {
    return defaultValue;
  }

  return ruleStatusInfoStatus
      .map((e) => ruleStatusInfoStatusFromJson(e.toString()))
      .toList();
}

String? ruleStatusInfoStatusDetailToJson(
    enums.RuleStatusInfoStatusDetail? ruleStatusInfoStatusDetail) {
  return ruleStatusInfoStatusDetail?.value;
}

enums.RuleStatusInfoStatusDetail ruleStatusInfoStatusDetailFromJson(
  Object? ruleStatusInfoStatusDetail, [
  enums.RuleStatusInfoStatusDetail? defaultValue,
]) {
  return enums.RuleStatusInfoStatusDetail.values
          .firstWhereOrNull((e) => e.value == ruleStatusInfoStatusDetail) ??
      defaultValue ??
      enums.RuleStatusInfoStatusDetail.swaggerGeneratedUnknown;
}

List<String> ruleStatusInfoStatusDetailListToJson(
    List<enums.RuleStatusInfoStatusDetail>? ruleStatusInfoStatusDetail) {
  if (ruleStatusInfoStatusDetail == null) {
    return [];
  }

  return ruleStatusInfoStatusDetail.map((e) => e.value!).toList();
}

List<enums.RuleStatusInfoStatusDetail> ruleStatusInfoStatusDetailListFromJson(
  List? ruleStatusInfoStatusDetail, [
  List<enums.RuleStatusInfoStatusDetail>? defaultValue,
]) {
  if (ruleStatusInfoStatusDetail == null) {
    return defaultValue ?? [];
  }

  return ruleStatusInfoStatusDetail
      .map((e) => ruleStatusInfoStatusDetailFromJson(e.toString()))
      .toList();
}

List<enums.RuleStatusInfoStatusDetail>?
    ruleStatusInfoStatusDetailNullableListFromJson(
  List? ruleStatusInfoStatusDetail, [
  List<enums.RuleStatusInfoStatusDetail>? defaultValue,
]) {
  if (ruleStatusInfoStatusDetail == null) {
    return defaultValue;
  }

  return ruleStatusInfoStatusDetail
      .map((e) => ruleStatusInfoStatusDetailFromJson(e.toString()))
      .toList();
}

String? configDescriptionParameterTypeToJson(
    enums.ConfigDescriptionParameterType? configDescriptionParameterType) {
  return configDescriptionParameterType?.value;
}

enums.ConfigDescriptionParameterType configDescriptionParameterTypeFromJson(
  Object? configDescriptionParameterType, [
  enums.ConfigDescriptionParameterType? defaultValue,
]) {
  return enums.ConfigDescriptionParameterType.values
          .firstWhereOrNull((e) => e.value == configDescriptionParameterType) ??
      defaultValue ??
      enums.ConfigDescriptionParameterType.swaggerGeneratedUnknown;
}

List<String> configDescriptionParameterTypeListToJson(
    List<enums.ConfigDescriptionParameterType>?
        configDescriptionParameterType) {
  if (configDescriptionParameterType == null) {
    return [];
  }

  return configDescriptionParameterType.map((e) => e.value!).toList();
}

List<enums.ConfigDescriptionParameterType>
    configDescriptionParameterTypeListFromJson(
  List? configDescriptionParameterType, [
  List<enums.ConfigDescriptionParameterType>? defaultValue,
]) {
  if (configDescriptionParameterType == null) {
    return defaultValue ?? [];
  }

  return configDescriptionParameterType
      .map((e) => configDescriptionParameterTypeFromJson(e.toString()))
      .toList();
}

List<enums.ConfigDescriptionParameterType>?
    configDescriptionParameterTypeNullableListFromJson(
  List? configDescriptionParameterType, [
  List<enums.ConfigDescriptionParameterType>? defaultValue,
]) {
  if (configDescriptionParameterType == null) {
    return defaultValue;
  }

  return configDescriptionParameterType
      .map((e) => configDescriptionParameterTypeFromJson(e.toString()))
      .toList();
}

String? ruleVisibilityToJson(enums.RuleVisibility? ruleVisibility) {
  return ruleVisibility?.value;
}

enums.RuleVisibility ruleVisibilityFromJson(
  Object? ruleVisibility, [
  enums.RuleVisibility? defaultValue,
]) {
  return enums.RuleVisibility.values
          .firstWhereOrNull((e) => e.value == ruleVisibility) ??
      defaultValue ??
      enums.RuleVisibility.swaggerGeneratedUnknown;
}

List<String> ruleVisibilityListToJson(
    List<enums.RuleVisibility>? ruleVisibility) {
  if (ruleVisibility == null) {
    return [];
  }

  return ruleVisibility.map((e) => e.value!).toList();
}

List<enums.RuleVisibility> ruleVisibilityListFromJson(
  List? ruleVisibility, [
  List<enums.RuleVisibility>? defaultValue,
]) {
  if (ruleVisibility == null) {
    return defaultValue ?? [];
  }

  return ruleVisibility
      .map((e) => ruleVisibilityFromJson(e.toString()))
      .toList();
}

List<enums.RuleVisibility>? ruleVisibilityNullableListFromJson(
  List? ruleVisibility, [
  List<enums.RuleVisibility>? defaultValue,
]) {
  if (ruleVisibility == null) {
    return defaultValue;
  }

  return ruleVisibility
      .map((e) => ruleVisibilityFromJson(e.toString()))
      .toList();
}

String? templateVisibilityToJson(enums.TemplateVisibility? templateVisibility) {
  return templateVisibility?.value;
}

enums.TemplateVisibility templateVisibilityFromJson(
  Object? templateVisibility, [
  enums.TemplateVisibility? defaultValue,
]) {
  return enums.TemplateVisibility.values
          .firstWhereOrNull((e) => e.value == templateVisibility) ??
      defaultValue ??
      enums.TemplateVisibility.swaggerGeneratedUnknown;
}

List<String> templateVisibilityListToJson(
    List<enums.TemplateVisibility>? templateVisibility) {
  if (templateVisibility == null) {
    return [];
  }

  return templateVisibility.map((e) => e.value!).toList();
}

List<enums.TemplateVisibility> templateVisibilityListFromJson(
  List? templateVisibility, [
  List<enums.TemplateVisibility>? defaultValue,
]) {
  if (templateVisibility == null) {
    return defaultValue ?? [];
  }

  return templateVisibility
      .map((e) => templateVisibilityFromJson(e.toString()))
      .toList();
}

List<enums.TemplateVisibility>? templateVisibilityNullableListFromJson(
  List? templateVisibility, [
  List<enums.TemplateVisibility>? defaultValue,
]) {
  if (templateVisibility == null) {
    return defaultValue;
  }

  return templateVisibility
      .map((e) => templateVisibilityFromJson(e.toString()))
      .toList();
}

String? discoveryResultDTOFlagToJson(
    enums.DiscoveryResultDTOFlag? discoveryResultDTOFlag) {
  return discoveryResultDTOFlag?.value;
}

enums.DiscoveryResultDTOFlag discoveryResultDTOFlagFromJson(
  Object? discoveryResultDTOFlag, [
  enums.DiscoveryResultDTOFlag? defaultValue,
]) {
  return enums.DiscoveryResultDTOFlag.values
          .firstWhereOrNull((e) => e.value == discoveryResultDTOFlag) ??
      defaultValue ??
      enums.DiscoveryResultDTOFlag.swaggerGeneratedUnknown;
}

List<String> discoveryResultDTOFlagListToJson(
    List<enums.DiscoveryResultDTOFlag>? discoveryResultDTOFlag) {
  if (discoveryResultDTOFlag == null) {
    return [];
  }

  return discoveryResultDTOFlag.map((e) => e.value!).toList();
}

List<enums.DiscoveryResultDTOFlag> discoveryResultDTOFlagListFromJson(
  List? discoveryResultDTOFlag, [
  List<enums.DiscoveryResultDTOFlag>? defaultValue,
]) {
  if (discoveryResultDTOFlag == null) {
    return defaultValue ?? [];
  }

  return discoveryResultDTOFlag
      .map((e) => discoveryResultDTOFlagFromJson(e.toString()))
      .toList();
}

List<enums.DiscoveryResultDTOFlag>? discoveryResultDTOFlagNullableListFromJson(
  List? discoveryResultDTOFlag, [
  List<enums.DiscoveryResultDTOFlag>? defaultValue,
]) {
  if (discoveryResultDTOFlag == null) {
    return defaultValue;
  }

  return discoveryResultDTOFlag
      .map((e) => discoveryResultDTOFlagFromJson(e.toString()))
      .toList();
}

String? thingStatusInfoStatusToJson(
    enums.ThingStatusInfoStatus? thingStatusInfoStatus) {
  return thingStatusInfoStatus?.value;
}

enums.ThingStatusInfoStatus thingStatusInfoStatusFromJson(
  Object? thingStatusInfoStatus, [
  enums.ThingStatusInfoStatus? defaultValue,
]) {
  return enums.ThingStatusInfoStatus.values
          .firstWhereOrNull((e) => e.value == thingStatusInfoStatus) ??
      defaultValue ??
      enums.ThingStatusInfoStatus.swaggerGeneratedUnknown;
}

List<String> thingStatusInfoStatusListToJson(
    List<enums.ThingStatusInfoStatus>? thingStatusInfoStatus) {
  if (thingStatusInfoStatus == null) {
    return [];
  }

  return thingStatusInfoStatus.map((e) => e.value!).toList();
}

List<enums.ThingStatusInfoStatus> thingStatusInfoStatusListFromJson(
  List? thingStatusInfoStatus, [
  List<enums.ThingStatusInfoStatus>? defaultValue,
]) {
  if (thingStatusInfoStatus == null) {
    return defaultValue ?? [];
  }

  return thingStatusInfoStatus
      .map((e) => thingStatusInfoStatusFromJson(e.toString()))
      .toList();
}

List<enums.ThingStatusInfoStatus>? thingStatusInfoStatusNullableListFromJson(
  List? thingStatusInfoStatus, [
  List<enums.ThingStatusInfoStatus>? defaultValue,
]) {
  if (thingStatusInfoStatus == null) {
    return defaultValue;
  }

  return thingStatusInfoStatus
      .map((e) => thingStatusInfoStatusFromJson(e.toString()))
      .toList();
}

String? thingStatusInfoStatusDetailToJson(
    enums.ThingStatusInfoStatusDetail? thingStatusInfoStatusDetail) {
  return thingStatusInfoStatusDetail?.value;
}

enums.ThingStatusInfoStatusDetail thingStatusInfoStatusDetailFromJson(
  Object? thingStatusInfoStatusDetail, [
  enums.ThingStatusInfoStatusDetail? defaultValue,
]) {
  return enums.ThingStatusInfoStatusDetail.values
          .firstWhereOrNull((e) => e.value == thingStatusInfoStatusDetail) ??
      defaultValue ??
      enums.ThingStatusInfoStatusDetail.swaggerGeneratedUnknown;
}

List<String> thingStatusInfoStatusDetailListToJson(
    List<enums.ThingStatusInfoStatusDetail>? thingStatusInfoStatusDetail) {
  if (thingStatusInfoStatusDetail == null) {
    return [];
  }

  return thingStatusInfoStatusDetail.map((e) => e.value!).toList();
}

List<enums.ThingStatusInfoStatusDetail> thingStatusInfoStatusDetailListFromJson(
  List? thingStatusInfoStatusDetail, [
  List<enums.ThingStatusInfoStatusDetail>? defaultValue,
]) {
  if (thingStatusInfoStatusDetail == null) {
    return defaultValue ?? [];
  }

  return thingStatusInfoStatusDetail
      .map((e) => thingStatusInfoStatusDetailFromJson(e.toString()))
      .toList();
}

List<enums.ThingStatusInfoStatusDetail>?
    thingStatusInfoStatusDetailNullableListFromJson(
  List? thingStatusInfoStatusDetail, [
  List<enums.ThingStatusInfoStatusDetail>? defaultValue,
]) {
  if (thingStatusInfoStatusDetail == null) {
    return defaultValue;
  }

  return thingStatusInfoStatusDetail
      .map((e) => thingStatusInfoStatusDetailFromJson(e.toString()))
      .toList();
}

String? configStatusMessageTypeToJson(
    enums.ConfigStatusMessageType? configStatusMessageType) {
  return configStatusMessageType?.value;
}

enums.ConfigStatusMessageType configStatusMessageTypeFromJson(
  Object? configStatusMessageType, [
  enums.ConfigStatusMessageType? defaultValue,
]) {
  return enums.ConfigStatusMessageType.values
          .firstWhereOrNull((e) => e.value == configStatusMessageType) ??
      defaultValue ??
      enums.ConfigStatusMessageType.swaggerGeneratedUnknown;
}

List<String> configStatusMessageTypeListToJson(
    List<enums.ConfigStatusMessageType>? configStatusMessageType) {
  if (configStatusMessageType == null) {
    return [];
  }

  return configStatusMessageType.map((e) => e.value!).toList();
}

List<enums.ConfigStatusMessageType> configStatusMessageTypeListFromJson(
  List? configStatusMessageType, [
  List<enums.ConfigStatusMessageType>? defaultValue,
]) {
  if (configStatusMessageType == null) {
    return defaultValue ?? [];
  }

  return configStatusMessageType
      .map((e) => configStatusMessageTypeFromJson(e.toString()))
      .toList();
}

List<enums.ConfigStatusMessageType>?
    configStatusMessageTypeNullableListFromJson(
  List? configStatusMessageType, [
  List<enums.ConfigStatusMessageType>? defaultValue,
]) {
  if (configStatusMessageType == null) {
    return defaultValue;
  }

  return configStatusMessageType
      .map((e) => configStatusMessageTypeFromJson(e.toString()))
      .toList();
}

String? iconSetFormatsToJson(enums.IconSetFormats? iconSetFormats) {
  return iconSetFormats?.value;
}

enums.IconSetFormats iconSetFormatsFromJson(
  Object? iconSetFormats, [
  enums.IconSetFormats? defaultValue,
]) {
  return enums.IconSetFormats.values
          .firstWhereOrNull((e) => e.value == iconSetFormats) ??
      defaultValue ??
      enums.IconSetFormats.swaggerGeneratedUnknown;
}

List<String> iconSetFormatsListToJson(
    List<enums.IconSetFormats>? iconSetFormats) {
  if (iconSetFormats == null) {
    return [];
  }

  return iconSetFormats.map((e) => e.value!).toList();
}

List<enums.IconSetFormats> iconSetFormatsListFromJson(
  List? iconSetFormats, [
  List<enums.IconSetFormats>? defaultValue,
]) {
  if (iconSetFormats == null) {
    return defaultValue ?? [];
  }

  return iconSetFormats
      .map((e) => iconSetFormatsFromJson(e.toString()))
      .toList();
}

List<enums.IconSetFormats>? iconSetFormatsNullableListFromJson(
  List? iconSetFormats, [
  List<enums.IconSetFormats>? defaultValue,
]) {
  if (iconSetFormats == null) {
    return defaultValue;
  }

  return iconSetFormats
      .map((e) => iconSetFormatsFromJson(e.toString()))
      .toList();
}

@JsonSerializable(explicitToJson: true)
class AuthLogoutPost$RequestBody {
  AuthLogoutPost$RequestBody({
    this.refreshToken,
    this.id,
  });

  factory AuthLogoutPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$AuthLogoutPost$RequestBodyFromJson(json);

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @JsonKey(name: 'id')
  final String? id;
  static const fromJsonFactory = _$AuthLogoutPost$RequestBodyFromJson;
  static const toJsonFactory = _$AuthLogoutPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$AuthLogoutPost$RequestBodyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthLogoutPost$RequestBody &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $AuthLogoutPost$RequestBodyExtension on AuthLogoutPost$RequestBody {
  AuthLogoutPost$RequestBody copyWith({String? refreshToken, String? id}) {
    return AuthLogoutPost$RequestBody(
        refreshToken: refreshToken ?? this.refreshToken, id: id ?? this.id);
  }

  AuthLogoutPost$RequestBody copyWithWrapped(
      {Wrapped<String?>? refreshToken, Wrapped<String?>? id}) {
    return AuthLogoutPost$RequestBody(
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class AuthTokenPost$RequestBody {
  AuthTokenPost$RequestBody({
    this.grantType,
    this.code,
    this.redirectUri,
    this.clientId,
    this.refreshToken,
    this.codeVerifier,
  });

  factory AuthTokenPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenPost$RequestBodyFromJson(json);

  @JsonKey(name: 'grant_type')
  final String? grantType;
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'redirect_uri')
  final String? redirectUri;
  @JsonKey(name: 'client_id')
  final String? clientId;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @JsonKey(name: 'code_verifier')
  final String? codeVerifier;
  static const fromJsonFactory = _$AuthTokenPost$RequestBodyFromJson;
  static const toJsonFactory = _$AuthTokenPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$AuthTokenPost$RequestBodyToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthTokenPost$RequestBody &&
            (identical(other.grantType, grantType) ||
                const DeepCollectionEquality()
                    .equals(other.grantType, grantType)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.redirectUri, redirectUri) ||
                const DeepCollectionEquality()
                    .equals(other.redirectUri, redirectUri)) &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.codeVerifier, codeVerifier) ||
                const DeepCollectionEquality()
                    .equals(other.codeVerifier, codeVerifier)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(grantType) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(redirectUri) ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(codeVerifier) ^
      runtimeType.hashCode;
}

extension $AuthTokenPost$RequestBodyExtension on AuthTokenPost$RequestBody {
  AuthTokenPost$RequestBody copyWith(
      {String? grantType,
      String? code,
      String? redirectUri,
      String? clientId,
      String? refreshToken,
      String? codeVerifier}) {
    return AuthTokenPost$RequestBody(
        grantType: grantType ?? this.grantType,
        code: code ?? this.code,
        redirectUri: redirectUri ?? this.redirectUri,
        clientId: clientId ?? this.clientId,
        refreshToken: refreshToken ?? this.refreshToken,
        codeVerifier: codeVerifier ?? this.codeVerifier);
  }

  AuthTokenPost$RequestBody copyWithWrapped(
      {Wrapped<String?>? grantType,
      Wrapped<String?>? code,
      Wrapped<String?>? redirectUri,
      Wrapped<String?>? clientId,
      Wrapped<String?>? refreshToken,
      Wrapped<String?>? codeVerifier}) {
    return AuthTokenPost$RequestBody(
        grantType: (grantType != null ? grantType.value : this.grantType),
        code: (code != null ? code.value : this.code),
        redirectUri:
            (redirectUri != null ? redirectUri.value : this.redirectUri),
        clientId: (clientId != null ? clientId.value : this.clientId),
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken),
        codeVerifier:
            (codeVerifier != null ? codeVerifier.value : this.codeVerifier));
  }
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
