import React from 'react'

const OurPlansSection = () => {
  return (
    <section id='pricing' className='bg-white py-20 dark:bg-neutral-900'>
      <div className='container mx-auto px-4'>
        <div className='mx-auto mb-16 max-w-3xl text-center'>
          <span className='inline-block rounded-full bg-indigo-100 px-3 py-1 text-sm font-semibold text-indigo-800 dark:bg-indigo-900/30 dark:text-indigo-300'>
            Pricing Plans
          </span>
          <h2 className='animate__animated animate__fadeIn mt-4 text-3xl font-bold leading-tight text-gray-900 dark:text-white sm:text-4xl lg:text-5xl'>
            Choose Your Perfect Plan
          </h2>
          <p className='mt-4 text-xl text-gray-600 dark:text-gray-300'>
            Flexible options for every student's learning journey
          </p>
        </div>

        <div className='mx-auto mb-12 flex max-w-xs justify-center'>
          <div className='relative flex w-full items-center justify-center rounded-full bg-gray-100 p-1 dark:bg-neutral-800'>
            <button className='relative w-1/2 rounded-full bg-indigo-600 px-4 py-2 text-sm font-medium text-white'>
              Monthly
            </button>
            <button className='relative w-1/2 px-4 py-2 text-sm font-medium text-gray-700 transition-colors hover:text-indigo-600 dark:text-gray-300 dark:hover:text-indigo-400'>
              Yearly
            </button>
          </div>
        </div>

        <div className='mx-auto grid max-w-6xl gap-8 lg:grid-cols-3'>
          <div className='animate__animated animate__fadeInUp rounded-2xl bg-white p-8 shadow-lg transition-all duration-300 hover:shadow-xl dark:bg-neutral-800'>
            <div className='mb-8 flex items-center justify-between'>
              <div>
                <h3 className='text-xl font-bold text-gray-900 dark:text-white'>
                  Basic
                </h3>
                <p className='mt-1 text-sm text-gray-500 dark:text-gray-400'>
                  Perfect for getting started
                </p>
              </div>
              <div className='flex h-16 w-16 items-center justify-center rounded-full bg-indigo-100 text-indigo-600 dark:bg-indigo-900/30 dark:text-indigo-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-8 w-8'
                  fill='none'
                  viewBox='0 0 24 24'
                  stroke='currentColor'
                  data-darkreader-inline-stroke=''
                  styles='--darkreader-inline-stroke: currentColor;'
                >
                  <path
                    stroke-linecap='round'
                    stroke-linejoin='round'
                    stroke-width='2'
                    d='M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4'
                  ></path>
                </svg>
              </div>
            </div>

            <div className='mb-8'>
              <p className='text-sm text-gray-500 dark:text-gray-400'>
                Starting from
              </p>
              <div className='flex items-end'>
                <span className='text-4xl font-extrabold text-gray-900 dark:text-white'>
                  Free
                </span>
                <span className='ml-1 text-base text-gray-500 dark:text-gray-400'>
                  forever
                </span>
              </div>
            </div>

            <ul className='mb-8 space-y-4'>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Access to 2 subjects
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Basic question &amp; answer
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                5 MCQ exams per month
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Community access
              </li>
              <li className='flex items-center text-gray-400 dark:text-gray-500'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Personalized study planner
              </li>
              <li className='flex items-center text-gray-400 dark:text-gray-500'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Exam challenges
              </li>
              <li className='flex items-center text-gray-400 dark:text-gray-500'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                AI-powered recommendations
              </li>
            </ul>

            <a
              href='#download'
              className='block w-full rounded-lg border-2 border-indigo-600 py-3 text-center text-base font-semibold text-indigo-600 transition-colors hover:bg-indigo-50 dark:border-indigo-500 dark:text-indigo-400 dark:hover:bg-indigo-950'
            >
              Get Started
            </a>
          </div>

          <div className='animate__animated animate__fadeInUp animate__delay-1s relative rounded-2xl bg-gradient-to-b from-indigo-50 to-white p-8 shadow-lg transition-all duration-300 hover:shadow-xl dark:from-indigo-900/20 dark:to-neutral-800'>
            <div className='absolute -top-4 right-8 rounded-full bg-gradient-to-r from-indigo-600 to-purple-600 px-4 py-1 text-xs font-semibold text-white shadow-md'>
              Most Popular
            </div>

            <div className='mb-8 flex items-center justify-between'>
              <div>
                <h3 className='text-xl font-bold text-gray-900 dark:text-white'>
                  Pro
                </h3>
                <p className='mt-1 text-sm text-gray-500 dark:text-gray-400'>
                  Perfect for dedicated students
                </p>
              </div>
              <div className='flex h-16 w-16 items-center justify-center rounded-full bg-indigo-600 text-white'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-8 w-8'
                  fill='none'
                  viewBox='0 0 24 24'
                  stroke='currentColor'
                  data-darkreader-inline-stroke=''
                  styles='--darkreader-inline-stroke: currentColor;'
                >
                  <path
                    stroke-linecap='round'
                    stroke-linejoin='round'
                    stroke-width='2'
                    d='M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z'
                  ></path>
                </svg>
              </div>
            </div>

            <div className='mb-8'>
              <p className='text-sm text-gray-500 dark:text-gray-400'>
                Starting from
              </p>
              <div className='flex items-end'>
                <span className='text-4xl font-extrabold text-gray-900 dark:text-white'>
                  $9.99
                </span>
                <span className='ml-1 text-base text-gray-500 dark:text-gray-400'>
                  /month
                </span>
              </div>
            </div>

            <ul className='mb-8 space-y-4'>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Unlimited subjects
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Advanced Q&amp;A with expert reviews
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Unlimited MCQ exams
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Enhanced community features
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Personalized study planner
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Unlimited exam challenges
              </li>
              <li className='flex items-center text-gray-400 dark:text-gray-500'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                AI-powered recommendations
              </li>
            </ul>

            <a
              href='#download'
              className='block w-full rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 py-3 text-center text-base font-semibold text-white shadow-md transition-transform hover:-translate-y-0.5'
            >
              Get Started
            </a>
          </div>

          <div className='animate__animated animate__fadeInUp animate__delay-2s rounded-2xl bg-white p-8 shadow-lg transition-all duration-300 hover:shadow-xl dark:bg-neutral-800'>
            <div className='mb-8 flex items-center justify-between'>
              <div>
                <h3 className='text-xl font-bold text-gray-900 dark:text-white'>
                  Premium
                </h3>
                <p className='mt-1 text-sm text-gray-500 dark:text-gray-400'>
                  For maximum achievement
                </p>
              </div>
              <div className='flex h-16 w-16 items-center justify-center rounded-full bg-purple-100 text-purple-600 dark:bg-purple-900/30 dark:text-purple-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-8 w-8'
                  fill='none'
                  viewBox='0 0 24 24'
                  stroke='currentColor'
                  data-darkreader-inline-stroke=''
                  styles='--darkreader-inline-stroke: currentColor;'
                >
                  <path
                    stroke-linecap='round'
                    stroke-linejoin='round'
                    stroke-width='2'
                    d='M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z'
                  ></path>
                </svg>
              </div>
            </div>

            <div className='mb-8'>
              <p className='text-sm text-gray-500 dark:text-gray-400'>
                Starting from
              </p>
              <div className='flex items-end'>
                <span className='text-4xl font-extrabold text-gray-900 dark:text-white'>
                  $19.99
                </span>
                <span className='ml-1 text-base text-gray-500 dark:text-gray-400'>
                  /month
                </span>
              </div>
            </div>

            <ul className='mb-8 space-y-4'>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Everything in Pro plan
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                1-on-1 virtual tutoring (2hrs/month)
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Priority question answering
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Advanced performance analytics
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Personalized weekly progress reports
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                Exam preparation roadmaps
              </li>
              <li className='flex items-center text-gray-600 dark:text-gray-300'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mr-3 h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
                AI-powered recommendations
              </li>
            </ul>

            <a
              href='#download'
              className='block w-full rounded-lg border-2 border-purple-600 py-3 text-center text-base font-semibold text-purple-600 transition-colors hover:bg-purple-50 dark:border-purple-500 dark:text-purple-400 dark:hover:bg-purple-950'
            >
              Get Started
            </a>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-5xl overflow-hidden rounded-xl border border-gray-200 dark:border-gray-700'>
          <div className='bg-gray-50 px-6 py-4 dark:bg-neutral-800'>
            <h3 className='text-lg font-semibold text-gray-900 dark:text-white'>
              Compare Plan Features
            </h3>
          </div>

          <div className='hidden md:grid md:grid-cols-4'>
            <div className='border-b border-r border-gray-200 bg-white px-6 py-5 dark:border-gray-700 dark:bg-neutral-900'>
              <span className='text-sm font-medium text-gray-500 dark:text-gray-400'>
                Features
              </span>
            </div>
            <div className='border-b border-r border-gray-200 bg-white px-6 py-5 text-center dark:border-gray-700 dark:bg-neutral-900'>
              <span className='text-sm font-medium text-gray-900 dark:text-white'>
                Basic
              </span>
            </div>
            <div className='border-b border-r border-gray-200 bg-indigo-50 px-6 py-5 text-center dark:border-gray-700 dark:bg-indigo-900/20'>
              <span className='text-sm font-medium text-indigo-700 dark:text-indigo-400'>
                Pro
              </span>
            </div>
            <div className='border-b border-gray-200 bg-white px-6 py-5 text-center dark:border-gray-700 dark:bg-neutral-900'>
              <span className='text-sm font-medium text-gray-900 dark:text-white'>
                Premium
              </span>
            </div>
          </div>

          <div className='divide-y divide-gray-200 dark:divide-gray-700'>
            <div className='grid grid-cols-2 md:grid-cols-4'>
              <div className='border-b border-r border-gray-200 bg-white px-6 py-5 dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <span className='text-sm font-medium text-gray-900 dark:text-white'>
                  Number of Subjects
                </span>
                <span className='mt-1 block md:hidden text-xs text-gray-500 dark:text-gray-400'>
                  How many subjects you can access
                </span>
              </div>
              <div className='border-b border-r border-gray-200 bg-white px-6 py-5 text-center dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <span className='text-sm text-gray-700 dark:text-gray-300'>
                  2 subjects
                </span>
              </div>
              <div className='border-b border-r border-gray-200 bg-indigo-50 px-6 py-5 text-center dark:border-gray-700 dark:bg-indigo-900/20 md:border-b-0'>
                <span className='text-sm font-medium text-indigo-700 dark:text-indigo-400'>
                  Unlimited
                </span>
              </div>
              <div className='border-b border-gray-200 bg-white px-6 py-5 text-center dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <span className='text-sm text-gray-700 dark:text-gray-300'>
                  Unlimited
                </span>
              </div>
            </div>

            <div className='grid grid-cols-2 md:grid-cols-4'>
              <div className='border-b border-r border-gray-200 bg-white px-6 py-5 dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <span className='text-sm font-medium text-gray-900 dark:text-white'>
                  MCQ Exams
                </span>
                <span className='mt-1 block md:hidden text-xs text-gray-500 dark:text-gray-400'>
                  Number of exams you can create
                </span>
              </div>
              <div className='border-b border-r border-gray-200 bg-white px-6 py-5 text-center dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <span className='text-sm text-gray-700 dark:text-gray-300'>
                  5 per month
                </span>
              </div>
              <div className='border-b border-r border-gray-200 bg-indigo-50 px-6 py-5 text-center dark:border-gray-700 dark:bg-indigo-900/20 md:border-b-0'>
                <span className='text-sm font-medium text-indigo-700 dark:text-indigo-400'>
                  Unlimited
                </span>
              </div>
              <div className='border-b border-gray-200 bg-white px-6 py-5 text-center dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <span className='text-sm text-gray-700 dark:text-gray-300'>
                  Unlimited
                </span>
              </div>
            </div>

            <div className='grid grid-cols-2 md:grid-cols-4'>
              <div className='border-b border-r border-gray-200 bg-white px-6 py-5 dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <span className='text-sm font-medium text-gray-900 dark:text-white'>
                  Question &amp; Answer
                </span>
                <span className='mt-1 block md:hidden text-xs text-gray-500 dark:text-gray-400'>
                  Access to Q&amp;A features
                </span>
              </div>
              <div className='border-b border-r border-gray-200 bg-white px-6 py-5 text-center dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <span className='text-sm text-gray-700 dark:text-gray-300'>
                  Basic
                </span>
              </div>
              <div className='border-b border-r border-gray-200 bg-indigo-50 px-6 py-5 text-center dark:border-gray-700 dark:bg-indigo-900/20 md:border-b-0'>
                <span className='text-sm font-medium text-indigo-700 dark:text-indigo-400'>
                  Advanced
                </span>
              </div>
              <div className='border-b border-gray-200 bg-white px-6 py-5 text-center dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <span className='text-sm text-gray-700 dark:text-gray-300'>
                  Priority
                </span>
              </div>
            </div>

            <div className='grid grid-cols-2 md:grid-cols-4'>
              <div className='border-b border-r border-gray-200 bg-white px-6 py-5 dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <span className='text-sm font-medium text-gray-900 dark:text-white'>
                  1-on-1 Tutoring
                </span>
                <span className='mt-1 block md:hidden text-xs text-gray-500 dark:text-gray-400'>
                  Access to personal tutoring
                </span>
              </div>
              <div className='border-b border-r border-gray-200 bg-white px-6 py-5 text-center dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mx-auto h-5 w-5 text-gray-400'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </div>
              <div className='border-b border-r border-gray-200 bg-indigo-50 px-6 py-5 text-center dark:border-gray-700 dark:bg-indigo-900/20 md:border-b-0'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mx-auto h-5 w-5 text-gray-400 dark:text-gray-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </div>
              <div className='border-b border-gray-200 bg-white px-6 py-5 text-center dark:border-gray-700 dark:bg-neutral-900 md:border-b-0'>
                <span className='text-sm text-gray-700 dark:text-gray-300'>
                  2 hours/month
                </span>
              </div>
            </div>

            <div className='grid grid-cols-2 md:grid-cols-4'>
              <div className='border-r border-gray-200 bg-white px-6 py-5 dark:border-gray-700 dark:bg-neutral-900'>
                <span className='text-sm font-medium text-gray-900 dark:text-white'>
                  AI Recommendations
                </span>
                <span className='mt-1 block md:hidden text-xs text-gray-500 dark:text-gray-400'>
                  Personalized content suggestions
                </span>
              </div>
              <div className='border-r border-gray-200 bg-white px-6 py-5 text-center dark:border-gray-700 dark:bg-neutral-900'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mx-auto h-5 w-5 text-gray-400'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </div>
              <div className='border-r border-gray-200 bg-indigo-50 px-6 py-5 text-center dark:border-gray-700 dark:bg-indigo-900/20'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mx-auto h-5 w-5 text-gray-400 dark:text-gray-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </div>
              <div className='bg-white px-6 py-5 text-center dark:bg-neutral-900'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='mx-auto h-5 w-5 text-green-500'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </div>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-3xl'>
          <h3 className='mb-6 text-center text-2xl font-bold text-gray-900 dark:text-white'>
            Frequently Asked Questions
          </h3>

          <div className='divide-y divide-gray-200 rounded-xl border border-gray-200 dark:divide-gray-700 dark:border-gray-700'>
            <div className='rounded-t-xl'>
              <button className='flex w-full items-center justify-between px-6 py-4 text-left'>
                <span className='text-base font-medium text-gray-900 dark:text-white'>
                  Can I change my plan later?
                </span>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5 text-indigo-600 dark:text-indigo-400'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </button>
              <div className='bg-gray-50 px-6 pb-4 pt-0 dark:bg-neutral-800'>
                <p className='text-sm text-gray-600 dark:text-gray-400'>
                  Yes, you can upgrade, downgrade, or cancel your plan at any
                  time. If you upgrade, you'll be charged the prorated amount
                  for the remainder of your billing cycle. If you downgrade, the
                  new rate will apply to your next billing cycle.
                </p>
              </div>
            </div>

            <div>
              <button className='flex w-full items-center justify-between px-6 py-4 text-left'>
                <span className='text-base font-medium text-gray-900 dark:text-white'>
                  Do you offer student discounts?
                </span>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5 text-indigo-600 dark:text-indigo-400'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </button>
            </div>

            <div>
              <button className='flex w-full items-center justify-between px-6 py-4 text-left'>
                <span className='text-base font-medium text-gray-900 dark:text-white'>
                  Can I get a refund if I'm not satisfied?
                </span>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5 text-indigo-600 dark:text-indigo-400'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </button>
            </div>

            <div className='rounded-b-xl'>
              <button className='flex w-full items-center justify-between px-6 py-4 text-left'>
                <span className='text-base font-medium text-gray-900 dark:text-white'>
                  Do you offer school or institutional plans?
                </span>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5 text-indigo-600 dark:text-indigo-400'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </button>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-5xl rounded-2xl bg-gradient-to-r from-indigo-50 to-indigo-100 p-8 dark:from-indigo-900/20 dark:to-indigo-800/20'>
          <h3 className='mb-6 text-center text-2xl font-bold text-gray-900 dark:text-white'>
            What Our Subscribers Say
          </h3>

          <div className='grid gap-6 sm:grid-cols-2 lg:grid-cols-3'>
            <div className='rounded-xl bg-white p-6 shadow-md dark:bg-neutral-800'>
              <div className='mb-4 flex items-center'>
                <div className='flex h-10 w-10 items-center justify-center rounded-full bg-indigo-100 text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-400'>
                  <span className='text-sm font-semibold'>MK</span>
                </div>
                <div className='ml-3'>
                  <h4 className='text-sm font-semibold text-gray-900 dark:text-white'>
                    Manish Kumar
                  </h4>
                  <p className='text-xs text-gray-500 dark:text-gray-400'>
                    Pro Plan · 6 months
                  </p>
                </div>
              </div>
              <div className='mb-2 flex text-yellow-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
              </div>
              <p className='text-sm text-gray-600 dark:text-gray-400'>
                "The Pro plan was exactly what I needed to boost my grades. The
                unlimited MCQ tests helped me prepare thoroughly for my exams.
                Worth every penny!"
              </p>
            </div>

            <div className='rounded-xl bg-white p-6 shadow-md dark:bg-neutral-800'>
              <div className='mb-4 flex items-center'>
                <div className='flex h-10 w-10 items-center justify-center rounded-full bg-purple-100 text-purple-700 dark:bg-purple-900/30 dark:text-purple-400'>
                  <span className='text-sm font-semibold'>SL</span>
                </div>
                <div className='ml-3'>
                  <h4 className='text-sm font-semibold text-gray-900 dark:text-white'>
                    Sarah Lee
                  </h4>
                  <p className='text-xs text-gray-500 dark:text-gray-400'>
                    Premium Plan · 1 year
                  </p>
                </div>
              </div>
              <div className='mb-2 flex text-yellow-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
              </div>
              <p className='text-sm text-gray-600 dark:text-gray-400'>
                "The 1-on-1 tutoring sessions in the Premium plan were a
                game-changer. My tutor helped me understand complex topics I was
                struggling with. Highly recommend!"
              </p>
            </div>

            <div className='rounded-xl bg-white p-6 shadow-md dark:bg-neutral-800'>
              <div className='mb-4 flex items-center'>
                <div className='flex h-10 w-10 items-center justify-center rounded-full bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400'>
                  <span className='text-sm font-semibold'>RL</span>
                </div>
                <div className='ml-3'>
                  <h4 className='text-sm font-semibold text-gray-900 dark:text-white'>
                    Ryan Lewis
                  </h4>
                  <p className='text-xs text-gray-500 dark:text-gray-400'>
                    Basic Plan · 3 months
                  </p>
                </div>
              </div>
              <div className='mb-2 flex text-yellow-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-4 w-4 text-gray-300 dark:text-gray-600'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
              </div>
              <p className='text-sm text-gray-600 dark:text-gray-400'>
                "Even the Basic plan offers great value. I've been using the
                community feature to get help with my math problems. Planning to
                upgrade to Pro soon for more features!"
              </p>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-5xl rounded-2xl bg-gradient-to-r from-indigo-600 to-purple-600 p-8 text-center shadow-xl dark:from-indigo-700 dark:to-purple-700'>
          <h3 className='text-2xl font-bold text-white'>
            Ready to Boost Your Learning?
          </h3>
          <p className='mt-4 text-indigo-100'>
            Choose the plan that works best for you and start your educational
            journey today
          </p>
          <div className='mt-8 flex flex-col items-center justify-center space-y-4 sm:flex-row sm:space-x-4 sm:space-y-0'>
            <a
              href='#download'
              className='animate__animated animate__pulse animate__infinite animate__slow inline-flex w-full items-center justify-center rounded-lg bg-white px-6 py-3 text-base font-medium text-indigo-600 shadow-lg transition-transform hover:-translate-y-0.5 hover:shadow-xl sm:w-auto'
            >
              Download App
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='ml-2 h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path
                  fill-rule='evenodd'
                  d='M16.707 10.293a1 1 0 010 1.414l-6 6a1 1 0 01-1.414 0l-6-6a1 1 0 111.414-1.414L9 14.586V3a1 1 0 012 0v11.586l4.293-4.293a1 1 0 011.414 0z'
                  clip-rule='evenodd'
                ></path>
              </svg>
            </a>
            <a
              href='#'
              className='inline-flex w-full items-center justify-center rounded-lg border-2 border-white px-6 py-3 text-base font-medium text-white hover:bg-white/10 sm:w-auto'
            >
              View Plan Details
            </a>
          </div>
        </div>
      </div>
    </section>
  )
}

export default OurPlansSection
