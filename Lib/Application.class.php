<?php
namespace Lib;

abstract class Application
{
	protected $httpRequest,
			  $httpResponse,
			  $name;

	public function __construct()
	{
		$this->httpRequest = new HTTPRequest;
		$this->httpResponse = new HTTPResponse;
		$this->name = '';
	}

	abstract public function run();

	public function httpRequest()
	{
		return $this->httpRequest;
	}

	public function httpResponse()
	{
		return $this->httpResponse;
	}

	public function name()
	{
		return $this->name;
	}
}